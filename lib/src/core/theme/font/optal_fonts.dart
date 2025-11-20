import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part "optal_fonts.tailor.dart";

@TailorMixin()
class OptalFonts extends ThemeExtension<OptalFonts>
    with _$OptalFontsTailorMixin {
  OptalFonts({
    required this.robotoS22W600,
    required this.robotoS18W700,
    required this.robotoS18W600,
    required this.robotoS16W600,
    required this.robotoS16W500,
    required this.robotoS16W400,
    required this.robotoS14W700,
    required this.robotoS14W500,
    required this.robotoS14W400,
    required this.robotoS12W500,
    required this.robotoS12W400,
    required this.robotoS11W500,
    required this.robotoS11W400,
    required this.robotoS10W600,
    required this.robotoS10W500,
  });

  @override
  final TextStyle robotoS22W600;

  @override
  final TextStyle robotoS18W700;

  @override
  final TextStyle robotoS18W600;

  @override
  final TextStyle robotoS16W600;

  @override
  final TextStyle robotoS16W500;

  @override
  final TextStyle robotoS16W400;

  @override
  final TextStyle robotoS14W700;

  @override
  final TextStyle robotoS14W500;

  @override
  final TextStyle robotoS14W400;

  @override
  final TextStyle robotoS12W500;

  @override
  final TextStyle robotoS12W400;

  @override
  final TextStyle robotoS11W500;

  @override
  final TextStyle robotoS11W400;

  @override
  final TextStyle robotoS10W600;

  @override
  final TextStyle robotoS10W500;
}

final optalFonts = OptalFonts(
  robotoS22W600: TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
  ),
  robotoS18W700: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 18,
    height: 24 / 18,
    letterSpacing: 0,
  ),
  robotoS18W600: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 18,
    height: 24 / 18,
    letterSpacing: 0,
  ),
  robotoS16W600: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 22 / 16,
    letterSpacing: 0,
  ),
  robotoS16W500: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 22 / 16,
    letterSpacing: 0,
  ),
  robotoS16W400: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    height: 22 / 16,
    letterSpacing: 0,
  ),
  robotoS14W700: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  ),
  robotoS14W500: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  ),
  robotoS14W400: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  ),
  robotoS12W500: TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.3,
    fontSize: 12,
    letterSpacing: 0,
  ),
  robotoS12W400: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 18 / 12,
    letterSpacing: 0,
  ),
  robotoS11W500: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 11,
    height: 13 / 11,
    letterSpacing: 0,
  ),
  robotoS11W400: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 11,
    height: 13 / 11,
    letterSpacing: 0,
  ),
  robotoS10W600: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 10,
    height: 13 / 10,
    letterSpacing: 0,
  ),
  robotoS10W500: TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 10,
    height: 12 / 10,
    letterSpacing: 0,
  ),
);
