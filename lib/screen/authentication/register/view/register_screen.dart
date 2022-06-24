import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../core/route/app_route.dart';
import '../../../../core/widgets/have_an_account.dart';
import '../view_model/register_view_model.dart';
import 'component/register_button.dart';
import 'component/register_title.dart';
import 'form/register_formfield.dart';

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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ExpandedContainer(
            padding: context.padAllM,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterTitle(),
                //
                SpaceSizedHeightBox(context: context, height: 0.08),
                RegisterFormField(viewModel: viewModel),
                SpaceSizedHeightBox(context: context, height: 0.05),
                const RegisterButton(),
                const Spacer(),
                HaveAnAccount(
                  context,
                  isLogin: false,
                  onPressed: () async {
                    await Navigator.pushNamed(context, AppRoutes.login);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
