import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hucel_core/hucel_core.dart';

class TextFormSvgIcon extends SvgPicture {
  TextFormSvgIcon.asset(String assetName, BuildContext context, {Key? key})
      : super.asset(
          assetName.getSvgIcon,
          key: key,
          fit: BoxFit.cover,
          color: Colors.black54,
          height: context.heightS * 1.2,
          alignment: Alignment.center,
        );
}
