import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class RegisterConstant {
  static const String registerTitle = 'Create Account';
  static const String registerButtonText = 'SIGN UP';

  InputDecoration nameInputDecoration(BuildContext context) {
    return InputDecoration(
      enabled: true,
      hintStyle: TextStyle(
          fontSize: context.heightS * 0.9, fontWeight: FontWeight.normal),
      hintText: "Please Enter Your Name, Surname",
      labelStyle:
          TextStyle(fontSize: context.heightS, fontWeight: FontWeight.normal),
      labelText: "Full Name",
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
}
