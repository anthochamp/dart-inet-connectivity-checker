// SPDX-FileCopyrightText: © 2023 - 2024 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';

import 'inet_connectivity_checker_base.dart';

class InetConnectivityChecker extends InetConnectivityCheckerBase {
  InetConnectivityChecker({
    required super.endpoint,
    super.timeout,
  }) {
    _completer = CancelableCompleter<bool>(onCancel: () {
      _connectionTask?.cancel();
    });

    unawaited(_connect());
  }

  late final CancelableCompleter<bool> _completer;
  ConnectionTask<Socket>? _connectionTask;

  @override
  CancelableOperation<bool> get cancelableOperation => _completer.operation;

  @override
  void cancel() {
    cancelableOperation.cancel();
  }

  Future<void> _connect() async {
    _connectionTask = await Socket.startConnect(endpoint.host, endpoint.port);

    Future future = _connectionTask!.socket;

    if (timeout != null) {
      future = future.timeout(timeout!);
    }

    unawaited(future.then(
      (socket) {
        socket.destroy();

        _completer.complete(true);
      },
      onError: (_) {
        _completer.complete(false);
      },
    ));
  }
}
