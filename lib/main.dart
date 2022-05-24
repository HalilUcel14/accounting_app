import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/shared_constants.dart';
import 'core/route/app_route.dart';
import 'core/theme/theme_management/theme_extension.dart';
import 'core/theme/theme_management/theme_manager.dart';

late bool _isFirstTimeShowed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  WidgetsFlutterBinding.ensureInitialized();
  //
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _isFirstTimeShowed = prefs.getBool(SharedConstants.onboard) ?? false;
  //
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager.instance),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.theme,
      initialRoute:
          _isFirstTimeShowed ? AppRoutes.initRoute : AppRoutes.onboard,
      routes: AppRoutes.instance.routes,
    );
  }
}
