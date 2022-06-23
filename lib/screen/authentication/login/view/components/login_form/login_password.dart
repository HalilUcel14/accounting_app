import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../../constants/asset_constants.dart';
import '../../../../../../core/route/app_route.dart';
import '../../../../../../core/widgets/white_container.dart';
import '../../../../forgot/view/components/forgot_constants.dart';
import '../../../viewmodel/login_viewmodel.dart';
import '../login_constants.dart';

class LoginPasswordFormField extends StatelessWidget {
  const LoginPasswordFormField({Key? key, required this.viewModel})
      : super(key: key);

  final LoginScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      icon: GestureDetector(
        onTap: () {
          viewModel.obscureChange();
        },
        child: SvgPicture.asset(
          AssetsConstants.lock.getSvgIcon,
          fit: BoxFit.cover,
          color: Colors.black,
          height: context.heightS * 1.2,
          alignment: Alignment.center,
        ),
      ),
      child: _passwordFormField(context),
      rightIcon: _forgotTextButton(context),
    );
  }

  TextButton _forgotTextButton(BuildContext context) {
    return TextButton(
      child: Text(
        ForgotConstant.forgot,
        style: ForgotConstant().forgotButtonStyle(),
      ),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.forgot);
      },
    );
  }

  Widget _passwordFormField(BuildContext context) {
    return Observer(
      builder: (context) => TextFormField(
        controller: viewModel.passwordController,
        validator: _passwordValid,
        obscureText: viewModel.obscureText,
        decoration: LoginConstant().passwordInputDecoration(context),
      ),
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
}
