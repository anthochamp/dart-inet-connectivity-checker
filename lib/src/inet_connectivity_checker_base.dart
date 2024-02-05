// SPDX-FileCopyrightText: © 2023 - 2024 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:async/async.dart';

import 'inet_endpoint.dart';

abstract class InetConnectivityCheckerBase {
  final InetEndpoint endpoint;
  final Duration? timeout;

  InetConnectivityCheckerBase({
    required this.endpoint,
    this.timeout,
  });

  CancelableOperation<bool> get cancelableOperation;

  void cancel();
}
