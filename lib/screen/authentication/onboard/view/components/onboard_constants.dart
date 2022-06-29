import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class OnBoardConst {
  static const String skipButton = "Skip";
  static const String nextButton = "Next";
  static const String returnButton = "Return";

  //
  static skipStyle(BuildContext context) => TextStyle(
        fontSize: context.heightS * 1.2,
      );

  static titleStyle(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: context.heightM,
      );
  static specialSubtitleTextStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: context.heightS * 0.85,
      );
  static otherSubtitleTextStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: context.heightS * 0.85,
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
