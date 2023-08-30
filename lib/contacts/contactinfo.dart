import 'package:flutter/material.dart';
import 'package:profile_app/contacts/contacts.dart';
import 'package:profile_app/navigator/navigator.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  var namecontac = 'b';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact info",
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [Text(namecontact)],
          ),
        ),
      ),
    );
  }
}
