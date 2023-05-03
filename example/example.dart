// ignore_for_file: avoid_print

import 'package:ac_inet_connectivity_checker/ac_inet_connectivity_checker.dart';

Future<void> main() async {
  final checker = InetConnectivityChecker(
    endpoint: const InetEndpoint(host: 'google.com', port: 80),
  );

  print(await checker.cancelableOperation.value);
}
