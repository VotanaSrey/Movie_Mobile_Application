import 'package:http/http.dart' as http;
import 'package:movie_app/model/login_model.dart';
import 'package:movie_app/model/signup_model.dart';


const iosSimulator = "localhost";
const androidEmulator = "10.0.2.2"; // use together between laptop and phone
const livePhone = "172.20.10.3"; // Laptop's ip


// ******************* Insert data into API/ Database *******************
Future<String> insertLoginUserApi(userLoginInsert) async{
  String address = iosSimulator;
  String url = "http://$address:8890/movie_app/login.php";
  http.Response response = await http.post(
    url,
    body: userLoginInsert.toMap(),
  );
  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}