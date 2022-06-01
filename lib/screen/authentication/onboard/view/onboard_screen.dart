import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../viewmodel/onboard_viewmodel.dart';
import 'components/onboard_card.dart';
import 'components/onboard_image.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);

  late final OnBoardScreenViewModel _viewModel;
  late final BuildContext _context;

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
        _context = context;
        return _scaffold();
      },
    );
  }

  Scaffold _scaffold() => Scaffold(
        body: SafeArea(
          child: PageView.builder(
            onPageChanged: (value) {
              _viewModel.changePage(value);
            },
            controller: _viewModel.controller,
            itemCount: _viewModel.onboardList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Image Widget
                  expandImageField(_viewModel.onboardList[index].imgUrl!),
                  // Card Widget
                  OnboardCard(viewModel: _viewModel, currentPages: index),
                ],
              );
            },
          ),
        ),
      );
}
