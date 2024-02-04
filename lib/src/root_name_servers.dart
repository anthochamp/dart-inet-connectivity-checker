// SPDX-FileCopyrightText: © 2023 - 2024 Anthony Champagne <dev@anthonychampagne.fr>
//
// SPDX-License-Identifier: BSD-3-Clause

import 'inet_endpoint.dart';

// https://www.internic.net/domain/named.root

const kRootNameServersIpV4Addresses = <String>[
  /// a.root-servers.net - Verisign, Inc.
  '198.41.0.4',

  /// b.root-servers.net - University of Southern California, Information Sciences Institute
  '199.9.14.201',

  /// c.root-servers.net - Cogent Communications
  '192.33.4.12',

  /// d.root-servers.net - University of Maryland
  '199.7.91.13',

  /// e.root-servers.net - NASA (Ames Research Center)
  '192.203.230.10',

  /// f.root-servers.net - Internet Systems Consortium, Inc.
  '192.5.5.241',

  /// g.root-servers.net - US Department of Defense (NIC)
  '192.112.36.4',

  /// h.root-servers.net - US Army (Research Lab)
  '198.97.190.53',

  /// i.root-servers.net - Netnod
  '192.36.148.17',

  /// j.root-servers.net - Verisign, Inc.
  '192.58.128.30',

  /// k.root-servers.net - RIPE NCC
  '193.0.14.129',

  /// l.root-servers.net - ICANN
  '199.7.83.42',

  /// m.root-servers.net - WIDE Project
  '202.12.27.33',
];

const kRootNameServersIpV6Addresses = <String>[
  /// a.root-servers.net - Verisign, Inc.
  '2001:503:ba3e::2:30',

  /// b.root-servers.net - University of Southern California, Information Sciences Institute
  '2001:500:200::b',

  /// c.root-servers.net - Cogent Communications
  '2001:500:2::c',

  /// d.root-servers.net - University of Maryland
  '2001:500:2d::d',

  /// e.root-servers.net - NASA (Ames Research Center)
  '2001:500:a8::e',

  /// f.root-servers.net - Internet Systems Consortium, Inc.
  '2001:500:2f::f',

  /// g.root-servers.net - US Department of Defense (NIC)
  '2001:500:12::d0d',

  /// h.root-servers.net - US Army (Research Lab)
  '2001:500:1::53',

  /// i.root-servers.net - Netnod
  '2001:7fe::53',

  /// j.root-servers.net - Verisign, Inc.
  '2001:503:c27::2:30',

  /// k.root-servers.net - RIPE NCC
  '2001:7fd::1',

  /// l.root-servers.net - ICANN
  '2001:500:9f::42',

  /// m.root-servers.net - WIDE Project
  '2001:dc3::35',
];

const kDnsServerTcpPort = 53;

final kRootNameServersIpV4Endpoints = kRootNameServersIpV4Addresses.map(
  (ip) => InetEndpoint(host: ip, port: kDnsServerTcpPort),
);

final kRootNameServersIpV6Endpoints = kRootNameServersIpV6Addresses.map(
  (ip) => InetEndpoint(host: ip, port: kDnsServerTcpPort),
);
