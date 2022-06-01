import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:mobx/mobx.dart';

import '../model/onboard_model.dart';

part 'onboard_viewmodel.g.dart';

class OnBoardScreenViewModel = _OnBoardScreenViewModelBase
    with _$OnBoardScreenViewModel;

abstract class _OnBoardScreenViewModelBase with Store, BaseViewModel {
  //
  @observable
  PageController controller = PageController();
  @observable
  List<OnBoardModel> onboardList = [
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
          "   2013'ün ardından bir sezonda 5 kupanın 5'inide aldık.\n",
      specialDescription:
          "''[FIVB Dünya Kupası]-[Misli.Com Sultanlar Ligi]-[CEV Avrupa Şampiyonası]-[AXA Sigorta Türkiye Kupası]-[Sultanlar Ligi Süper Kupası]''",
      lastDescription: "\n[2013]-[2022]",
    ),
  ];
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
  void init() {}
}
