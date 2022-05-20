import 'package:counting_app/core/theme_management/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counting_app/core/theme_management/theme_extension.dart';

void main() {
  //runApp(const MyApp());
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager.instance),
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.theme,
      home: const Scaffold(),
    );
  }
}
