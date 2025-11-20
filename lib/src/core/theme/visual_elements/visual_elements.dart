import 'package:flutter/material.dart';
import 'package:optal_mobile/src/core/widget/primary_filled_button.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'visual_elements.tailor.dart';

@TailorMixin()
class VisualElements extends ThemeExtension<VisualElements>
    with _$VisualElementsTailorMixin {
  VisualElements({required this.primartyFilledButton});

  @override
  final PrimaryFilledButton primartyFilledButton;
}

final visualElements = VisualElements(
  primartyFilledButton: PrimaryFilledButton.blue(),
);
