// Copyright 2023, Anthony Champagne. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:async/async.dart';

import 'inet_connectivity_checker.dart';
import 'inet_endpoint.dart';

class InetConcurrentConnectivityChecker {
  static const kDefaultMaxConcurrency = 2;

  final int maxConcurrency;
  final Duration? timeoutPerEndpoint;
  final Duration? timeout;

  InetConcurrentConnectivityChecker({
    required Iterable<InetEndpoint> endpoints,
    this.timeoutPerEndpoint,
    this.timeout,
    int? maxConcurrency,
  }) : maxConcurrency = maxConcurrency ?? kDefaultMaxConcurrency {
    assert(endpoints.isNotEmpty);
    assert(this.maxConcurrency > 0);
    assert(timeoutPerEndpoint?.isNegative != true);
    assert(timeout?.isNegative != true);

    _completer = CancelableCompleter<bool>(onCancel: _handleCancel);

    _endpointsIterator = endpoints.iterator;

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

    while (
        !_canceledOrCompleted() && _runningOperations.length < maxConcurrency) {
      if (!_endpointsIterator.moveNext()) {
        break;
      }

      final operation = InetConnectivityChecker(
        endpoint: _endpointsIterator.current,
        timeout: timeoutPerEndpoint,
      ).cancelableOperation;

      _runningOperations.add(operation);

      operation.value.whenComplete(() {
        _runningOperations.remove(operation);
      }).then(
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
