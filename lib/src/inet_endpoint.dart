// Copyright 2023, Anthony Champagne. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'inet_endpoint.freezed.dart';

@freezed
class InetEndpoint with _$InetEndpoint {
  const factory InetEndpoint({
    required String host,
    required int port,
  }) = _InetEndpoint;
}
