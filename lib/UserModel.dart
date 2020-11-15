import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.fullName,
    this.email,
    this.state,
    this.password,
    this.phno,
    this.location,
  });

  String fullName;
  String email;
  String state;
  String password;
  String phno;
  String location;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fullName: json["full_name"],
    email: json["email"],
    state: json["state"],
    password: json["password"],
    phno: json["phno"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "state": state,
    "password": password,
    "phno": phno,
    "location": location,
  };
}
