import 'package:flutter/material.dart';

/// {@template primary_text_button}
/// PrimaryTextButton widget.
/// {@endtemplate}
class PrimaryTextButton extends StatelessWidget {
  /// {@macro primary_Text_button}
  const PrimaryTextButton({
    required this.text,
    this.textStyle,
    this.onPressed,
    super.key,
  });

  final String text;

  final TextStyle? textStyle;

  final Function()? onPressed;

  static const Color _primaryOrange = Color(0xFFFD6C00);
  static const Color _primaryGreen = Color(0xFF4EBC73);
  static const Color _primaryDarkGrey = Color(0xFF1F1F1F);
  static const Color _primaryWhite = Color(0xFFFFFFFF);

  factory PrimaryTextButton.orange({
    BorderSide? borderSide,
    TextStyle? textStyle,
    required String text,
    Function()? onPressed,
  }) {
    return PrimaryTextButton(
      textStyle:
          textStyle?.copyWith(color: _primaryGreen) ??
          TextStyle(color: _primaryOrange),
      text: text,
      onPressed: onPressed,
    );
  }

  factory PrimaryTextButton.green({
    required String text,
    TextStyle? textStyle,
    Function()? onPressed,
  }) {
    return PrimaryTextButton(
      textStyle:
          textStyle?.copyWith(color: _primaryGreen) ??
          TextStyle(color: _primaryGreen),
      text: text,
      onPressed: onPressed,
    );
  }

  factory PrimaryTextButton.darkGrey({
    required String text,
    TextStyle? textStyle,
    Function()? onPressed,
  }) {
    return PrimaryTextButton(
      textStyle:
          textStyle?.copyWith(color: _primaryDarkGrey) ??
          TextStyle(color: _primaryDarkGrey),
      text: text,
      onPressed: onPressed,
    );
  }

  factory PrimaryTextButton.white({
    required String text,
    TextStyle? textStyle,
    Function()? onPressed,
  }) {
    return PrimaryTextButton(
      textStyle:
          textStyle?.copyWith(color: _primaryWhite) ??
          TextStyle(color: _primaryWhite),
      text: text,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(textStyle: textStyle),
      child: Text(text),
    );
  }
}
