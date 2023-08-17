import 'package:flutter/material.dart';
import 'package:profile_app/editprofile.dart';

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
          primarySwatch: Colors.green,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const EditProfile());
    // home: const ProfilePage());
  }
}
