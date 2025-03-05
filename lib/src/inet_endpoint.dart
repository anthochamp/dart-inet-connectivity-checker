// SPDX-FileCopyrightText: © 2023 - 2024 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:freezed_annotation/freezed_annotation.dart';

part 'inet_endpoint.freezed.dart';

@freezed
class InetEndpoint with _$InetEndpoint {
  const factory InetEndpoint({required String host, required int port}) =
      _InetEndpoint;
}
