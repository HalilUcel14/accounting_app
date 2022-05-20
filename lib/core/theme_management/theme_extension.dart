import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'i_theme_manager.dart';
import 'theme_manager.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => watch<ThemeManager>().currentTheme;
}

extension ThemeEnumExtension on ThemeEnum {
  static ThemeData methemes = ThemeData();
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.LIGHT:
      //return ThemeLight.instance.theme!;
      case ThemeEnum.DARK:
      // return ThemeDark.instance.theme!;
      default:
        return methemes;
      //   return ThemeLight.instance.theme!;

    }
  }
}
