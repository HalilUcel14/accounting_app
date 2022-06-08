import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../constants/theme_constants.dart';

class LoginConstant {
  static const String loginTitle = "Login";
  static const String loginSubTitle = 'Please sign in to continue';
  static const String initEmailAddress = '@vakifbanksk.com';
  static const String passErrorText =
      'Your Password is not Valid!\nOne Number, Uppercase, Lowercase';
  static const String emailNotContain = 'Email not contain @vakifbanksk.com';
  static const String emailNotValid = 'Email not valid mailFormat';

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
      disabledBorder: _outlinedStyle(context),
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
      labelText: "Password",
      enabledBorder: _outlinedStyle(context),
      focusedBorder: _outlinedStyle(context),
      border: _outlinedStyle(context),
      errorBorder: _outlinedStyle(context),
    );
  }

  OutlineInputBorder _outlinedStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
      ),
    );
  }

  ///
  ///
  ///

}
