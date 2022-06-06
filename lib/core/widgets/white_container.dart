import 'package:flutter/material.dart';

class WhiteFormContainer extends Container {
  WhiteFormContainer({
    Key? key,
    required Widget child,
    required Widget icon,
    double borRadius = 20,
    double blurRadius = 10,
    Color decorationColor = Colors.white,
    Color shadowColor = Colors.grey,
  }) : super(
          key: key,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 4.0),
                child: icon,
              ),
              child,
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
