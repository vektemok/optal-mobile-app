import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part "roboto_text_scheme.tailor.dart";

@TailorMixin()
class RobotoTextScheme extends ThemeExtension<RobotoTextScheme>
    with _$RobotoTextSchemeTailorMixin {
  const RobotoTextScheme({
    required this.robotoS28W600,
    required this.robotoS22W600,
    required this.robotoS18W700,
    required this.robotoS18W600,
    required this.robotoS18W400,
    required this.robotoS16W800,
    required this.robotoS16W600,
    required this.robotoS16W500Orange,
    required this.robotoS16W500White,
    required this.robotoS16W500Black,
    required this.robotoS16W500DarkGrey,
    required this.robotoS16W400Black,
    required this.robotoS16W400LightGrey,
    required this.robotoS16W400White,
    required this.robotoS14W700,
    required this.robotoS14W500Orange,
    required this.robotoS14W500WGrey,
    required this.robotoS14W500White,
    required this.robotoS14W400Black,
    required this.robotoS14W400DarkGrey,
    required this.robotoS13W500,
    required this.robotoS13W400Red,
    required this.robotoS13W400Grey,
    required this.robotoS12W500,
    required this.robotoS12W400,
    required this.robotoS11W500,
    required this.robotoS11W400VeryLightGrey,
    required this.robotoS11W400White,
    required this.robotoS10W600,
    required this.robotoS10W500,
  });

  factory RobotoTextScheme.ligth() {
    return const RobotoTextScheme(
      robotoS28W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 28,
        height: 1.1, // 110%
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS22W600: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 22,
        height: 28 / 22,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS18W700: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS18W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS18W400: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 22 / 18,
        letterSpacing: 0,
        color: Color(0xFFC7C7CC),
      ),
      robotoS16W800: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 1.3,
        letterSpacing: 0,
        color: Color(0xFFFF6900),
      ),
      robotoS16W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS16W500Orange: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFD6C00),
      ),
      robotoS16W500Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS16W500DarkGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF3A3A3C),
      ),
      robotoS16W500White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS16W400Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS16W400LightGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF8E8E93),
      ),
      robotoS16W400White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W700: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS14W500Orange: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFD6C00),
      ),
      robotoS14W500WGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS14W500White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W400Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS14W400DarkGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF3A3A3C),
      ),
      robotoS13W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS13W400Grey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS13W400Red: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFFFF3347),
      ),
      robotoS12W500: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.3,
        fontSize: 12,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS12W400: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        height: 18 / 12,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS11W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS11W400VeryLightGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS11W400White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS10W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        height: 13 / 10,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS10W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        height: 12 / 10,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
    );
  }

  factory RobotoTextScheme.dark() {
    return const RobotoTextScheme(
      robotoS28W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 28,
        height: 1.1, // 110%
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS22W600: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 22,
        height: 28 / 22,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS18W700: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS18W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS18W400: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 22 / 18,
        letterSpacing: 0,
        color: Color(0xFFC7C7CC),
      ),
      robotoS16W800: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 1.3,
        letterSpacing: 0,
        color: Color(0xFFFF6900),
      ),
      robotoS16W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),

      robotoS16W500Orange: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFD6C00),
      ),
      robotoS16W500Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS16W500DarkGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF3A3A3C),
      ),
      robotoS16W500White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS16W400Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF0F0F0F),
      ),
      robotoS16W400LightGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFF8E8E93),
      ),
      robotoS16W400White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        height: 22 / 16,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W700: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W500Orange: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFD6C00),
      ),
      robotoS14W500WGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS14W500White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W400Black: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS14W400DarkGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0,
        color: Color(0xFF3A3A3C),
      ),
      robotoS13W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS13W400Grey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFF636366),
      ),
      robotoS13W400Red: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 13,
        height: 18 / 13,
        letterSpacing: 0,
        color: Color(0xFFFF3347),
      ),
      robotoS12W500: TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.3,
        fontSize: 12,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS12W400: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        height: 18 / 12,
        letterSpacing: 0,
        color: Color(0xCCFFFFFF),
      ),
      robotoS11W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFFD1D1D6),
      ),
      robotoS11W400VeryLightGrey: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFFD1D1D6),
      ),
      robotoS11W400White: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 11,
        height: 13 / 11,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS10W600: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        height: 13 / 10,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
      robotoS10W500: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        height: 12 / 10,
        letterSpacing: 0,
        color: Color(0xFFFFFFFF),
      ),
    );
  }

  @override
  final TextStyle robotoS28W600;

  @override
  final TextStyle robotoS22W600;

  @override
  final TextStyle robotoS18W700;

  @override
  final TextStyle robotoS18W600;

  @override
  final TextStyle robotoS18W400;

  @override
  final TextStyle robotoS16W800;

  @override
  final TextStyle robotoS16W600;

  @override
  final TextStyle robotoS16W500Orange;

  @override
  final TextStyle robotoS16W500Black;

  @override
  final TextStyle robotoS16W500DarkGrey;

  @override
  final TextStyle robotoS16W500White;

  @override
  final TextStyle robotoS16W400Black;

  @override
  final TextStyle robotoS16W400LightGrey;

  @override
  final TextStyle robotoS16W400White;

  @override
  final TextStyle robotoS14W700;

  @override
  final TextStyle robotoS14W500Orange;

  @override
  final TextStyle robotoS14W500WGrey;

  @override
  final TextStyle robotoS14W500White;

  @override
  final TextStyle robotoS14W400Black;

  @override
  final TextStyle robotoS14W400DarkGrey;

  @override
  final TextStyle robotoS13W500;

  @override
  final TextStyle robotoS13W400Red;

  @override
  final TextStyle robotoS13W400Grey;

  @override
  final TextStyle robotoS12W500;

  @override
  final TextStyle robotoS12W400;

  @override
  final TextStyle robotoS11W500;

  @override
  final TextStyle robotoS11W400VeryLightGrey;

  @override
  final TextStyle robotoS11W400White;

  @override
  final TextStyle robotoS10W600;

  @override
  final TextStyle robotoS10W500;
}
