import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class OnBoardModel extends BaseModel {
  String? title;
  String? description;
  String? imgUrl;
  Color? backgroundColor;

  OnBoardModel({
    this.backgroundColor,
    this.description,
    this.imgUrl,
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
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
