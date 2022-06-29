import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';
import 'components/onboard_card.dart';
import 'components/onboard_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardScreenViewModel>(
      viewModel: OnBoardScreenViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardScreenViewModel viewModel) {
        return _scaffold(viewModel);
      },
    );
  }

  Scaffold _scaffold(OnBoardScreenViewModel viewModel) {
    //viewModel.getDataFromFirebase;
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return PageView.builder(
              controller: viewModel.controller,
              itemCount: viewModel.onboardList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Image Widget
                    ExpandImageField(
                        imgUrl: viewModel.onboardList[index].imgUrl!),
                    // Card Widget
                    OnboardCard(viewModel: viewModel, currentPages: index),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
