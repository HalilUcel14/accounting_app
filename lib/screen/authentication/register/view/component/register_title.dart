import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../constants/theme_constants.dart';
import 'register_constant.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      RegisterConstant.registerTitle,
      style: TextStyle(
        color: ThemeConst.primaryDarkColor,
        fontSize: context.dynamicHeight(0.05),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
