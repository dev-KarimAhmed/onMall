import 'package:flutter/material.dart';
import 'package:on_mall/core/styles/images/app_assets.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: const Image(
          image: AssetImage(
            AppAssets.noNetwork,
          ),
        ),
      ),
    );
  }
}
