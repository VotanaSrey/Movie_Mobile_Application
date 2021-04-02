// To parse this JSON data, do
//
//     final memberModel = memberModelFromMap(jsonString);

import 'dart:convert';

MemberModel memberModelFromMap(String str) => MemberModel.fromMap(json.decode(str));

String memberModelToMap(MemberModel data) => json.encode(data.toMap());

class MemberModel {
  MemberModel({
    this.members,
  });

  List<Member> members;

  factory MemberModel.fromMap(Map<String, dynamic> json) => MemberModel(
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
    this.body,
    this.img,
  });

  String id;
  String name;
  String body;
  String img;

  factory Member.fromMap(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    body: json["body"],
    img: json["img"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "body": body,
    "img": img,
  };
}
