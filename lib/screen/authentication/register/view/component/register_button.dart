import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../constants/theme_constants.dart';
import 'register_constant.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ElevatedButtonWithStadiumBorder(
          child: const Text(RegisterConstant.registerButtonText),
          styleBackgroundColor: ThemeConst.primaryColor,
          fixedSize:
              Size(context.dynamicWidth(0.35), context.dynamicHeight(0.065)),
          onPressed: () {},
        ),
      ],
    );
  }
}
