import 'package:flutter/material.dart';

import '../../../../../constants/theme_constants.dart';

class ForgotConstant {
  static const String forgot = 'FORGOT';

  TextStyle forgotButtonStyle() => const TextStyle(
        color: ThemeConst.primaryDarkColor,
        fontWeight: FontWeight.bold,
      );
}
