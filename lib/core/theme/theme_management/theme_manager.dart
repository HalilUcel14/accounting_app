import 'package:flutter/material.dart';

import 'i_theme_manager.dart';
import 'theme_extension.dart';

class ThemeManager extends ChangeNotifier implements IThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeManager._init();

  @override
  ThemeData currentTheme = ThemeEnum.LIGHT.generateTheme;

  @override
  ThemeEnum currentThemeEnum = ThemeEnum.LIGHT;

  @override
  void changeTheme(ThemeEnum themes) {
    if (themes != currentThemeEnum) {
      currentTheme = themes.generateTheme;
      currentThemeEnum = themes;
      notifyListeners();
    }
    return;
  }
}
