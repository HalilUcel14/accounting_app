import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../constants/asset_constants.dart';
import '../../../../../constants/theme_constants.dart';
import '../../../../../core/route/app_route.dart';
import '../../../../../core/widgets/snackbar.dart';
import '../../viewmodel/login_viewmodel.dart';
import 'login_constants.dart';

class LoginFormButton extends StatelessWidget {
  LoginFormButton({Key? key, required this.viewModel, required this.context})
      : super(key: key);

  //
  final LoginScreenViewModel viewModel;
  final FirebaseEmailPassAuthHelper _emailPassAuthHelper =
      FirebaseEmailPassAuthHelper();
  final BuildContext context;
  //
  @override
  Widget build(BuildContext context) {
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

  void _buttonPressed() async {
    String emailText = viewModel.emailController.text.trim();
    String passwordText = viewModel.passwordController.text.trim();
    //
    bool _isNullOrEmpty = emailText.isEmpty &&
        passwordText.isEmpty &&
        viewModel.errorText.isEmpty;
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
