import 'package:flutter/material.dart';

/// {@template primary_filled_button}
/// PrimaryFilledButton widget.
/// {@endtemplate}
class PrimaryFilledButton extends StatelessWidget {
  /// {@macro primary_filled_button}
  const PrimaryFilledButton({
    this.title,
    required this.color,
    this.borderSide,
    this.onPressed,
    this.child,
    super.key,
  }) : assert(
         title == null && child == null,
         "Можно указать только title или chiild",
       );

  final String? title;

  final Widget? child;

  final Color color;

  final BorderSide? borderSide;

  final Function()? onPressed;

  static const Color _primaryOrange = Color(0xFFFD6C00);
  static const Color _primaryGreen = Color(0xFF4EBC73);
  static const Color _primaryDarkGrey = Color(0xFF1F1F1F);
  static const Color _primaryWhite = Color(0xFFFFFFFF);

  factory PrimaryFilledButton.orange({
    Color? backgroundColor,
    BorderSide? borderSide,
    Widget? child,
    String? title,
    Function()? onPressed,
  }) {
    return PrimaryFilledButton(
      color: backgroundColor ?? _primaryOrange,
      borderSide:
          borderSide ??
          BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.none,
          ), // Настрой зедсь так чтобы совпадало по стилю,
      title: title,
      onPressed: onPressed,
      child: child,
    ); // Вызови из цветовой палитры если нету зависимости
  }

  factory PrimaryFilledButton.green({
    Color? backgroundColor,
    BorderSide? borderSide,
    Widget? child,
    String? title,
    Function()? onPressed,
  }) {
    return PrimaryFilledButton(
      color: backgroundColor ?? _primaryGreen,
      borderSide:
          borderSide ??
          BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.none,
          ),
      title: title,
      onPressed: onPressed,
      child: child,
    );
  }

  factory PrimaryFilledButton.darkGrey({
    Color? backgroundColor,
    BorderSide? borderSide,
    Function()? onPressed,
    Widget? child,
    String? title,
  }) {
    return PrimaryFilledButton(
      color: backgroundColor ?? _primaryDarkGrey,
      borderSide:
          borderSide ??
          BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.none,
          ),
      title: title,
      onPressed: onPressed,
      child: child,
    );
  }

  factory PrimaryFilledButton.white({
    Color? backgroundColor,
    BorderSide? borderSide,
    Widget? child,
    String? title,
    Function()? onPressed,
  }) {
    return PrimaryFilledButton(
      color: backgroundColor ?? _primaryWhite,
      borderSide:
          borderSide ??
          BorderSide(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.none,
          ),
      title: title,
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,

      /// Здесь выведи стиль который будет приниматься пль
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(color),
        side: WidgetStatePropertyAll<BorderSide?>(borderSide),
      ),
      child: child ?? Text(title ?? ""),
    );
  }
}
