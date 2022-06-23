import 'package:flutter/material.dart';

import '../../screen/authentication/forgot/view/forgot_screen.dart';
import '../../screen/authentication/login/view/login_screen.dart';
import '../../screen/authentication/onboard/view/onboard_screen.dart';
import '../../screen/authentication/register/view/register_screen.dart';
import '../../screen/menu/home/home_screen.dart';

class AppRoutes {
  static AppRoutes? _instance;
  static AppRoutes get instance {
    _instance ??= AppRoutes._init();
    return _instance!;
  }

  AppRoutes._init();

  static const String initRoute = '/';
  static const String onboard = '/onboard';
  static const String home = '/home';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgot = '/forgot';

  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    initRoute: (context) => const MainScaffold(),
    onboard: (context) => OnBoardScreen(),
    login: (context) => LoginScreen(),
    home: (context) => const HomeScreen(),
    forgot: (context) => const ForgotScreen(),
    register: (context) => RegisterScreen(),
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
