import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../constants/theme_constants.dart';
import '../view_model/register_view_model.dart';
import 'component/register_formfield.dart';

class RegisterScreen extends BaseStateless {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterScreenViewModel>(
      viewModel: RegisterScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterScreenViewModel viewModel) {
        return _scaffold(context, viewModel);
      },
    );
  }

  Scaffold _scaffold(BuildContext context, RegisterScreenViewModel viewModel) =>
      Scaffold(
        body: SafeArea(
          child: ExpandedContainer(
            padding: context.padAllM,
            child: Column(
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: ThemeConst.primaryDarkColor,
                    fontSize: context.dynamicHeight(0.05),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //
                const RegisterFormField(),
              ],
            ),
          ),
        ),
      );
}
