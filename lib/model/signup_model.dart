// To parse this JSON data, do
//
//     final signUp = signUpFromMap(jsonString);

import 'dart:convert';

SignUp signUpFromMap(String str) => SignUp.fromMap(json.decode(str));

String signUpToMap(SignUp data) => json.encode(data.toMap());

class SignUp {
  SignUp({
    this.members,
  });

  List<Member> members;

  factory SignUp.fromMap(Map<String, dynamic> json) => SignUp(
    members: List<Member>.from(json["members"].map((x) => Member.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "members": List<dynamic>.from(members.map((x) => x.toMap())),
  };
}

class Member {
  Member({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  String id;
  String name;
  String email;
  String password;

  factory Member.fromMap(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
  };
}
