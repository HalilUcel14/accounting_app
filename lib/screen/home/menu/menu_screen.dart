import 'package:counting_app/core/theme_management/i_theme_manager.dart';
import 'package:counting_app/core/theme_management/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  //
  late final AnimationController _controller;
  //
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    context.read<ThemeManager>().addListener(() {
      if (ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT) {
        _controller.animateTo(0, duration: const Duration(milliseconds: 1000));
      } else {
        _controller.animateTo(0.5,
            duration: const Duration(milliseconds: 1000));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Manager"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () async => await Future.delayed(
                  const Duration(milliseconds: 200),
                  () => ThemeManager.instance.changeTheme(
                    ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT
                        ? ThemeEnum.DARK
                        : ThemeEnum.LIGHT,
                  ),
                ),
                child: _controller.isCompleted
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.night_shelter),
                // child: AnimatedIcon(
                //   icon: AnimatedIcons.event_add,
                //   progress: _controller,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
