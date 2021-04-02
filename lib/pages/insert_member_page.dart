import 'package:flutter/material.dart';
import 'package:movie_app/model/member_model.dart';
import 'package:movie_app/model/setting_model.dart';
import 'package:movie_app/pages/root_app.dart';
import 'package:movie_app/repos/member_repo.dart';
class InsertMemberPage extends StatefulWidget {
  @override
  _InsertMemberPageState createState() => _InsertMemberPageState();
}

class _InsertMemberPageState extends State<InsertMemberPage> {

  //declare those variables to capture data from TextField().
  var _nameController = TextEditingController();
  var _bodyController = TextEditingController();
  var _imgController = TextEditingController();


  Future<MemberModel> _apiMemberData;
  List<Member> _apiMemberList;


  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMassage(String text){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Colors.red,));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(),
      backgroundColor: Colors.black,
      /// Set focus on TextField
      body: InkWell(
        child: getBody(),
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
  Widget getAppBar() {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text("Insert Member", style: TextStyle(
        fontFamily: 'font1',
        fontSize: 25,
      ),),
      backgroundColor: Colors.black,
      ///// Add new Member
      actions: [
        IconButton(icon: Icon(Icons.done_outlined),
            onPressed: (){
              ///Prevent some problem happend
              if(_nameController.text.trim().isNotEmpty
                  || _bodyController.text.trim().isNotEmpty
                  || _imgController.text.trim().isNotEmpty ){
                  Member memberInsert = Member(
                    id: "0",
                    name: _nameController.text.trim(),
                    body: _bodyController.text.trim(),
                    img:_imgController.text.trim(),
                  );
                  insertMemberApi(memberInsert).then((value) {
                    print("value : $value");
                    if(value == "inserted"){
                      //// Back to member list
                      Navigator.of(context).pop();

                    }
                    else{
                      _showMassage("Something went wrong");
                    }
                  });
              }
              else{
                _showMassage("All fields are required!");
              }

            }
        ),
      ],
    );
  }
  Widget getBody(){
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNameText,
              _buildBodyText,
              _buildImageText,
            ],
          ),
        ),
      ),
    );
  }
  get _buildNameText{
    return TextField(
      controller: _nameController,
      //Set keyboard type
      keyboardType: TextInputType.name,
      /// let text correctly
      autocorrect: true,
      /// For text
      obscureText: false, // If true for passwor
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: "Enter Name",
        //Set Icon
        prefixIcon: Icon(Icons.title),
        hintStyle: TextStyle(color: Colors.black,
            fontFamily: 'font1'
        ),
        labelText: "Name",
        labelStyle: TextStyle(color: Colors.blue,
          fontFamily: 'font1'
        ),
      ),
      //maxLines: 2,
      //Set the word capital with start
      textCapitalization: TextCapitalization.sentences,
    );
  }
  get _buildBodyText{
    return TextField(
      controller: _bodyController,
      //Set keyboard type
      keyboardType: TextInputType.name,
      /// let text correctly
      autocorrect: true,
      /// For text
      obscureText: false, // If true for passwor
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.article_outlined),
        hintText: "Enter Description",
        hintStyle: TextStyle(color: Colors.black,
            fontFamily: 'font1'
        ),
        labelText: "Description",
        labelStyle: TextStyle(color: Colors.blue,
          fontFamily: 'font1'
        ),
      ),
      //maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
    );
  }
  get _buildImageText{
    return TextField(
      controller: _imgController,
      //Set keyboard type
      keyboardType: TextInputType.name,
      /// let text correctly
      autocorrect: false,
      /// For text
      obscureText: false, // If true for passwor
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.image_outlined),
        hintText: "Enter Image Link",
        hintStyle: TextStyle(color: Colors.black,
            fontFamily: 'font1'
        ),
        labelText: "Image",
        labelStyle: TextStyle(color: Colors.blue,
            fontFamily: 'font1'
        ),
      ),
      //maxLines: 4,
    );
  }
}
