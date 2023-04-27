import 'dart:async';
import 'dart:io' as io;

import 'package:async/async.dart';

import 'connectivity_checker_endpoint.dart';

class ConnectivityChecker {
  final ConnectivityCheckerEndpoint endpoint;
  final Duration? timeout;
  final Function? onTimeout;
  final Function(Object, StackTrace)? onError;

  ConnectivityChecker({
    required this.endpoint,
    this.timeout,
    this.onTimeout,
    this.onError,
  }) {
    _start();
  }

  late CancelableCompleter<bool> _completer;
  io.ConnectionTask<io.Socket>? _connectionTask;
  Timer? _timeoutTimer;

  CancelableOperation<bool> get cancelableOperation => _completer.operation;

  void _start() {
    _completer = CancelableCompleter<bool>(onCancel: _onCancel);

    io.Socket.startConnect(endpoint.host, endpoint.port).then(
      (task) {
        _connectionTask = task
          ..socket.then(
            _onSuccess,
            onError: _onError,
          );

        if (timeout != null) {
          _timeoutTimer = Timer(timeout!, _onTimeout);
        }
      },
      onError: _onError,
    );
  }

  void _clean() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _connectionTask?.cancel();
    _connectionTask = null;
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

  void _onSuccess(io.Socket socket) {
    socket.destroy();

    _complete(true);
  }

  void _onError(Object error, StackTrace stackTrace) {
    if (_canceledOrCompleted()) {
      return;
    }

    if (onError != null) onError!(error, stackTrace);

    _complete(false);
  }

  void _onTimeout() {
    if (_canceledOrCompleted()) {
      return;
    }

    if (onTimeout != null) onTimeout!();

    _complete(false);
  }
}
