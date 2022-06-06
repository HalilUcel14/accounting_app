import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../constants/theme_constants.dart';

class LoginConstant {
  static const String loginTitle = "Login";
  static const String loginSubTitle = 'Please sign in to continue';

  TextStyle loginStyle(BuildContext context) => TextStyle(
        color: ThemeConst.primaryDarkColor,
        fontSize: context.dynamicHeight(0.05),
        fontWeight: FontWeight.bold,
      );

  TextStyle loginSubStyle(BuildContext context) => TextStyle(
        fontSize: context.heightS,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      );

  InputDecoration emailInputDecoration(BuildContext context) {
    return InputDecoration(
      enabled: true,
      hintText: "Please Enter Your EMail",
      labelText: "Email",
      labelStyle: const TextStyle(),
      enabledBorder: _outlinedStyle(context),
      focusedBorder: _outlinedStyle(context),
      border: _outlinedStyle(context),
      errorBorder: _outlinedStyle(context),
    );
  }

  InputDecoration passwordInputDecoration(BuildContext context) {
    return InputDecoration(
      enabled: true,
      hintText: "Please Enter Your Password",
      enabledBorder: _outlinedStyle(context),
      focusedBorder: _outlinedStyle(context),
      border: _outlinedStyle(context),
      errorBorder: _outlinedStyle(context),
    );
  }

  OutlineInputBorder _outlinedStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      gapPadding: context.heightXXL,
      borderSide: const BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 20,
      ),
    );
  }

  ///
  ///
  ///

}
