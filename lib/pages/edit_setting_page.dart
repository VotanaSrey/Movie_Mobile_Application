import 'package:flutter/material.dart';
import 'package:movie_app/model/setting_model.dart';
import 'package:movie_app/repos/setting_repo.dart';
class EditSettingPage extends StatefulWidget {
  /// Set up constructor
  final Movie movies;
  EditSettingPage({this.movies});
  @override
  _EditSettingPageState createState() => _EditSettingPageState();
}
class _EditSettingPageState extends State<EditSettingPage> {



  //declare those variables to capture data from TextField().\
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _levelController = TextEditingController();
  var _imgController = TextEditingController();
  var _emailAddressController = TextEditingController();


  // To update setting
  @override
  void initState() {
    super.initState();

    _nameController.text = widget.movies.name;
    _phoneController.text = widget.movies.phone;
    _levelController.text = widget.movies.level;
    _imgController.text = widget.movies.img;
    _emailAddressController.text = widget.movies.emailAddress;
  }

  Future<Movie> _apiSettingData;
  List<Movie> _apiSettingList;


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
      title: Text("Edit Setting"),
      backgroundColor: Colors.black,
      ///// Add new Member
      actions: [
        IconButton(icon: Icon(Icons.done_outlined),
            onPressed: (){
              ///Prevent some problem happend
              if(_nameController.text.trim().isNotEmpty
                  || _phoneController.text.trim().isNotEmpty
                  || _levelController.text.trim().isNotEmpty
                  || _imgController.text.trim().isNotEmpty
                  || _emailAddressController.text.trim().isNotEmpty ){
                Movie settingUpdate = Movie(
                  id: widget.movies.id,
                  name: _nameController.text.trim(),
                  phone: _phoneController.text.trim(),
                  level : _levelController.text.trim(),
                  img:_imgController.text.trim(),
                  emailAddress: _emailAddressController.text.trim()
                );
                updateSettingApi(settingUpdate).then((value) {
                  print("value : $value");
                  if(value == "updated"){
                    _showMassage("Data Updated");
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

  /// Body
  Widget getBody(){
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNameText,
              _buildPhoneText,
              _buildLevelText,
              _buildImageText,
              _buildEmailAdressText,
            ],
          ),
        ),
      ),
    );
  }
  /// Name TextField
  get _buildNameText{
    return TextField(
      controller: _nameController,
      //Set keyboard type
      keyboardType: TextInputType.text,
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
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Name",
        labelStyle: TextStyle(color: Colors.blue),
      ),
      //maxLines: 2,
      //Set the word capital with start
      textCapitalization: TextCapitalization.sentences,
    );
  }
  /// Phone TextField
  get _buildPhoneText{
    return TextField(
      controller: _phoneController,
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
        prefixIcon: Icon(Icons.phone),
        hintText: "Enter Phone Number",
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Phone",
        labelStyle: TextStyle(color: Colors.blue),
      ),
      //maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
    );
  }
  /// Date Of birth TextField
  get _buildLevelText{
    return TextField(
      controller: _levelController,
      //Set keyboard type
      keyboardType: TextInputType.text,
      /// let text correctly
      autocorrect: true,
      /// For text
      obscureText: false, // If true for passwor
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.date_range_sharp),
        hintText: "Enter Level",
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Level",
        labelStyle: TextStyle(color: Colors.blue),
      ),
      //maxLines: 4,
    );
  }
  /// Images TextField
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
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Image",
        labelStyle: TextStyle(color: Colors.blue),
      ),
      //maxLines: 4,
    );
  }
  /// Email Address TextField
  get _buildEmailAdressText{
    return TextField(
      controller: _emailAddressController,
      //Set keyboard type
      keyboardType: TextInputType.text,
      /// let text correctly
      autocorrect: false,
      /// For text
      obscureText: false, // If true for passwor
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: "Enter Email Address",
        hintStyle: TextStyle(color: Colors.black),
        labelText: "Email Address",
        labelStyle: TextStyle(color: Colors.blue),
      ),
      //maxLines: 4,
    );
  }
}
