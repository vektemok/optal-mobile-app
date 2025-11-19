// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'colors.dart';

// // **************************************************************************
// // TailorAnnotationsGenerator
// // **************************************************************************

// mixin _$MyColorsTailorMixin on ThemeExtension<MyColors> {
//   Color get orange;
//   Color get blue;

//   @override
//   MyColors copyWith({Color? orange, Color? blue}) {
//     return MyColors(orange: orange ?? this.orange, blue: blue ?? this.blue);
//   }

//   @override
//   MyColors lerp(covariant ThemeExtension<MyColors>? other, double t) {
//     if (other is! MyColors) return this as MyColors;
//     return MyColors(
//       orange: Color.lerp(orange, other.orange, t)!,
//       blue: Color.lerp(blue, other.blue, t)!,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is MyColors &&
//             const DeepCollectionEquality().equals(orange, other.orange) &&
//             const DeepCollectionEquality().equals(blue, other.blue));
//   }

//   @override
//   int get hashCode {
//     return Object.hash(
//       runtimeType.hashCode,
//       const DeepCollectionEquality().hash(orange),
//       const DeepCollectionEquality().hash(blue),
//     );
//   }
// }

// extension MyColorsBuildContextProps on BuildContext {
//   MyColors get myColors => Theme.of(this).extension<MyColors>()!;
//   Color get orange => myColors.orange;
//   Color get blue => myColors.blue;
// }
