import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../view_model/register_view_model.dart';
import 'email_field.dart';
import 'fullname_field.dart';
import 'password_field.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({Key? key, required this.viewModel})
      : super(key: key);

  final RegisterScreenViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Full Name
          RegisterFullNameField(viewModel: viewModel),
          SpaceSizedHeightBox(context: context, height: 0.05),
          RegisterEmailField(viewModel: viewModel),
          SpaceSizedHeightBox(context: context, height: 0.01),
          //Password
          RegisterPasswordField(viewModel: viewModel),
        ],
      ),
    );
  }
}
