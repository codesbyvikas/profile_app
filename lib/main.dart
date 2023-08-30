import 'package:flutter/material.dart';
import 'package:profile_app/navigator/navigator.dart';
import 'package:profile_app/contacts/contactinfo.dart';
import 'package:profile_app/weather/loadweather.dart';
import 'package:profile_app/weather/weather.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const NavigatorBar());

    // home: ContactInfo());
  }
}
