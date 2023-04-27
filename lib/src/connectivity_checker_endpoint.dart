import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_checker_endpoint.freezed.dart';

@freezed
class ConnectivityCheckerEndpoint with _$ConnectivityCheckerEndpoint {
  const factory ConnectivityCheckerEndpoint({
    required dynamic host,
    required int port,
  }) = _ConnectivityCheckerEndpoint;
}
