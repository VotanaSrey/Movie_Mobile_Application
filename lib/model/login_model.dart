// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

Login loginFromMap(String str) => Login.fromMap(json.decode(str));

String loginToMap(Login data) => json.encode(data.toMap());

class Login {
  Login({
    this.members,
  });

  List<Member> members;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    members: List<Member>.from(json["members"].map((x) => Member.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "members": List<dynamic>.from(members.map((x) => x.toMap())),
  };
}

class Member {
  Member({
    this.id,
    this.email,
    this.password,
  });

  String id;
  String email;
  String password;

  factory Member.fromMap(Map<String, dynamic> json) => Member(
    id: json["id"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "password": password,
  };
}
