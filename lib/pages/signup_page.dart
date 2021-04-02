import 'package:flutter/material.dart';
import 'package:movie_app/model/signup_model.dart';
import 'package:movie_app/repos/signup_repo.dart';

import 'login_page.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Future<Member> _apiMemberData;
  List<Member> _apiMemberList;


  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showSnackbar(String text){
    var snackBar = SnackBar(content: Text(text), backgroundColor: Colors.blue,);
    _scaffoldKey.currentState.showSnackBar(snackBar,);
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
      title: Text("Sign Up",style: TextStyle(
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
            _buildName,
            SizedBox(
              height: 12,
            ),
            _buildEmail,
            SizedBox(
              height: 12,
            ),
            _buildPassword,
            SizedBox(
              height: 30,
            ),
            _buildSignUp,
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

  get _buildName{
    return Container(
      width: 400,
      height: 50,
      color: Colors.white,
      //padding: EdgeInsets.all(8),
      child: TextField(
        // Email Keyboard type
        keyboardType: TextInputType.text,
        controller: _nameController,
        decoration: InputDecoration(
          hintText: "Enter your name",
          prefixIcon: Icon(Icons.text_fields),
          border: InputBorder.none,
        ),
      ),
    );
  }
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
  get _buildSignUp{
    return Container(
      width: 400,
      child: RaisedButton(
        child: Text("Sign Up", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "font1",
        ),),
        color: Colors.blue,
        onPressed: (){
          if(_nameController.text.trim().isNotEmpty
              || _emailController.text.trim().isNotEmpty
              || _passwordController.text.trim().isNotEmpty ){
            Member userInsert = Member(
              id: "0",
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password:_passwordController.text.trim(),
            );
            insertUserApi(userInsert).then((value) {
              print("value : $value");
              if(value == "inserted"){
                //// Back to member list
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage())
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
      child: Text("Go back to Sign In", style: TextStyle(
        color: Colors.white,
        fontFamily: "font1",
      ),),
      onPressed: (){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
  }
}
