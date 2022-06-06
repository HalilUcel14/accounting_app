import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import 'login_constants.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LoginConstant.loginTitle,
          style: LoginConstant().loginStyle(context),
        ),
        SpaceSizedHeightBox(context: context, height: 0.01),
        Text(
          LoginConstant.loginSubTitle,
          style: LoginConstant().loginSubStyle(context),
        ),
      ],
    );
  }
}
