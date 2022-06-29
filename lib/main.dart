import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

import 'core/route/app_route.dart';
import 'core/theme/theme_management/theme_manager.dart';

late bool isFirstTimeShowedOnboardScreen;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //  ThemeConst.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  //
  SharedManager prefs = SharedManager.instance;
  await Firebase.initializeApp();

  isFirstTimeShowedOnboardScreen =
      prefs.getBoolPreferences(PreferencesKeys.onboard.toString());
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
      title: 'Vakıfbank SK',
      theme: context.theme,
      initialRoute: isFirstTimeShowedOnboardScreen
          ? (FirebaseAuth.instance.currentUser != null
              ? AppRoutes.home
              : AppRoutes.login)
          : (AppRoutes.onboard),
      routes: AppRoutes.instance.routes,
    );
  }
}
