import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../../constants/asset_constants.dart';
import '../../../../../../core/widgets/white_container.dart';
import '../../../viewmodel/login_viewmodel.dart';
import '../login_constants.dart';

class LoginEmailFormField extends StatelessWidget {
  const LoginEmailFormField({Key? key, required this.viewModel})
      : super(key: key);

  final LoginScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      icon: SvgPicture.asset(
        AssetsConstants.mail.getSvgIcon,
        fit: BoxFit.cover,
        color: Colors.black,
        height: context.heightS,
        alignment: Alignment.center,
      ),
      child: _emailFormField(context),
    );
  }

  Widget _emailFormField(BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      autocorrect: false,
      validator: _emailValid,
      keyboardType: TextInputType.emailAddress,
      decoration: LoginConstant().emailInputDecoration(context),
    );
  }

  String? _emailValid(String? value) {
    if (value!.isNotEmpty) {
      if (!value.isValidEmail) {
        if (viewModel.errorText.contains(LoginConstant.emailNotValid)) {
          viewModel.errorText.add(LoginConstant.emailNotValid);
        }
      } else if (!value.contains(LoginConstant.initEmailAddress)) {
        if (viewModel.errorText.contains(LoginConstant.emailNotContain)) {
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
