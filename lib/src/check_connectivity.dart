import 'package:async/async.dart';

import 'concurrent_connectivity_checker.dart';
import 'connectivity_checker_endpoint.dart';

const int kDefaultConcurrentConnectivityCheck = 4;

/// if timeout is reached, it will complete with no connectivity.
CancelableOperation<bool> checkConnectivity(
  Iterable<ConnectivityCheckerEndpoint> endpoints, {
  int? concurrency,
  Duration? timeoutPerEndpoint,
  Duration? timeout,
  Function? onTimeout,
}) {
  assert(endpoints.isNotEmpty);
  assert(concurrency == null || concurrency > 0);
  assert(timeoutPerEndpoint?.isNegative != true);
  assert(timeout?.isNegative != true);

  return ConcurrentConnectivityChecker(
    endpoints: endpoints,
    concurrency: concurrency ?? kDefaultConcurrentConnectivityCheck,
    timeoutPerEndpoint: timeoutPerEndpoint,
    timeout: timeout,
    onTimeout: onTimeout,
  ).cancelableOperation;
}
