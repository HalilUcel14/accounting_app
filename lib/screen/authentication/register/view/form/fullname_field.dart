import 'package:flutter/material.dart';

import '../../../../../constants/asset_constants.dart';
import '../../../../../core/widgets/default_textform.dart';
import '../../../../../core/widgets/textform_svg_icon.dart';
import '../../../../../core/widgets/white_container.dart';
import '../../view_model/register_view_model.dart';
import '../component/register_constant.dart';

class RegisterFullNameField extends StatelessWidget {
  const RegisterFullNameField({Key? key, required this.viewModel})
      : super(key: key);

  final RegisterScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return WhiteFormContainer(
      icon: TextFormSvgIcon.asset(AssetsConstants.user, context),
      child: DefaultFormField.otherFormField(
        context,
        controller: viewModel.nameEditingController,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: RegisterConstant().nameInputDecoration(context),
      ),
    );
  }
}
