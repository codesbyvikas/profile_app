import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Select Gender';
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
              firstName(),
              const SizedBox(height: 20),
              lastName(),
              const SizedBox(height: 20),
              phoneNumber(),
              const SizedBox(height: 20),
              selectGender(),
              const SizedBox(height: 20),
              emaiAdd(),
              const SizedBox(height: 20),
              dateOfBirth(),
              const SizedBox(height: 20),
              bio()
            ],
          ),
        ));
  }

  Widget firstName() {
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
          color: Color.fromARGB(255, 98, 91, 91),
        ),
        labelText: "First Name",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget lastName() {
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
          color: Color.fromARGB(255, 98, 91, 91),
        ),
        labelText: "Last Name",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget phoneNumber() {
    return const TextField(
      maxLength: 10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
            color: Color.fromARGB(255, 98, 91, 91),
          ),
          labelText: "Phone no.",
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          counterText: ""),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget selectGender() {
    return DropdownButtonFormField<String>(
      // Step 3.
      value: dropdownValue,
      // Step 4.
      items: <String>["Select Gender", "Male", "Female", "Others"]
          .map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
            ),
          );
        },
      ).toList(),
      // Step 5.
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
      ),
      decoration: const InputDecoration(
        labelText: "Gender",
        prefixIcon: Icon(
          Icons.people,
          color: Color.fromARGB(255, 98, 91, 91),
        ),
      ),
    );
  }

  Widget emaiAdd() {
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
          color: Color.fromARGB(255, 98, 91, 91),
        ),
        labelText: "Email adress",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget dateOfBirth() {
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
          color: Color.fromARGB(255, 98, 91, 91),
        ),
        labelText: "Date of Birth(dd/mm/yyyy)",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget bio() {
    return const TextField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2)),
        prefixIcon: Icon(
          Icons.info,
          color: Color.fromARGB(255, 98, 91, 91),
        ),
        labelText: "bio",
      ),
      cursorColor: Color.fromARGB(31, 52, 44, 44),
      cursorHeight: 20,
    );
  }
}
