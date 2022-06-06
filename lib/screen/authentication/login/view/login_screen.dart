import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../viewmodel/login_viewmodel.dart';
import 'components/login_formfield.dart';
import 'components/login_title.dart';

class LoginScreen extends BaseStateless {
  LoginScreen({Key? key}) : super(key: key);
  //
  late LoginScreenViewModel _loginViewModel;
  late BuildContext _context;
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
        _loginViewModel = viewModel;
        _context = context;
        return _scaffold();
      },
      onDispose: () {
        _loginViewModel.emailController.dispose();
        _loginViewModel.passwordController.dispose();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ExpandedContainer(
            padding: _context.padAllMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                const Spacer(),
                const LoginTitle(),
                const Spacer(),
                LoginFormField(viewModel: _loginViewModel),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      );
}
