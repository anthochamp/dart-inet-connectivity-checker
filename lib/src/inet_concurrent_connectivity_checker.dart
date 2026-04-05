// SPDX-FileCopyrightText: © 2023 - 2026 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:async';

import 'package:async/async.dart';

import 'inet_endpoint.dart';

import 'inet_connectivity_checker_vm.dart'
    if (dart.library.html) 'inet_connectivity_checker_js.dart';

/// Checks internet connectivity by concurrently attempting TCP connections to
/// a list of [InetEndpoint]s.
///
/// Returns `true` as soon as any endpoint is reachable; returns `false` when
/// all endpoints have been tried and none succeeded, or when [timeout] expires.
///
/// Use [cancelableOperation] to await the result or cancel mid-flight.
class InetConcurrentConnectivityChecker {
  /// Default number of concurrent connection attempts.
  ///
  /// A value of 2 balances two competing concerns:
  /// - **Low latency**: starting more than one probe in parallel avoids
  ///   waiting for a timed-out host when a reachable one is further down the
  ///   list (important when probing globally distributed DNS root servers).
  /// - **Low overhead**: opening too many concurrent TCP connections increases
  ///   OS resource usage and can trigger rate-limiting on constrained networks.
  ///   2 is the empirical sweet-spot for a short, heterogeneous endpoint list.
  static const kDefaultMaxConcurrency = 2;

  /// Maximum number of connection attempts that may be in flight simultaneously.
  final int maxConcurrency;

  /// Per-endpoint connection timeout. `null` means no per-endpoint limit.
  final Duration? timeoutPerEndpoint;

  /// Overall timeout for the whole check. `null` means no overall limit.
  final Duration? timeout;

  /// Creates a checker that probes [endpoints] concurrently.
  ///
  /// Throws [ArgumentError] if [endpoints] is empty, if [maxConcurrency] is
  /// less than or equal to zero, or if [timeoutPerEndpoint] or [timeout] is
  /// negative.
  InetConcurrentConnectivityChecker({
    required Iterable<InetEndpoint> endpoints,
    this.timeoutPerEndpoint,
    this.timeout,
    int? maxConcurrency,
  }) : maxConcurrency = maxConcurrency ?? kDefaultMaxConcurrency {
    final endpointsList = endpoints.toList();
    if (endpointsList.isEmpty) {
      throw ArgumentError.value(endpoints, 'endpoints', 'must not be empty');
    }
    if (this.maxConcurrency <= 0) {
      throw ArgumentError.value(
        this.maxConcurrency,
        'maxConcurrency',
        'must be greater than zero',
      );
    }
    if (timeoutPerEndpoint != null && timeoutPerEndpoint!.isNegative) {
      throw ArgumentError.value(
        timeoutPerEndpoint,
        'timeoutPerEndpoint',
        'must not be negative',
      );
    }
    if (timeout != null && timeout!.isNegative) {
      throw ArgumentError.value(timeout, 'timeout', 'must not be negative');
    }

    _completer = CancelableCompleter<bool>(onCancel: _handleCancel);

    _endpointsIterator = endpointsList.iterator;

    if (timeout != null) {
      _timeoutTimer = Timer(timeout!, _handleTimeout);
    }

    _fillOperations();
  }

  late final CancelableCompleter<bool> _completer;
  late final Iterator<InetEndpoint> _endpointsIterator;
  final _runningOperations = <CancelableOperation<bool>>[];
  Timer? _timeoutTimer;
  bool _fillOperationsLocked = false;

  /// The [CancelableOperation] that resolves to the connectivity result.
  ///
  /// Call [CancelableOperation.cancel] to abort all in-flight probes.
  CancelableOperation<bool> get cancelableOperation => _completer.operation;

  void _clean() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    final runningOperations = [..._runningOperations];
    _runningOperations.clear();

    for (final operation in runningOperations) {
      operation.cancel();
    }
  }

  bool _canceledOrCompleted() =>
      _completer.isCanceled || _completer.isCompleted;

  void _complete(bool result) {
    if (!_canceledOrCompleted()) {
      _completer.complete(result);
    }

    _clean();
  }

  void _handleCancel() {
    _clean();
  }

  void _handleTimeout() {
    _complete(false);
  }

  void _fillOperations() {
    if (_fillOperationsLocked) return;
    _fillOperationsLocked = true;

    while (!_canceledOrCompleted() &&
        _runningOperations.length < maxConcurrency) {
      if (!_endpointsIterator.moveNext()) {
        break;
      }

      final operation =
          InetConnectivityChecker(
            endpoint: _endpointsIterator.current,
            timeout: timeoutPerEndpoint,
          ).cancelableOperation;

      _runningOperations.add(operation);

      operation.value
          .whenComplete(() {
            _runningOperations.remove(operation);
          })
          .then(
            (success) {
              if (success) {
                _complete(true);
              } else {
                _fillOperations();
              }
            },
            onError: (_) {
              _fillOperations();
            },
          );
    }

    if (_runningOperations.isEmpty) {
      _complete(false);
    }

    _fillOperationsLocked = false;
  }
}
