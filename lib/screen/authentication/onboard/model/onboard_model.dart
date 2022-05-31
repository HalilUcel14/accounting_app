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

  OnBoardModel.models();

  @override
  fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> docs) {
    //throw UnimplementedError();
  }

  @override
  fromJson(Map<String, Object> json) {}

  @override
  Map<String, Object?> toJson() {
    throw UnimplementedError();
  }
}
