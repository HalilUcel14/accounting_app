import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../constants/theme_constants.dart';
import '../../../../../core/route/app_route.dart';
import '../../../../../core/widgets/page_indicator.dart';
import '../../model/onboard_model.dart';
import '../../viewmodel/onboard_viewmodel.dart';
import 'onboard_constants.dart';

class OnboardCard extends StatelessWidget {
  const OnboardCard(
      {Key? key, required this.viewModel, required this.currentPages})
      : super(key: key);
  //
  final OnBoardScreenViewModel viewModel;
  final int currentPages;
  //
  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      decoration: OnBoardConst.cardDecoration(context),
      margin: context.padAllNormaly,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              _spaced(context, constraints, 0.08),
              _indicatorRow(context),
              _spaced(context, constraints, 0.08),
              _titleSubTitle(
                context: context,
                model: viewModel.onboardList[currentPages],
              ),
              const Spacer(),
              _cardButton(context),
              _spaced(context, constraints, 0.05),
            ],
          );
        },
      ),
    );
  }

  SpaceSizedHeight _spaced(
      BuildContext context, BoxConstraints constraints, double height) {
    return SpaceSizedHeight(
        context: context, height: constraints.maxHeight * height);
  }

  PaddingRow _cardButton(BuildContext context) {
    return PaddingRow(
      padding: context.padHorizontalMedium,
      children: [
        // Skip Button for skip page
        ElevatedButtonWithStadiumBorder(
          fixedSize: Size(context.heightL * 2, context.heightS),
          styleBackgroundColor: ThemeConst.primaryColor,
          foregroundColor: Colors.black,
          child: const Text(OnBoardConst.skipButton),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false),
        ),
        const Spacer(),
        // Next Page for pass other page
        ElevatedButtonWithStadiumBorder(
          fixedSize: Size(context.heightL * 2, context.heightS),
          styleBackgroundColor: ThemeConst.primaryColor,
          foregroundColor: Colors.black,
          child: Text(
            currentPages == viewModel.onboardList.length - 1
                ? OnBoardConst.returnButton
                : OnBoardConst.nextButton,
          ),
          onPressed: () {
            if (currentPages == viewModel.onboardList.length - 1) {
              viewModel.controller.jumpToPage(0);
            } else {
              viewModel.controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
        ),
      ],
    );
  }

  //
  Widget _indicatorRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          viewModel.onboardList.length,
          (index) => MyPageIndicator(
            size: context.heightXS * 2,
            unSelectedColor: ThemeConst.primaryColor,
            selectedColor: Colors.black,
            isActive: index == currentPages ? true : false,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ],
    );
  }

  //
  Column _titleSubTitle({
    required BuildContext context,
    required OnBoardModel model,
  }) {
    return Column(
      children: [
        Text(model.title!, style: OnBoardConst.titleStyle(context)),
        SpaceSizedHeightBox(context: context, height: 0.01),
        _richDescription(model),
      ],
    );
  }

  Text _richDescription(OnBoardModel model) {
    return Text.rich(
      TextSpan(
        text: model.firstDescription, // First Text
        children: <TextSpan>[
          TextSpan(
            text: model.specialDescription, // Special Text
            style: OnBoardConst.specialTextStyle(),
          ),
          TextSpan(text: "\n${model.lastDescription}"), // Last Text
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
