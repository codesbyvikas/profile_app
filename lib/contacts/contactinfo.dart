import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final Contact contacts;

  ContactInfo({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text((contacts.name.first) + "'s" + " details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: ListView(
          children: <Widget>[
            contactImage(),
            const SizedBox(height: 20),
            contactName(),
            const SizedBox(height: 5),
            contactNum(),
            const SizedBox(height: 20),
            callButton(),
          ],
        ),
      ),
    );
  }

  Widget contactImage() {
    return const Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              backgroundColor: Colors.black,
              radius: 80.0,
              backgroundImage: AssetImage("assets/images/contact_profile.png"))
        ],
      ),
    );
  }

  Widget contactName() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 211, 223),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          "Name:" + contacts.displayName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget contactNum() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 211, 223),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          "Phone no:" + contacts.phones.first.number,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget callButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton.icon(
          // <-- TextButton
          onPressed: () {
            launchUrl(Uri.parse('tel:${contacts.phones.first.number}'));
          },
          icon: const Icon(
            Icons.call,
            size: 28.0,
          ),
          label: const Text(
            'call       ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton.icon(
          // <-- TextButton
          onPressed: () {
            var whatsappUrl =
                "whatsapp://send?phone=${contacts.phones.first.number}";
            launchUrl(Uri.parse(whatsappUrl));
          },
          icon: const Icon(
            Icons.chat,
            size: 28.0,
          ),
          label: const Text(
            'whatsApp',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
