import 'package:flutter/material.dart';

import '../../../../../constants/asset_constants.dart';
import '../../../../../core/widgets/default_textform.dart';
import '../../../../../core/widgets/textform_svg_icon.dart';
import '../../../../../core/widgets/white_container.dart';
import '../../view_model/register_view_model.dart';

class RegisterEmailField extends StatelessWidget {
  const RegisterEmailField({Key? key, required this.viewModel})
      : super(key: key);

  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      child: DefaultFormField.emailFormField(context,
          controller: viewModel.emailEditingController),
      icon: TextFormSvgIcon.asset(AssetsConstants.mail, context),
    );
  }
}
