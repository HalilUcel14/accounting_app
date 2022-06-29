import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset("vakif".getPngImage, height: 400),
        ),
        Container(
          child: Image.asset(
            "vakıf_logo".getJpgImage,
            height: 400,
            scale: 4,
          ),
        ),
      ],
    );
  }
}
