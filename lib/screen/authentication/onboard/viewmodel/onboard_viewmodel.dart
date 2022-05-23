import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';
part 'onboard_viewmodel.g.dart';

class OnBoardScreenViewModel = _OnBoardScreenViewModelBase
    with _$OnBoardScreenViewModel;

abstract class _OnBoardScreenViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext? context) => baseContext = context;

  @override
  void init() {}
}
