import 'package:counting_app/screen/authentication/onboard/view/onboard_screen.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static AppRoutes? _instance;
  static AppRoutes get instance {
    _instance ??= AppRoutes._init();
    return _instance!;
  }

  AppRoutes._init();

  static const String initRoute = '/';
  static const String onboard = '/ONBOARD';
  static const String menu = '/MENU';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    initRoute: (context) => const MainScaffold(),
    onboard: (context) => OnBoardScreen(),
    // menu: (context) => const MenuScreen(),
  };
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Scaffold"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: const Text("This Screen is Initial Route Page"),
        ),
      ),
    );
  }
}
