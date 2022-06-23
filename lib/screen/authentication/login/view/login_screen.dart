import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../core/widgets/have_an_account.dart';
import '../../../menu/home/home_screen.dart';
import '../viewmodel/login_viewmodel.dart';
import 'components/login_form/login_formfield.dart';
import 'components/login_title.dart';

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
        if (FirebaseAuth.instance.currentUser != null) {
          return const HomeScreen();
        } else {
          return _scaffold(context, viewModel);
        }
      },
      onDispose: () {
        // _loginViewModel.emailController.dispose();
        //_loginViewModel.passwordController.dispose();
      },
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
                const Spacer(flex: 4),
                HaveAnAccount(onPressed: () {}),
              ],
            ),
          ),
        ),
      );
}
