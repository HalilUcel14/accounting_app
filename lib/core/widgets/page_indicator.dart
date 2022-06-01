import 'package:flutter/material.dart';

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
