import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile App"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ListView(
            children: <Widget>[
              textField1(),
              const SizedBox(height: 20),
              textField2(),
              const SizedBox(height: 20),
              textField3(),
              const SizedBox(height: 20),
              textField4(),
            ],
          ),
        ));
  }

  Widget textField1() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        labelText: "Name",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget textField2() {
    return const TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        labelText: "Phone no.",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget textField3() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        labelText: "Email adress",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget textField4() {
    return const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.cake,
          color: Colors.black,
        ),
        labelText: "Email adress",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }
}
