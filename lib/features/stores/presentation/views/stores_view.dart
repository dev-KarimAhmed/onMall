import 'package:flutter/material.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stores")),
      body: const Center(child: Text("Stores Page")),
    );
  }
}