import 'package:flutter/material.dart';

/// {@template primary_filled_button}
/// PrimaryFilledButton widget.
/// {@endtemplate}
class PrimaryFilledButton extends StatelessWidget {
  /// {@macro primary_filled_button}
  const PrimaryFilledButton({
    super.key,
    this.title,
    this.child,
    required this.color, // ignore: unused_element
  });

  final String? title;

  final Widget? child;

  final Color color;

  factory PrimaryFilledButton.orange() {
    return PrimaryFilledButton(color: Colors.orange);
  }
  factory PrimaryFilledButton.blue() {
    return PrimaryFilledButton(color: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(color)),
      child: Text("hello"),
    );
  }
}

/// {@template primary_filled_button}
/// Home widget.
/// {@endtemplate}
class HomeWidget extends StatelessWidget {
  /// {@macro primary_filled_button}
  const HomeWidget({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PrimaryFilledButton.orange(),
          PrimaryFilledButton.blue(),
        ],
      ),
    );
  }
}
