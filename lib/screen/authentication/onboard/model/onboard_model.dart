import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hucel_core/hucel_core.dart';

class OnBoardModel extends BaseModel {
  String? title;
  String? firstDescription;
  String? specialDescription;
  String? lastDescription;
  String? imgUrl;

  OnBoardModel({
    this.firstDescription,
    this.lastDescription,
    this.imgUrl,
    this.specialDescription,
    this.title,
  });

  static String firstDesc = "firstDescription";
  static String specialDesc = "specialDescription";
  static String lastDesc = 'lastDescription';
  static String img = 'imgUrl';
  static String tit = 'title';

  // henüz bir boka yaramıyor geliştireceğim
  // amacı firebase cloud içerisinden model eşlenikli veriyi doğrudan modele çevirebilmesi
  @override
  fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> docs) {
    var _docs = docs.data()!;
    return OnBoardModel(
      firstDescription: _docs[firstDesc],
      imgUrl: _docs[img],
      lastDescription: _docs[lastDesc],
      specialDescription: _docs[specialDesc],
      title: _docs[tit],
    );
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return OnBoardModel(
      firstDescription: json[firstDesc].toString(),
      imgUrl: json[img].toString(),
      lastDescription: json[lastDesc].toString(),
      specialDescription: json[specialDesc].toString(),
      title: json[tit].toString(),
    );
  }

  @override
  Map<String, Object?> toJson() {
    return {
      firstDesc: firstDescription,
      specialDesc: specialDescription,
      lastDesc: lastDescription,
      tit: title,
      img: imgUrl,
    };
  }
}
