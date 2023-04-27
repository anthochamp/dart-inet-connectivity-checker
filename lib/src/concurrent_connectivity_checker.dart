import 'dart:async';

import 'package:async/async.dart';

import 'connectivity_checker.dart';
import 'connectivity_checker_endpoint.dart';

// TODO: replace with https://pub.dev/packages/executor

class ConcurrentConnectivityChecker {
  final int concurrency;
  final Duration? timeoutPerEndpoint;
  final Duration? timeout;
  final Function? onTimeout;

  ConcurrentConnectivityChecker({
    required Iterable<ConnectivityCheckerEndpoint> endpoints,
    required this.concurrency,
    this.timeoutPerEndpoint,
    this.timeout,
    this.onTimeout,
  }) {
    assert(concurrency > 0);

    _endpointsIter = endpoints.iterator;

    _completer = CancelableCompleter<bool>(onCancel: _onCancel);

    if (timeout != null) {
      _timeoutTimer = Timer(timeout!, _onTimeout);
    }

    _fillOperations();
  }

  late final Iterator<ConnectivityCheckerEndpoint> _endpointsIter;
  late final CancelableCompleter<bool> _completer;
  final _operations = <CancelableOperation<bool>>[];
  // TODO: Mutex
  bool _operationsLock = false;
  Timer? _timeoutTimer;

  CancelableOperation<bool> get cancelableOperation => _completer.operation;

  void _clean() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    for (final operation in _operations) {
      operation.cancel();
    }
    _operations.clear();
  }

  bool _canceledOrCompleted() {
    return _completer.isCanceled || _completer.isCompleted;
  }

  void _complete(bool result) {
    _completer.complete(result);
    _clean();
  }

  void _onCancel() {
    _clean();
  }

  void _onTimeout() {
    if (_canceledOrCompleted()) {
      return;
    }

    if (onTimeout != null) onTimeout!();

    _complete(false);
  }

  void _fillOperations() {
    if (_operationsLock) return;
    _operationsLock = true;

    while (!_canceledOrCompleted() && _operations.length < concurrency) {
      if (!_endpointsIter.moveNext()) {
        break;
      }

      final operation = ConnectivityChecker(
        endpoint: _endpointsIter.current,
        timeout: timeoutPerEndpoint,
      ).cancelableOperation;

      _operations.add(operation);

      operation.value.whenComplete(() {
        _operations.remove(operation);
      }).then(
        (value) {
          if (value) {
            _complete(true);
          } else {
            _fillOperations();
          }
        },
        onError: (Object _) {
          _fillOperations();
        },
      );
    }

    if (_operations.isEmpty) {
      _complete(false);
    }

    _operationsLock = false;
  }
}
