import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

part 'login_viewmodel.g.dart';

class LoginScreenViewModel = _LoginScreenViewModelBase
    with _$LoginScreenViewModel;

abstract class _LoginScreenViewModelBase with Store, BaseViewModel {
  // Variable Observable

  //
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  @observable
  List<String> errorText = [];

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  //
  //

  //
}
