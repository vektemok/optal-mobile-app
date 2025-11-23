import 'package:flutter/material.dart';

/// {@template primary_filled_button}
/// PrimaryFilledButton widget.
/// {@endtemplate}
class PrimaryFilledButton extends StatelessWidget {
  /// {@macro primary_filled_button}
  const PrimaryFilledButton({
    this.title,
    required this.borderSide,
    required this.color,
    this.child,
    super.key,
  });

  final String? title;

  final Widget? child;

  final Color color;

  final BorderSide? borderSide;

  factory PrimaryFilledButton.orange(
    Color? backgroundColor,
    BorderSide? borderSide,
  ) {
    return PrimaryFilledButton(
      color: backgroundColor ?? Colors.orange,
      borderSide:
          borderSide ??
          BorderSide(), // Настрой зедсь так чтобы совпадало по стилю ,
    ); // Вызови из цветовой палитры если нету зависимости
  }

  // factory PrimaryFilledButton.blue() {
  //   return PrimaryFilledButton(color: Colors.blue);
  // }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},

      /// Здесь выведи стиль который будет приниматься пль
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(color),
        side: WidgetStatePropertyAll<BorderSide?>(borderSide),
      ),
      child: Text("hello"),
    );
  }
}
