import 'package:counting_app/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class MySnackBar extends SnackBar {
  MySnackBar({
    Key? key,
    Color? colors = Colors.transparent,
    double elevations = 0.0,
    required String titleText,
    required List<String> errorList,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
  }) : super(
          key: key,
          content: _SnackBarChild(
            errorList: errorList,
            titleText: titleText,
          ),
          backgroundColor: colors,
          elevation: elevations,
          behavior: snackBarBehavior,
        );
}

class _SnackBarChild extends StatelessWidget {
  const _SnackBarChild(
      {Key? key, required this.errorList, required this.titleText})
      : super(key: key);
  //
  final List<String> errorList;
  final String titleText;
  //
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Ana Kutu
        _errorTextBox(context),
        _iconsBox(context),
        _errorTitleBox(context),
      ],
    );
  }

  Positioned _errorTitleBox(BuildContext context) {
    return Positioned(
      child: Container(
        padding: context.padAllS,
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusS,
          shape: BoxShape.rectangle,
          color: ThemeConst.primaryColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black38,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.heightS,
            color: Colors.black,
          ),
        ),
      ),
      right: context.heightM,
    );
  }

  Positioned _iconsBox(BuildContext context) {
    return Positioned(
      child: Container(
        height: context.heightL,
        width: context.heightL,
        padding: context.padAllXS * 1.5,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeConst.primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black38,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: Image.asset(
          "exclamation".getPngIcon,
          color: Colors.black87,
        ),
      ),
      left: context.heightN,
    );
  }

  Padding _errorTextBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.heightXL / 2),
      child: Container(
        padding:
            EdgeInsets.only(top: context.heightL / 1.75, left: context.heightS),
        height: context.heightXXL * 1.2,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: context.borderRadiusN,
          color: ThemeConst.primaryDarkColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              blurStyle: BlurStyle.solid,
              color: Colors.grey,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              errorList.length,
              (index) => Row(
                children: [
                  Text(
                    errorList[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.heightS * 0.9,
                    ),
                  ),
                  SizedBox(height: context.heightN)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
