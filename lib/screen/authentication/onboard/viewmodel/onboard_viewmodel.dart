import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../model/onboard_model.dart';

part 'onboard_viewmodel.g.dart';

class OnBoardScreenViewModel = _OnBoardScreenViewModelBase
    with _$OnBoardScreenViewModel;

abstract class _OnBoardScreenViewModelBase with Store, BaseViewModel {
  //

  Future<List<OnBoardModel>> _fetchDataFromFirebase(
      {required String collectionName}) async {
    List<OnBoardModel> listed = [];
    await FirebaseFirestore.instance
        .collection(collectionName)
        .get()
        .then((docsSnapshot) {
      for (var element in docsSnapshot.docs) {
        var fromMap = OnBoardModel().fromJson(element.data());
        listed.add(fromMap);
      }
    });
    return listed;
  }

  @observable
  PageController controller = PageController();

  @observable
  List<OnBoardModel> onboardList = [];

  @action
  Future<void> getDataFromFirebase() async {
    onboardList = await _fetchDataFromFirebase(collectionName: "onboard");
  }

  //
  @override
  void setContext(BuildContext? context) => baseContext = context;

  @override
  void init() async {
    await getDataFromFirebase();
  }
}
