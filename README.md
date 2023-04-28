# A simple Internet Connectivity Checker

An Internet Connectivity Checker :
- Which can test single or multiple endpoints (with configurable concurrency),
- Which do not depends on any protocol (uses Dart's socket connection),
- Which is cancellable and support both global and per endpoint timeouts,
- Which keep it simple. It is stateless.

**This package is not meant to be used with Flutter on the Web**

If you search for a stateful Internet Connectivity Checker, check out these packages :
- [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus)
- [ac_connectivity_plus_extended](https://pub.dev/packages/ac_connectivity_plus_extended)

## Usage

### Test on a single endpoint

```dart
final checker = InetConnectivityChecker(
  endpoint: InetEndpoint(host: 'google.com', port: 443),
  // optional timeout. if unspecified the operating system 
  // default connect timeout will be used instead (~120s).
  timeout: const Duration(seconds: 10),
);

// tired of waiting?
// checker.cancel();
```

### Test on multiple endpoints

```dart
final checker = InetConcurrentConnectivityChecker(
  endpoints: [
    InetEndpoint(host: '8.8.8.8', port: 53),
    InetEndpoint(host: 'google.com', port: 443),
    InetEndpoint(host: 'github.com', port: 443),
  ],
  
  // optional global timeout. 
  timeout: const Duration(seconds: 10),

  // optional per endpoint timeout. if unspecified the operating 
  // system default connect timeout will be used instead (~120s).
  timeoutPerEndpoint: const Duration(seconds: 10),

  // optionally, define the maximum concurrency (default is 2)
  maxConcurrency: 4,
);
```

## Which endpoints to use?

If you want to test for an Internet connection, you might as well want to use the endpoints that are the less-likely to be down. 

The plugin provides the list of all the IPv4 and IPv6 addresses for the [root name servers](https://www.internic.net/domain/named.root). 

Be-aware that it is more than likely that your application will have to be compatible with both IPv4-only and IPv6-only network. My advice is to mix and randomize those two lists and use the concurrent connectivity checker to test for an Internet connection.

```dart
final endpoints = [
  ...kRootNameServersIpV4Endpoints,
  ...kRootNameServersIpV6Endpoints,
].shuffle();
```

## Internet Connection Check for Flutter on the Web

For testing Internet connection for Flutter Web, I recommended that you either use the [connectivity_plus](https://pub.dev/packages/connectivity_plus) plugin :

```dart 
import 'package:connectivity_plus/connectivity_plus.dart';

final result = await Connectivity().checkConnectivity();

if (result == ConnectivitResult.none) {
  // not connected to the Internet
} else {
  // connected to the Internet
}
```

Or the [ac_connectivity_plus_extended](https://pub.dev/packages/ac_connectivity_plus_extended) package which extend connectivity_plus with safe Internet connectivity checks.