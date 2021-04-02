import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:movie_app/model/setting_model.dart';

const iosSimulator = "localhost";
const androidEmulator = "10.0.2.2"; // use together between laptop and phone
const livePhone = "172.20.10.3"; // Laptop's ip

// ******************* read data from API *******************
Future<SettingModel> readSettingApi() async{

  String address = iosSimulator;
  String url ="http://$address:8890/movie_app/read_setting.php";
  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    /// articalDbFromMap: use for fetch data
    return compute(settingModelFromMap ,response.body);
  }
  else{
    throw Exception("Error while reading Data");
  }
}

// ******************* update data to API *******************

Future<String> updateSettingApi(Movie movie) async{
  String address = iosSimulator;
  String url = "http://$address:8890/movie_app/update_setting.php";
  http.Response response = await http.post(
    url,
    body: movie.toMap(),
  );
  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}