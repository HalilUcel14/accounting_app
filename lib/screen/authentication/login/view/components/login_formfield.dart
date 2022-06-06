import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/widgets/white_container.dart';
import '../../viewmodel/login_viewmodel.dart';
import 'login_constants.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({Key? key, required this.viewModel}) : super(key: key);
  //
  final LoginScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return ColumnInCenter(
      children: [
        WhiteFormContainer(
          icon: SvgPicture.asset("mail".getSvgIcon, fit: BoxFit.cover),
          child: _emailFormField(context),
        ),
        SpaceSizedHeightBox(context: context, height: 0.02),
        WhiteFormContainer(
          icon: SvgPicture.asset("lock".getSvgIcon, fit: BoxFit.cover),
          child: _passwordFormField(context),
        ),
      ],
    );
  }

  Widget _passwordFormField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autofocus: true,
        controller: viewModel.passwordController,
        decoration: LoginConstant().passwordInputDecoration(context),
      ),
    );
  }

  Widget _emailFormField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: viewModel.emailController,
        decoration: LoginConstant().emailInputDecoration(context),
      ),
    );
  }
}
