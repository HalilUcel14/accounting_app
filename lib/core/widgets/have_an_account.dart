import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../constants/theme_constants.dart';

class HaveAnAccount extends Row {
  HaveAnAccount(
    BuildContext context, {
    Key? key,
    bool isLogin = true,
    TextStyle? firstTextStyle,
    TextStyle? buttonTextStyle,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          children: [
            const Spacer(),
            Text(
              isLogin ? "Don't have an Account? " : "Already have an Account? ",
              style: firstTextStyle ?? TextStyle(fontSize: context.heightS),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                isLogin ? "Sign Up" : "Log In",
                style: buttonTextStyle ??
                    TextStyle(
                      color: ThemeConst.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: context.heightS * 1.3,
                    ),
              ),
            ),
            const Spacer(),
          ],
        );
}
