import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';
import 'components/onboard_card.dart';
import 'components/onboard_image.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);

  late final OnBoardScreenViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardScreenViewModel>(
      viewModel: OnBoardScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardScreenViewModel viewModel) {
        _viewModel = viewModel;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: _viewModel.controller,
            itemCount: _viewModel.onboardList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Image Widget
                  ExpandImageField(
                      imgUrl: _viewModel.onboardList[index].imgUrl!),
                  // Card Widget
                  OnboardCard(viewModel: _viewModel, currentPages: index),
                ],
              );
            },
          ),
        ),
      );
}
