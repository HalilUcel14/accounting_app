import 'package:counting_app/core/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../constants/theme_constants.dart';
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
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ColumnInCenter(
        children: [
          WhiteFormContainer(
            icon: SvgPicture.asset("mail".getSvgIcon, fit: BoxFit.cover),
            child: _emailFormField(context),
          ),
          //
          SpaceSizedHeightBox(context: context, height: 0.02),
          //
          WhiteFormContainer(
            icon: SvgPicture.asset("lock".getSvgIcon, fit: BoxFit.cover),
            child: _passwordFormField(context),
          ),

          //
          SpaceSizedHeightBox(context: context, height: 0.05),
          Row(children: [const Spacer(), _loginButton(context)]),
          SpaceSizedHeightBox(context: context, height: 0.02),
        ],
      ),
    );
  }

  ElevatedButtonWithStadiumBorder _loginButton(BuildContext context) {
    return ElevatedButtonWithStadiumBorder(
      child: Text(
        "Log In",
        style: TextStyle(
          fontSize: context.heightS * 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      styleBackgroundColor: ThemeConst.primaryColor,
      fixedSize: Size(context.dynamicWidth(0.35), context.dynamicHeight(0.065)),
      onPressed: () {
        bool _isNotEmpty = viewModel.emailController.text.isNotEmpty &&
            viewModel.passwordController.text.isNotEmpty &&
            viewModel.errorText.isEmpty;
        //
        if (_isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(
                titleText: "Hatalı Veri Girişi.",
                errorList: viewModel.errorText),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackBar(titleText: "Eksik Veri Girişi.", errorList: const [
              "Lütfen Email Address giriniz.",
              "Lütfen Password giriniz.",
            ]),
          );
        }
      },
    );
  }

  Widget _passwordFormField(BuildContext context) {
    return TextFormField(
      controller: viewModel.passwordController,
      validator: _passwordValid,
      decoration: LoginConstant().passwordInputDecoration(context),
    );
  }

  Widget _emailFormField(BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: _emailValid,
      decoration: LoginConstant().emailInputDecoration(context),
    );
  }

  String? _passwordValid(String? value) {
    if (value!.isNotEmpty) {
      if (!value.isValidMediumPassword) {
        if (!viewModel.errorText.contains(LoginConstant.passErrorText)) {
          viewModel.errorText.add(LoginConstant.passErrorText);
        }
      } else {
        if (viewModel.errorText.contains(LoginConstant.passErrorText)) {
          viewModel.errorText.remove(LoginConstant.passErrorText);
        }
      }
    }
    return null;
  }

  String? _emailValid(String? value) {
    if (value!.isNotEmpty) {
      if (!value.isValidEmail) {
        if (!viewModel.errorText.contains(LoginConstant.emailNotValid)) {
          viewModel.errorText.add(LoginConstant.emailNotValid);
        }
      } else if (!value.contains(LoginConstant.initEmailAddress)) {
        if (!viewModel.errorText.contains(LoginConstant.emailNotContain)) {
          viewModel.errorText.add(LoginConstant.emailNotContain);
        }
      } else {
        if (viewModel.errorText.contains(LoginConstant.passErrorText)) {
          viewModel.errorText.remove(LoginConstant.passErrorText);
        }
        if (viewModel.errorText.contains(LoginConstant.emailNotContain)) {
          viewModel.errorText.remove(LoginConstant.emailNotContain);
        }
        if (viewModel.errorText.contains(LoginConstant.emailNotValid)) {
          viewModel.errorText.remove(LoginConstant.emailNotValid);
        }
      }
    }
    return null;
  }
}
