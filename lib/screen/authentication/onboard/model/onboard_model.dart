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
