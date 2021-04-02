import 'package:flutter/material.dart';
import 'package:movie_app/pages/root_app.dart';
import 'package:movie_app/pages/setting_page.dart';
import 'package:movie_app/pages/signup_page.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignupPage(),
  ));
}