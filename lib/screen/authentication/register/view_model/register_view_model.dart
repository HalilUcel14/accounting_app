import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

part 'register_view_model.g.dart';

class RegisterScreenViewModel = _RegisterScreenViewModelBase
    with _$RegisterScreenViewModel;

abstract class _RegisterScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext meContext) => baseContext = meContext;
  @override
  void init() {}

  @observable
  TextEditingController nameEditingController = TextEditingController();
  @observable
  TextEditingController emailEditingController = TextEditingController();
  @observable
  TextEditingController passwordEditingController = TextEditingController();
  @observable
  TextEditingController confirmEditingController = TextEditingController();
}
