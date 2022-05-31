import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../viewmodel/onboard_viewmodel.dart';
import 'body_card.dart';

class OnBoardBody extends BaseStateless {
  OnBoardBody(this.viewModel, {Key? key}) : super(key: key);

  final OnBoardScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final int listCount = viewModel.onboardList.length;
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.changePage(value);
      },
      controller: viewModel.controller,
      itemCount: listCount,
      itemBuilder: (context, index) {
        return OnBoardBodyCard(
          currentPage: viewModel.currentPage,
          listCount: listCount,
          model: viewModel.onboardList[index],
        );
      },
    );
  }
}
