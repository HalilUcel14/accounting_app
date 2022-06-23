import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../../constants/asset_constants.dart';
import '../../../../../../constants/theme_constants.dart';
import '../../../../../../core/route/app_route.dart';
import '../../../../../../core/widgets/snackbar.dart';
import '../../../viewmodel/login_viewmodel.dart';
import '../login_constants.dart';
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
  //
  late final GlobalKey _loginFormKey =
      GlobalKey<FormState>(debugLabel: "Login Form State");
  //
  final FirebaseEmailPassAuthHelper _emailPassAuthHelper =
      FirebaseEmailPassAuthHelper();
  //
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      autovalidateMode: AutovalidateMode.always,
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
          Row(children: [const Spacer(), _loginButton(context)]),
        ],
      ),
    );
  }

  ElevatedButtonWithStadiumBorder _loginButton(BuildContext context) {
    return ElevatedButtonWithStadiumBorder(
      child: _loginButtonText(context),
      styleBackgroundColor: ThemeConst.primaryColor,
      fixedSize: Size(context.dynamicWidth(0.35), context.dynamicHeight(0.065)),
      onPressed: _buttonPressed,
    );
  }

  Text _loginButtonText(BuildContext context) {
    return Text(
      LoginConstant.loginButtonText,
      style: LoginConstant().loginButtonStyle(context),
    );
  }

  //
  void _buttonPressed() async {
    String emailText = widget.viewModel.emailController.text.trim();
    String passwordText = widget.viewModel.passwordController.text.trim();
    //
    bool _isNullOrEmpty = emailText.isEmpty &&
        passwordText.isEmpty &&
        widget.viewModel.errorText.isEmpty;
    //
    bool _notValidMail = !emailText.contains(LoginConstant.initEmailAddress);
    bool _validPassword = passwordText.isValidLowPassword ||
        passwordText.isValidMediumPassword ||
        passwordText.isValidHardPassword;
    //
    if (_isNullOrEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          titleText: LoginConstant.missingDataEntry,
          errorList: LoginConstant.missingEntryErrorList,
          pngIcons: AssetsConstants.exclamation,
        ),
      );
    } else if (_notValidMail) {
      // Hatalı Veri Mail Girişi
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          titleText: LoginConstant.errorDataEntry,
          errorList: LoginConstant.errorEntryTextList,
          pngIcons: AssetsConstants.exclamation,
        ),
      );
    } else if (!_validPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          titleText: LoginConstant.invalidPassword,
          errorList: LoginConstant.invalidPasswordErrorList,
          pngIcons: AssetsConstants.exclamation,
        ),
      );
    } else {
      await _emailPassAuthHelper.signIn(context,
          email: emailText, password: passwordText);

      if (_emailPassAuthHelper.auth.currentUser!.refreshToken!.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.home, (route) => false);
      }
    }
  }
  //

}
