import 'package:flutter/material.dart';

class WhiteFormContainer extends Container {
  WhiteFormContainer({
    Key? key,
    required Widget child,
    required Widget icon,
    Widget? rightIcon,
    EdgeInsetsGeometry? containerPadding = const EdgeInsets.all(4.0),
    double borRadius = 20,
    double blurRadius = 10,
    Color decorationColor = Colors.white,
    Color shadowColor = Colors.grey,
  }) : super(
          key: key,
          padding: containerPadding,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 4.0),
                child: icon,
              ),
              Expanded(child: child),
              rightIcon ??
                  const SizedBox(
                    height: 0,
                    width: 0,
                  ),
            ],
          ),
          decoration: BoxDecoration(
            color: decorationColor,
            borderRadius: BorderRadius.circular(borRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: blurRadius,
                color: shadowColor,
                blurStyle: BlurStyle.solid,
              )
            ],
          ),
        );
}
