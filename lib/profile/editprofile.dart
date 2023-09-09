import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_app/profile/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  File? imageFile;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata')!);

    UserData user = UserData.fromJson(jsondatais);

    if (jsondatais.isNotEmpty) {
      _name.value = TextEditingValue(text: user.name);
      _email.value = TextEditingValue(text: user.email);
      _bio.value = TextEditingValue(text: user.bio);
      _dob.value = TextEditingValue(text: user.dob);
      _phone.value = TextEditingValue(text: user.phone);
    }
  }

  void storeData() {
    UserData user =
        UserData(_name.text, _bio.text, _dob.text, _email.text, _phone.text);
    String userdata = jsonEncode(user);

    sharedPreferences.setString('userdata', userdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: const Text("Profile App"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ListView(
            children: <Widget>[
              profilePic(),
              const SizedBox(height: 20),
              name(),
              const SizedBox(height: 20),
              phoneNumber(),
              const SizedBox(height: 20),
              emaiAdd(),
              const SizedBox(height: 20),
              dateOfBirth(),
              const SizedBox(height: 20),
              bio(),
              const SizedBox(height: 20),
              saveButton(),
              const SizedBox(height: 7),
              clearButton()
            ],
          ),
        ));
  }

  Widget profilePic() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 83,
            backgroundColor: Colors.green,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80.0,
                backgroundImage: imageFile == null
                    ? const AssetImage("assets/images/profile.png")
                    : FileImage(File(imageFile!.path)) as ImageProvider),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => cameraButton()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cameraButton() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose a profile picture",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                // <-- TextButton
                onPressed: () {
                  imagePicked(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  size: 24.0,
                ),
                label: const Text(
                  'Camera       ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton.icon(
                // <-- TextButton
                onPressed: () {
                  imagePicked(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image,
                  size: 24.0,
                ),
                label: const Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future imagePicked(ImageSource source) async {
    final imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) return;
    final imageTemp = File(imageFile.path);
    setState(() {
      this.imageFile = imageTemp;
    });
  }

  Widget name() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
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
        labelText: "Full Name",
      ),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget phoneNumber() {
    return TextField(
      controller: _phone,
      maxLength: 10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
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

  Widget emaiAdd() {
    return TextField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
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
    return TextField(
      controller: _dob,
      maxLength: 10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
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
          labelText: "Date of Birth",
          helperText: "expected format:dd/mm/yyyy",
          counterText: ""),
      cursorColor: Colors.black12,
      cursorHeight: 20,
    );
  }

  Widget bio() {
    return TextField(
      controller: _bio,
      maxLines: 4,
      decoration: const InputDecoration(
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
      cursorColor: const Color.fromARGB(31, 52, 44, 44),
      cursorHeight: 20,
    );
  }

  Widget saveButton() {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: const Size(30, 30),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 15)),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Success"),
            content: const Text("Details Saved"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    "okay",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        storeData();
      },
      child: const Text('save'),
    );
  }

  Widget clearButton() {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: const Size(60, 30),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          textStyle: const TextStyle(fontSize: 15)),
      onPressed: () async {
        setState(() {
          _name.value = const TextEditingValue(text: "");
          _email.value = const TextEditingValue(text: "");
          _bio.value = const TextEditingValue(text: "");
          _dob.value = const TextEditingValue(text: "");
          _phone.value = const TextEditingValue(text: "");
        });
        storeData();
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Alert"),
            content: const Text("Details Deleted"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    "okay",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: const Text('clear'),
    );
  }
}
