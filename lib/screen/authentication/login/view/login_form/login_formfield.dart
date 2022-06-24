import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../viewmodel/login_viewmodel.dart';
import 'login_email.dart';
import 'login_password.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  late final GlobalKey _loginFormKey =
      GlobalKey<FormState>(debugLabel: "Login Form State");

  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      onChanged: () {},
      child: ColumnInCenter(
        children: [
          // E mail Text Form Field
          LoginEmailFormField(viewModel: widget.viewModel),
          SpaceSizedHeightBox(context: context, height: 0.02),
          // Password Text Form Field
          LoginPasswordFormField(viewModel: widget.viewModel),
          SpaceSizedHeightBox(context: context, height: 0.05),
          // Login Button
        ],
      ),
    );
  }
}
