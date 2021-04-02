// To parse this JSON data, do
//
//     final settingModel = settingModelFromMap(jsonString);

import 'dart:convert';

SettingModel settingModelFromMap(String str) => SettingModel.fromMap(json.decode(str));

String settingModelToMap(SettingModel data) => json.encode(data.toMap());

class SettingModel {
  SettingModel({
    this.movies,
  });

  List<Movie> movies;

  factory SettingModel.fromMap(Map<String, dynamic> json) => SettingModel(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "movies": List<dynamic>.from(movies.map((x) => x.toMap())),
  };
}

class Movie {
  Movie({
    this.id,
    this.name,
    this.phone,
    this.level,
    this.img,
    this.emailAddress,
  });

  String id;
  String name;
  String phone;
  String level;
  String img;
  String emailAddress;

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    level: json["level"],
    img: json["img"],
    emailAddress: json["email_address"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phone": phone,
    "level": level,
    "img": img,
    "email_address": emailAddress,
  };
}
