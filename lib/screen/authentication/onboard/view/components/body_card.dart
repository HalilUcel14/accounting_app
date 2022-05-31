import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../model/onboard_model.dart';
import 'onboard_constants.dart';

class OnBoardBodyCard extends StatelessWidget {
  const OnBoardBodyCard({
    Key? key,
    required this.model,
    required this.listCount,
    required this.currentPage,
  }) : super(key: key);
  //
  final int listCount;
  final int currentPage;
  final OnBoardModel model;
  //
  @override
  Widget build(BuildContext context) {
    return PaddingColumn(
      padding: context.padAllLow,
      children: [
        expandImageField(),
        ExpandedContainer(
          decoration: OnBoardConst.cardDecoration(context),
          margin: context.padAllLow,
          child: Column(
            children: [
              const Spacer(),
              indicatorRow(),
              const Spacer(
                flex: 3,
              ),
              titleSubTitle(context),
              const Spacer(),
              onboardButton(),
              const Spacer(
                flex: 2,
              ),
              skipButton(context),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Column titleSubTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title!,
          style: OnBoardConst.titleStyle(context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.heightS, vertical: context.heightXS),
          child: richDescription(),
        ),
      ],
    );
  }

  Row indicatorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < listCount; i++)
          if (i == currentPage) ...[MyPageIndicator(isActive: (true))] else
            MyPageIndicator(isActive: false),
      ],
    );
  }

  TextButton skipButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        OnBoardConst.skipButton,
        style: OnBoardConst.skipStyle(context),
      ),
    );
  }

  ElevatedButtonWithStadiumBorder onboardButton() {
    return ElevatedButtonWithStadiumBorder(
      child: const Text("Next"),
      onPressed: () {},
    );
  }

  Text richDescription() {
    return Text.rich(
      TextSpan(
        text: model.firstDescription,
        //
        children: <TextSpan>[
          TextSpan(
            text: model.specialDescription,
            //
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: model.lastDescription, //
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  ExpandedContainer expandImageField() {
    return ExpandedContainer(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.imgUrl!),
        ),
      ),
    );
  }
}

class MyPageIndicator extends AnimatedContainer {
  MyPageIndicator({
    Key? key,
    required bool isActive,
    Duration duration = const Duration(milliseconds: 200),
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? selectedColor = Colors.black,
    Color? unSelectedColor = Colors.grey,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double width = 12,
    double height = 12,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin = const EdgeInsets.symmetric(horizontal: 8.0),
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Curve curve = Curves.linear,
    void Function()? onEnd,
    Clip clipBehavior = Clip.none,
  }) : super(
          key: key,
          curve: curve,
          onEnd: onEnd,
          duration: duration,
          alignment: alignment,
          padding: padding,
          decoration: decoration ??
              BoxDecoration(
                color: isActive ? selectedColor : unSelectedColor,
                shape: BoxShape.circle,
                boxShadow: [
                  isActive
                      ? BoxShadow(
                          color: const Color(0xFF2FB7B2).withOpacity(0.72),
                          blurRadius: 4,
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                        )
                ],
              ),
          foregroundDecoration: foregroundDecoration,
          width: isActive ? width : width * 0.8,
          height: isActive ? height : height * 0.8,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child,
          clipBehavior: clipBehavior,
        );
}
