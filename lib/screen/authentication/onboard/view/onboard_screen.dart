import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../../constants/theme_constants.dart';
import '../viewmodel/onboard_viewmodel.dart';
import 'components/onboard_body.dart';

class OnBoardScreen extends BaseStateless {
  OnBoardScreen({Key? key}) : super(key: key);
  //
  late final OnBoardScreenViewModel _viewModel;
  late final BuildContext _context;
  //
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
        appBar: _appBar(),
        body: OnBoardBody(viewModel: _viewModel),
      );

  AppBar _appBar() {
    return AppBar(
      leading: _leading(),
      actions: [
        _skipButton(),
      ],
    );
  }

  Center _skipButton() {
    return Center(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: _context.heightXL,
          height: _context.heightL,
          margin: EdgeInsets.only(
            right: _context.heightS,
          ),
          padding: _context.padAllLow,
          decoration: const BoxDecoration(
            color: ThemeConst.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _leading() {
    return Center(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: _context.heightXL,
          height: _context.heightL,
          margin: EdgeInsets.only(
            left: _context.heightS,
          ),
          padding: _context.padAllLow,
          decoration: const BoxDecoration(
            color: ThemeConst.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset("back_arrow_2".getPngIcon),
        ),
      ),
    );
  }
}
