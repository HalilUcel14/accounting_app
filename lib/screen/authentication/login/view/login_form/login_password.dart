import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../../constants/asset_constants.dart';
import '../../../../../../core/route/app_route.dart';
import '../../../../../../core/widgets/default_textform.dart';
import '../../../../../../core/widgets/textform_svg_icon.dart';
import '../../../../../../core/widgets/white_container.dart';
import '../../../forgot/view/components/forgot_constants.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../components/login_constants.dart';

class LoginPasswordFormField extends StatelessWidget {
  const LoginPasswordFormField({Key? key, required this.viewModel})
      : super(key: key);

  final LoginScreenViewModel viewModel;

  /// ana dizayn password form field için
  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      // icon tıklandığında şifre gizleme açma fonksiyonu
      icon: GestureDetector(
        onTap: () {
          viewModel.obscureChange();
        },
        child: TextFormSvgIcon.asset(AssetsConstants.lock, context),
      ),
      // formfield alanı
      child: _passwordFormField(context),
      // şifre unuttum button
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
    // buton tıkladığında gizleme açma amaçlı observer
    return Observer(
      builder: (context) => DefaultFormField.passwordFormField(
        context,
        validator: _passwordValid,
        obscureText: viewModel.obscureText,
        controller: viewModel.passwordController,
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
