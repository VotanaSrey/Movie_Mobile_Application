import 'package:flutter/material.dart';
import 'package:movie_app/model/login_model.dart';
import 'package:movie_app/pages/root_app.dart';
import 'package:movie_app/pages/signup_page.dart';
import 'package:movie_app/repos/login_repo.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  Future<Login> _apiMemberData;
  List<Login> _apiMemberList;


  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showSnackbar(String text){
    var snackBar = SnackBar(content: Text(text),backgroundColor: Colors.blue,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      body: _buildBody,
      appBar: _buildAppBar,
    );
  }
  get _buildAppBar{
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Login",style: TextStyle(
        fontSize: 30,
        fontFamily: "font1",
        color: Colors.white,
      ),),
    );
  }
  get _buildBody{
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Container(
        height: 300,
        width: 450,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildEmail,
            SizedBox(
              height: 20,
            ),
            _buildPassword,
            SizedBox(
              height: 30,
            ),
            _buildLogin,
            _buildSignUpPage,
          ],
        ),
      ),
    );
  }
  // get _buildLogo{
  //   return Container(
  //     child: Image.network(logo),
  //   );
  // }
  get _buildEmail{
    return Container(
      width: 400,
      height: 50,
      color: Colors.white,
      //padding: EdgeInsets.all(8),
      child: TextField(
        // Email Keyboard type
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: InputDecoration(
          hintText: "Enter your email",
          prefixIcon: Icon(Icons.email_outlined),
          border: InputBorder.none,
        ),
      ),
    );
  }

  bool _hidden = true;

  get _buildPassword{
    return Container(
      width: 400,
      height: 50,
      color: Colors.white,
      //padding: EdgeInsets.all(8),
      child: TextField(
        // open or close eye to secure the password
        obscureText: _hidden,
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "Enter your password",
          border: InputBorder.none,
          prefixIcon: InkWell(child: Icon(_hidden ? Icons.visibility : Icons.visibility_off), onTap: (){
            setState(() {
              _hidden = !_hidden;
            });
          },),
        ),
      ),
    );
  }
  get _buildLogin{
    return Container(
      width: 400,
      child: RaisedButton(
        child: Text("Login", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "font1",
        ),),
        color: Colors.blue,
        onPressed: (){
          if(_emailController.text.trim().isNotEmpty
              || _passwordController.text.trim().isNotEmpty ){
            Member userLoginInsert = Member(
              id : "0",
              email : _emailController.text.trim(),
              password :_passwordController.text.trim(),
            );
            insertLoginUserApi(userLoginInsert).then((value) {
              print("value : $value");
              if(value == "inserted"){
                //// Back to member list
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RootApp())
                );

              }
              else{
                _showSnackbar("Something went wrong");
              }
            });
          }
          else{
            _showSnackbar("All fields are required!");
          }
        },
      ),
    );
  }
  get _buildSignUpPage{
    return MaterialButton(
      child: Text("Click here to sign up", style: TextStyle(
        color: Colors.white,
        fontFamily: "font1",
      ),),
      onPressed: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignupPage()));
      },
    );
  }
}
