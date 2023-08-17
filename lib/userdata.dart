class UserData {
  String name, email, dob, phone, bio;

  UserData(this.name, this.bio, this.dob, this.email, this.phone);

  UserData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        dob = json['dob'],
        phone = json['phone'],
        bio = json['bio']
  // image = json['image'];
  ;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'dob': dob,
        'phone': phone,
        'bio': bio,
        // 'image': image
      };
}
