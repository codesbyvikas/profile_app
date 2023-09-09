import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:profile_app/contacts/contactinfo.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact>? contact;

  @override
  void initState() {
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contact = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor:const  Color.fromARGB(255, 100, 208, 147),
          title: const Text(
            "Contacts",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Container(
            decoration:const  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFA8BFF),
                  Color(0xff2BD2FF),
                  Color(0xff2BFF88),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: ((contact) == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : ListView.builder(
                    itemCount: contact!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Uint8List? image = contact![index].photo;
                      String num = (contact![index].phones.isNotEmpty)
                          ? (contact![index].phones.first.number)
                          : "--";
                      return Card(
                          color: Colors.white.withOpacity(0.68),
                          child: ListTile(
                            leading: (contact![index].photo == null)
                                ? const CircleAvatar(child: Icon(Icons.person))
                                : CircleAvatar(
                                    backgroundImage: MemoryImage(image!)),
                            title: Text(
                                "${contact![index].name.first} ${contact![index].name.last}"),
                            subtitle: Text(num),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContactInfo(
                                    contacts: contact![index],
                                  ),
                                ),
                              );
                            },
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ));
                    },
                  ))));
  }
}
