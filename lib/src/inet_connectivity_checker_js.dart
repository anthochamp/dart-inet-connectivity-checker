// SPDX-FileCopyrightText: © 2023 - 2026 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:async/async.dart';

import 'inet_connectivity_checker_base.dart';

/// JS-platform stub for [InetConnectivityCheckerBase].
///
/// Raw TCP sockets are not available in JavaScript environments. Constructing
/// this class always produces a [CancelableOperation] that fails with an
/// [UnsupportedError] when awaited. **The error is deferred** — it surfaces
/// only when the caller awaits [cancelableOperation], not at construction time.
/// This matches the factory pattern used via conditional imports; callers
/// should treat a completed operation with an error as "unsupported" and
/// disable the feature at the call site.
class InetConnectivityChecker extends InetConnectivityCheckerBase {
  InetConnectivityChecker({required super.endpoint, super.timeout}) {
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
