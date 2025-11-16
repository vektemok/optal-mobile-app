import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FabricScreen extends ConsumerStatefulWidget {
  const FabricScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FabricScreenState();
}

class _FabricScreenState extends ConsumerState<FabricScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text("Penis")),
      ),
    );
  }
}
