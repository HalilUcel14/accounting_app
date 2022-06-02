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

  @action
  List<OnBoardModel> fetchDataFromFirebase({required String collectionName}) {
    List<OnBoardModel> listed = [];
    FirebaseFirestore.instance
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

  List<Map<String, dynamic>> fetchModelFromCloudStore(
      {required String collectionName, String? docsName}) {
    List<Map<String, dynamic>> mapList = [];
    if (docsName == null) {
      FirebaseFirestore.instance
          .collection(collectionName)
          .get()
          .then((docsData) {
        for (var elements in docsData.docs) {
          mapList.add(elements.data());
        }
      });
    } else {
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docsName)
          .get()
          .then((value) => mapList.add(value.data()!));
    }
    return mapList;
  }

  @observable
  PageController controller = PageController();
  @observable
  List<OnBoardModel> onboardList = [];

  @observable
  int currentPage = 0;
  //
  @action
  void changePage(int newPage) {
    currentPage = newPage;
  }

  //
  @override
  void setContext(BuildContext? context) => baseContext = context;

  @override
  void init() async {
    onboardList = fetchDataFromFirebase(collectionName: "onboard");
  }
}

class _BaseOption {
  final List<OnBoardModel> defaultOnboardList = [
    OnBoardModel(
      imgUrl: "assets/images/onboard/logo_sk.png",
      title: "Vakıfbank SK",
      firstDescription:
          "   1986’da kurulan VakıfBank Spor Kulübü kazandığı başarılarla Türkiye’nin de gururu olarak, ülkeye pek çok ilki de yaşatmıştır. VakıfBank Kadın Voleybol Takımı ise 10 uluslararası şampiyonluk ile ",
      specialDescription:
          "''Türkiye'nin uluslararası alanda en çok kupa kazanan takımı''",
      lastDescription: " unvanını elinde bulunduruyor.",
    ),
    OnBoardModel(
      imgUrl: "assets/images/onboard/vakıf_saray.png",
      title: "Spor Sarayı",
      firstDescription:
          "   Temeli Haziran 2015’te atılan VakıfBank Spor Sarayı, Üsküdar ilçesi Bağlarbaşı semtinde bulunan ve mülkiyeti Vakıflar Genel Müdürlüğü’ne ait olan 7.260 m² arsa üzerine toplam 30.000 m² inşaat alanı olarak VakıfBank tarafından inşa edilmiştir.",
      specialDescription:
          "''Türkiye’de inşa edilen en kapsamlı spor kompleksidir.''",
      lastDescription: "\n2.000 seyirci ağırlayabilmektedir.",
    ),
    OnBoardModel(
      imgUrl: "assets/images/onboard/five_cup.png",
      title: "Mükemmel Sezon",
      firstDescription:
          "   2013 yılının ardından, harika performanslar sağlayan takımımız bir sezonda alınabilinen 5 kupanın 5'inide aldı.\n",
      specialDescription:
          "''[FIVB Dünya Kupası]-[Misli.Com Sultanlar Ligi]-[CEV Avrupa Şampiyonası]-[AXA Sigorta Türkiye Kupası]-[Sultanlar Ligi Süper Kupası]''",
      lastDescription: "\n[2013]-[2022]",
    ),
  ];
}
