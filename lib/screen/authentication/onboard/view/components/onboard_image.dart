import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';

ExpandedContainer expandImageField(String imgUrl) {
  return ExpandedContainer(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgUrl),
      ),
    ),
  );
}
