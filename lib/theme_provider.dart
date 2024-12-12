import 'package:flutter/material.dart';
import 'theme_manager.dart';

class ThemeProvider extends StatefulWidget {
  const ThemeProvider({Key? key}) : super(key: key);

  @override
  _ThemeProviderState createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  ThemeData _currentTheme = ThemeManager.lightTheme;

  void toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == ThemeManager.lightTheme
          ? ThemeManager.darkTheme
          : ThemeManager.lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode
          .system, // Используйте ThemeMode.system для автоматического выбора темы
    );
  }
}
