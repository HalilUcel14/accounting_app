import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/route/app_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await FirebaseAuthSignOutHelper().signOut();
        await Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.login, (route) => false);
      }),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
