import 'package:flutter/material.dart';
import 'package:profile_app/contacts/contacts.dart';
import 'package:profile_app/profile/editprofile.dart';
import 'package:profile_app/weather/weather.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int myIndex = 0;

  final List _screens = [EditProfile(), Contacts(), Weather()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[myIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 236, 237, 238),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.grey,
          elevation: 0,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: "Weather",
            ),
          ],
        ),
      ),
    );
  }
}
