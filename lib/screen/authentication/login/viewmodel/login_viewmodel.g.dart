// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenViewModel on _LoginScreenViewModelBase, Store {
  late final _$errorTextAtom =
      Atom(name: '_LoginScreenViewModelBase.errorText', context: context);

  @override
  List<String> get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(List<String> value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: '_LoginScreenViewModelBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$passwordControllerAtom = Atom(
      name: '_LoginScreenViewModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: '_LoginScreenViewModelBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$_LoginScreenViewModelBaseActionController =
      ActionController(name: '_LoginScreenViewModelBase', context: context);

  @override
  void obscureChange() {
    final _$actionInfo = _$_LoginScreenViewModelBaseActionController
        .startAction(name: '_LoginScreenViewModelBase.obscureChange');
    try {
      return super.obscureChange();
    } finally {
      _$_LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorText: ${errorText},
emailController: ${emailController},
passwordController: ${passwordController},
obscureText: ${obscureText}
    ''';
  }
}
