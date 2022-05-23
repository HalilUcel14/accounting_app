import 'package:flutter/material.dart';
import 'package:hucel_widget/hucel_widget.dart';
import 'package:hucel_core/hucel_core.dart';
import '../../viewmodel/onboard_viewmodel.dart';

class OnBoardBody extends StatelessWidget {
  const OnBoardBody({Key? key, required this.viewModel}) : super(key: key);
  //
  final OnBoardScreenViewModel viewModel;
  //
  @override
  Widget build(BuildContext context) {
    return PaddingColumn(
      padding: context.padAllLow,
      children: [
        const Text(
          "Title",
        ),
        SpaceSizedHeightBox(context: context, height: 0.02),
        const Text("descrpiton"),
      ],
    );
  }
}
