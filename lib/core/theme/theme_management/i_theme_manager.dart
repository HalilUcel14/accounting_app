// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class IThemeManager {
  late ThemeData currentTheme;
  late ThemeEnum currentThemeEnum;

  void changeTheme(ThemeEnum themes);
}

enum ThemeEnum { LIGHT, DARK }
