import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:movie_app/model/member_model.dart';


const iosSimulator = "localhost";
const androidEmulator = "10.0.2.2"; // use together between laptop and phone
const livePhone = "172.20.10.3"; // Laptop's ip

// ******************* read data from API *******************
Future<MemberModel> readMemberApi() async{

  String address = iosSimulator;
  String url ="http://$address:8890/movie_app/read_member.php";
  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    /// articalDbFromMap: use for fetch data
    return compute(memberModelFromMap ,response.body);
  }
  else{
    throw Exception("Error while reading Data");
  }
}

// ******************* Insert data into API/ Database *******************
Future<String> insertMemberApi(Member memberInsert) async{
  String address = iosSimulator;
  String url = "http://$address:8890/movie_app/insert_member.php";
  http.Response response = await http.post(
    url,
    body: memberInsert.toMap(),
  );
  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

// ******************* delete data to API *******************

Future<String> deleteMemberApi(Member memberDelete) async{
  String address = iosSimulator;
  String url = "http://$address:8890/movie_app/delete_member.php";
  http.Response response = await http.post(
    url,
    body: memberDelete.toMap(),
  );
  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}