// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visual_elements.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$VisualElementsTailorMixin on ThemeExtension<VisualElements> {
  PrimaryFilledButton get primartyFilledButton;

  @override
  VisualElements copyWith({PrimaryFilledButton? primartyFilledButton}) {
    return VisualElements(
      primartyFilledButton: primartyFilledButton ?? this.primartyFilledButton,
    );
  }

  @override
  VisualElements lerp(
    covariant ThemeExtension<VisualElements>? other,
    double t,
  ) {
    if (other is! VisualElements) return this as VisualElements;
    return VisualElements(
      primartyFilledButton: t < 0.5
          ? primartyFilledButton
          : other.primartyFilledButton,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VisualElements &&
            const DeepCollectionEquality().equals(
              primartyFilledButton,
              other.primartyFilledButton,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primartyFilledButton),
    );
  }
}

extension VisualElementsBuildContextProps on BuildContext {
  VisualElements get visualElements =>
      Theme.of(this).extension<VisualElements>()!;
  PrimaryFilledButton get primartyFilledButton =>
      visualElements.primartyFilledButton;
}
