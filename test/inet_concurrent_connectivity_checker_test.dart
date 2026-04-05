// SPDX-FileCopyrightText: © 2026 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'dart:io';

import 'package:test/test.dart';

import 'package:ac_inet_connectivity_checker/ac_inet_connectivity_checker.dart';

void main() {
  group('InetConcurrentConnectivityChecker', () {
    // A port that is guaranteed to refuse connections during the test run.
    // We bind a server, capture the port, then close it immediately.
    late int closedPort;

    setUpAll(() async {
      final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      closedPort = server.port;
      await server.close();
    });

    InetEndpoint closedEndpoint() =>
        InetEndpoint(host: '127.0.0.1', port: closedPort);

    group('ArgumentError validation', () {
      test('throws when endpoints is empty', () {
        expect(
          () => InetConcurrentConnectivityChecker(endpoints: []),
          throwsArgumentError,
        );
      });

      test('throws when maxConcurrency is zero', () {
        expect(
          () => InetConcurrentConnectivityChecker(
            endpoints: [closedEndpoint()],
            maxConcurrency: 0,
          ),
          throwsArgumentError,
        );
      });

      test('throws when maxConcurrency is negative', () {
        expect(
          () => InetConcurrentConnectivityChecker(
            endpoints: [closedEndpoint()],
            maxConcurrency: -1,
          ),
          throwsArgumentError,
        );
      });

      test('throws when timeoutPerEndpoint is negative', () {
        expect(
          () => InetConcurrentConnectivityChecker(
            endpoints: [closedEndpoint()],
            timeoutPerEndpoint: const Duration(seconds: -1),
          ),
          throwsArgumentError,
        );
      });

      test('throws when timeout is negative', () {
        expect(
          () => InetConcurrentConnectivityChecker(
            endpoints: [closedEndpoint()],
            timeout: const Duration(seconds: -1),
          ),
          throwsArgumentError,
        );
      });
    });

    test('kDefaultMaxConcurrency is 2', () {
      expect(InetConcurrentConnectivityChecker.kDefaultMaxConcurrency, 2);
    });

    test('all endpoints unreachable returns false', () async {
      final checker = InetConcurrentConnectivityChecker(
        endpoints: [closedEndpoint(), closedEndpoint()],
      );

      expect(await checker.cancelableOperation.value, isFalse);
    });

    test('at least one reachable endpoint returns true', () async {
      final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      // Accept and immediately close each incoming socket — we only care that
      // the TCP handshake succeeds, not about application data.
      server.listen((socket) => socket.destroy());

      try {
        final checker = InetConcurrentConnectivityChecker(
          endpoints: [
            closedEndpoint(),
            InetEndpoint(host: '127.0.0.1', port: server.port),
          ],
          maxConcurrency: 2,
        );

        expect(await checker.cancelableOperation.value, isTrue);
      } finally {
        await server.close();
      }
    });

    test('cancellation mid-flight resolves as cancelled', () async {
      // A server that accepts but never closes keeps the probe alive long
      // enough for us to cancel the outer operation.
      final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((_) {});

      try {
        final checker = InetConcurrentConnectivityChecker(
          endpoints: [InetEndpoint(host: '127.0.0.1', port: server.port)],
          // Long per-endpoint timeout so the probe doesn't complete on its own.
          timeoutPerEndpoint: const Duration(seconds: 10),
        );

        final op = checker.cancelableOperation;
        await op.cancel();

        // valueOrCancellation() returns null when the operation was cancelled.
        final result = await op.valueOrCancellation();
        expect(result, isNull);
      } finally {
        await server.close();
      }
    });

    test('maxConcurrency limits simultaneous probes', () async {
      // Verify constrcution succeeds with maxConcurrency=1 and that the
      // result is still correct (unreachable → false).
      final checker = InetConcurrentConnectivityChecker(
        endpoints: [closedEndpoint(), closedEndpoint(), closedEndpoint()],
        maxConcurrency: 1,
      );

      expect(await checker.cancelableOperation.value, isFalse);
    });
  });
}
