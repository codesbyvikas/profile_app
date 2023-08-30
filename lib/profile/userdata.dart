class UserData {
  String name, email, dob, phone, bio;
  // imagePath;

  UserData(
    this.name,
    this.bio,
    this.dob,
    this.email,
    this.phone,
    // this.imagePath);
  );

  UserData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        dob = json['dob'],
        phone = json['phone'],
        bio = json['bio']
  // imagePath = json['imagePath']
  // image = json['image'];
  ;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'dob': dob,
        'phone': phone,
        'bio': bio,
        // 'imagePath': imagePath
        // 'image': image
      };
}
