import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../core/route/app_route.dart';
import '../../../../core/widgets/have_an_account.dart';
import '../viewmodel/login_viewmodel.dart';
import 'components/login_button.dart';

import 'components/login_title.dart';
import 'login_form/login_formfield.dart';

class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginScreenViewModel>(
      viewModel: LoginScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginScreenViewModel viewModel) {
        return _scaffold(context, viewModel);
      },
      onDispose: () {},
    );
  }

  Scaffold _scaffold(BuildContext context, LoginScreenViewModel viewModel) =>
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ExpandedContainer(
            padding: context.padAllM,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const LoginTitle(),
                const Spacer(
                  flex: 2,
                ),
                LoginFormField(viewModel: viewModel),
                Row(children: [
                  const Spacer(),
                  LoginFormButton(viewModel: viewModel, context: context)
                ]),
                const Spacer(flex: 4),
                HaveAnAccount(onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.register);
                }),
              ],
            ),
          ),
        ),
      );
}
