import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../constants/theme_constants.dart';
import '../../../../../core/widgets/center_title.dart';
import '../../viewmodel/onboard_viewmodel.dart';

class OnBoardBody extends StatelessWidget {
  const OnBoardBody({Key? key, required this.viewModel}) : super(key: key);
  //
  final OnBoardScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _expandedOne(),
        _expandedTwo(context),
      ],
    );
  }

  Widget _expandedOne() => ExpandedColumn(
        flex: 3,
        children: [
          Image.asset(
            "back_arrow_2".getPngIcon,
          ),
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ],
      );

  Widget _expandedTwo(BuildContext context) {
    return ExpandedContainer(
      flex: 2,
      padding: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        color: ThemeConst.primaryLightColor.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: ExpandedColumn(
        children: [
          CenterText(
            "This Title",
            style: ThemeConst.instance.onboardTitleStyle(context),
          ),
          SpaceSizedHeightBox(context: context, height: 0.01),
          CenterText(
            "this Description",
            style: ThemeConst.instance.onboardDescriptionStyle(context),
          ),
          const Spacer(flex: 2),
          ElevatedButtonWithStadiumBorder(
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: context.heightM * 0.8,
              ),
            ),
            shadowColor: Colors.black,
            styleBackgroundColor: ThemeConst.primaryColor,
            fixedSize: Size(context.heightXXL * 4, context.heightL),
            onPressed: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
