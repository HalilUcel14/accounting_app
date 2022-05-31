import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class OnBoardConst {
  static const String skipButton = "Skip";

  //
  static skipStyle(BuildContext context) => TextStyle(
        fontSize: context.heightS * 1.2,
      );

  static titleStyle(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: context.heightM,
      );

  static cardDecoration(BuildContext context) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.heightS),
        boxShadow: [
          BoxShadow(
            blurRadius: context.heightS,
            blurStyle: BlurStyle.solid,
            color: Colors.grey,
          ),
        ],
      );
}
