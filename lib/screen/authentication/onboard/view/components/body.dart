import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class OnBoardBody extends BaseStateless {
  OnBoardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/onboard/five_cup.png"),
        const Divider(),
        Image.asset("assets/images/onboard/vakıf_saray.png"),
      ],
    );
  }
}
