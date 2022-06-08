import 'package:flutter/material.dart';

import '../../constants/theme_constants.dart';

class HaveAnAccount extends Row {
  HaveAnAccount({
    Key? key,
    bool isLogin = true,
    TextStyle firstTextStyle = const TextStyle(
      fontSize: 16,
    ),
    TextStyle buttonTextStyle = const TextStyle(
      color: ThemeConst.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    VoidCallback? onPressed,
  }) : super(
          key: key,
          children: [
            const Spacer(),
            Text(
              isLogin ? "Don't have an Account? " : "Already have an Account? ",
              style: firstTextStyle,
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                isLogin ? "Sign Up" : "Log In",
                style: buttonTextStyle,
              ),
            ),
            const Spacer(),
          ],
        );
}
