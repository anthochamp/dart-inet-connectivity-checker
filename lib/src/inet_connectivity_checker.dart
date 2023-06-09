// Copyright 2023, Anthony Champagne. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';

import 'inet_endpoint.dart';

class InetConnectivityChecker {
  final InetEndpoint endpoint;
  final Duration? timeout;

  InetConnectivityChecker({
    required this.endpoint,
    this.timeout,
  }) {
    _completer = CancelableCompleter<bool>(onCancel: () {
      _connectionTask?.cancel();
    });

    unawaited(_connect());
  }

  late final CancelableCompleter<bool> _completer;
  ConnectionTask<Socket>? _connectionTask;

  CancelableOperation<bool> get cancelableOperation => _completer.operation;

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
