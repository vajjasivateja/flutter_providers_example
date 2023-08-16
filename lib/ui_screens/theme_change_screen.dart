import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_change_provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChangeProvider = Provider.of<ThemeChangerProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Change Theme")),
            body: Container(
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text("Light Theme"),
                    value: ThemeMode.light,
                    groupValue: themeChangeProvider.themeMode,
                    onChanged: themeChangeProvider.setTheme,
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text("Dark Theme"),
                    value: ThemeMode.dark,
                    groupValue: themeChangeProvider.themeMode,
                    onChanged: themeChangeProvider.setTheme,
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text("System Theme"),
                    value: ThemeMode.system,
                    groupValue: themeChangeProvider.themeMode,
                    onChanged: themeChangeProvider.setTheme,
                  ),
                  Icon(Icons.favorite)
                ],
              ),
            )));
  }
}
