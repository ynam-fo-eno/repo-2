// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class UserModel {

 
  var id;
  var name_1;
  var name_2;
  var phone_no;
  var email;
  var password;
  var photo;

  





  UserModel({

    required this.id,
    required this.name_1,
    required this.name_2,
    required this.phone_no,
    required this.email,
    required this.password,
    required this.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? '',
      name_1: json["name_1"] ?? '',
      name_2: json["name_2"] ?? '',
      phone_no: json["phone_no"] ?? '',
      email: json["email"] ?? '',
      password: json["password"] ?? '',
      photo: json["photo"] ?? '',
    );
  }
}