import 'package:flutter/material.dart';
import 'package:profile_app/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: HomePage());
  }
}
