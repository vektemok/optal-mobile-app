// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
import 'package:flutter/widgets.dart';

class Icomoon {
  Icomoon._();

  static const String _fontFamily = 'icomoon';

  static const IconData arrowLeft = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData xmark = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData searchLoop = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData locationTick = IconData(
    0xe90a,
    fontFamily: _fontFamily,
  );
  static const IconData checkBoxBlank = IconData(
    0xe904,
    fontFamily: _fontFamily,
  );
  static const IconData checkOrange = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData checkBoxOrange = IconData(
    0xe900,
    fontFamily: _fontFamily,
  );
  static const IconData crownSimple = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData callCalling = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData arrowLeftIos = IconData(
    0xe906,
    fontFamily: _fontFamily,
  );
}
