import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/theme/font/optal_fonts.dart';
import 'package:optal_mobile/src/core/theme/visual_elements/visual_elements.dart';
import 'package:optal_mobile/src/core/widget/primary_filled_button.dart';

class OptalApp extends ConsumerWidget {
  const OptalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Key builderKey = GlobalKey();

    return MaterialApp(
      title: 'Optal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(extensions: [optalFonts, visualElements]),
      home: HomeWidget(),
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
    return ElevatedButton(onPressed: () {}, child: const Text("hello"));
  }
}
