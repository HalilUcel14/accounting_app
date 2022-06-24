import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../../constants/asset_constants.dart';
import '../../../../../../core/widgets/default_textform.dart';
import '../../../../../../core/widgets/textform_svg_icon.dart';
import '../../../../../../core/widgets/white_container.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../components/login_constants.dart';

class LoginEmailFormField extends StatelessWidget {
  const LoginEmailFormField({Key? key, required this.viewModel})
      : super(key: key);

  final LoginScreenViewModel viewModel;
  // ana dizayn
  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      // mail icon
      icon: TextFormSvgIcon.asset(AssetsConstants.mail, context),
      // form field
      child: DefaultFormField.emailFormField(
        context,
        controller: viewModel.emailController,
        validator: _emailValid,
      ),
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
