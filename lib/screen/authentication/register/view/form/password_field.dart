import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../../constants/asset_constants.dart';
import '../../../../../core/widgets/default_textform.dart';
import '../../../../../core/widgets/textform_svg_icon.dart';
import '../../../../../core/widgets/white_container.dart';
import '../../view_model/register_view_model.dart';

class RegisterPasswordField extends StatelessWidget {
  const RegisterPasswordField({Key? key, required this.viewModel})
      : super(key: key);

  final RegisterScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteFormContainer(
          child: DefaultFormField.passwordFormField(context,
              controller: viewModel.passwordEditingController),
          icon: TextFormSvgIcon.asset(AssetsConstants.lock, context),
        ),
        SpaceSizedHeightBox(context: context, height: 0.01),
        // Confirm Password
        WhiteFormContainer(
          child: DefaultFormField.passwordFormField(context,
              controller: viewModel.confirmEditingController),
          icon: TextFormSvgIcon.asset(AssetsConstants.lock, context),
        ),
      ],
    );
  }
}
