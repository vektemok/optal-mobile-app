import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/widget/home_screen.dart';

class OptalApp extends ConsumerWidget {
  const OptalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Key builderKey = GlobalKey();

    return MaterialApp(
      title: 'Optal',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      builder: (context, child) => MediaQuery(
        key: builderKey,
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child ?? SizedBox.shrink(),
      ),
    );
  }
}
