// SPDX-FileCopyrightText: © 2023 - 2024 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:async/async.dart';

import 'inet_connectivity_checker_base.dart';

class InetConnectivityChecker extends InetConnectivityCheckerBase {
  InetConnectivityChecker({
    required super.endpoint,
    super.timeout,
  }) {
    _completer.completeError(UnsupportedError('JS platform'));
  }

  final _completer = CancelableCompleter<bool>();

  @override
  CancelableOperation<bool> get cancelableOperation => _completer.operation;

  @override
  void cancel() {
    cancelableOperation.cancel();
  }
}
