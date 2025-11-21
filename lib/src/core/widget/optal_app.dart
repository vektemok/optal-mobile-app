import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/uikit/button/primary_filled_button.dart';
import 'package:optal_mobile/src/core/uikit/text/roboto_text_scheme.dart';

class OptalApp extends ConsumerWidget {
  const OptalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Key builderKey = GlobalKey();

    return MaterialApp(
      title: 'Optal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(extensions: [RobotoTextScheme.ligth()]),
      home: Home(),
      builder: (context, child) => MediaQuery(
        key: builderKey,
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child ?? SizedBox.shrink(),
      ),
    );
  }
}

/// {@template optal_app}
/// Home widget.
/// {@endtemplate}
class Home extends StatelessWidget {
  /// {@macro optal_app}
  const Home({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: PrimaryFilledButton.orange()));
  }
}
