import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../constants/theme_constants.dart';

class LoginConstant {
  //
  static const String loginTitle = "Login";
  static const String loginSubTitle = 'Please sign in to continue';
  static const String initEmailAddress = '@vakifbanksk.com';
  static const String passErrorText =
      'Your Password is not Valid!\nOne Number, Uppercase, Lowercase';
  static const String emailNotContain = 'Email not contain @vakifbanksk.com';
  static const String emailNotValid = 'Email not valid mailFormat';
  static const String loginButtonText = 'LOG IN';

  //
  static const String errorDataEntry = 'Hatalı Veri Girişi.';
  static const List<String> errorEntryTextList = [
    "Girmiş olduğunuz mail geçersizdir.",
    "@vakifbanksk.com uzantılı olmalıdır."
  ];
  //
  static const String missingDataEntry = 'Eksik Veri Girişi';
  static const List<String> missingEntryErrorList = [
    "Lütfen Email Address giriniz.",
    "Lütfen Password giriniz.",
  ];
  //
  static const String invalidPassword = 'Geçersiz Şifre';
  static const List<String> invalidPasswordErrorList = [
    "Girmiş olduğunuz şifre tipi geçersizdir.",
    "Şifreniz için önerilen düzey:",
    "1 Büyük Harf 1 Küçük Harf 1 Sayı 1 Özel Karakter.",
  ];
  //
  //
  TextStyle loginButtonStyle(BuildContext context) => TextStyle(
        fontSize: context.heightS * 1.5,
        fontWeight: FontWeight.bold,
      );
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
      hintText: "Please Enter Your E Mail Address",
      hintStyle: TextStyle(fontSize: context.heightS * 0.9),
      labelText: "Email Address",
      floatingLabelStyle: const TextStyle(color: Colors.transparent),
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
      hintStyle: TextStyle(fontSize: context.heightS * 0.9),
      hintText: "Please Enter Your Password",
      labelText: "Password",
      floatingLabelStyle: const TextStyle(color: Colors.transparent),
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
