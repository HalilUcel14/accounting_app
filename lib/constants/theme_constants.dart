import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ThemeConst {
  static ThemeConst? _instance;
  static ThemeConst get instance {
    _instance ??= ThemeConst._init();
    return _instance!;
  }

  ThemeConst._init();

  static const Color primaryColor = Color(0xFFfdb813);
  static const Color primaryLightColor = Color(0xFFffd161);
  static const Color primaryDarkColor = Color(0xFFd59700);

  TextStyle onboardTitleStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: context.heightM,
        fontWeight: FontWeight.bold,
      );
  TextStyle onboardDescriptionStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: context.heightS,
        fontWeight: FontWeight.normal,
      );
}
