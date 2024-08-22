import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuncie_flutter_test/presentation/app.dart';

import 'data/network/network_config.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        NetworkConfig.provider.overrideWithValue(_networkConfig),
      ],
      child: const App(),
    ),
  );
}

const _networkConfig = NetworkConfig(
  accessToken: String.fromEnvironment('ACCESS_TOKEN'),
);
