import 'package:flutter/material.dart';
import 'package:movie_app/json/root_app_json.dart';
import 'package:movie_app/model/setting_model.dart';
import 'package:movie_app/pages/signup_page.dart';
import 'package:movie_app/repos/setting_repo.dart';
import 'package:movie_app/pages/edit_setting_page.dart';



class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  int activeTab = 0;
  Future<SettingModel> _apiSettingData;
  List<Movie> _apiSettingList;

  Movie item;


  @override
  void initState() {
    super.initState();
    _apiSettingData = readSettingApi(); // call readLocalData() from apiflutter_repo file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar(){
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
      title: Text("Setting", style: TextStyle(fontFamily: 'font1'),),
      backgroundColor: Colors.black,
    );
  }
  Widget getBody(){
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: _buildFutureAPI,
    );
  }
  get _buildFutureAPI{
    return FutureBuilder<SettingModel>(
      future: _apiSettingData, //_apiSettingData : Future variable.

      //Check if it has an error

      builder: (context, snapshot){
        if(snapshot.hasError){
          print("${snapshot.error}");
          return Text("${snapshot.error}");
        }
        if(snapshot.connectionState == ConnectionState.done){
          _apiSettingList = snapshot.data.movies;
          return _buildListView;
        }
        else{
          return CircularProgressIndicator(); // show circle syn
        }
      },
    );
  }
  get _buildListView{
    return ListView.builder(
        itemCount: _apiSettingList.length, // _apiSettingList : list variable declared above.
        itemBuilder: (context, index){
          return _buildItem(_apiSettingList[index]);
        }
    );
  }
  _buildItem(Movie item){
    return  Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage("${item.img}"),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "${item.name}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontFamily: "font1",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.white,
            ///Padding
            padding: EdgeInsets.all(10.0),
            /// Margin for build a label
            margin: EdgeInsets.symmetric(vertical: 10.0,
              horizontal: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.date_range, color: Colors.blueGrey,),
                SizedBox(
                  width: 15.0,
                ),
                Text(" Level ${item.level}", style: TextStyle(
                  fontFamily: "AkayaTelivigala",
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.blueGrey,
                ),),

              ],
            ),
          ),
          SizedBox(
            width: 10.0,
            height:5.0,
          ),
          Container(
            color: Colors.white,
            ///Padding
            padding: EdgeInsets.all(10.0),
            /// Margin for build a label
            margin: EdgeInsets.symmetric(vertical: 10.0,
              horizontal: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.phone, color: Colors.blueGrey,),
                SizedBox(
                  width: 15.0,
                ),
                Text("${item.phone}", style: TextStyle(
                  fontFamily: "font1",
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.blueGrey,
                ),),

              ],
            ),
          ),
          Container(
            color: Colors.white,
            ///Padding
            padding: EdgeInsets.all(10.0),
            /// Margin for build a label
            margin: EdgeInsets.symmetric(vertical: 10.0,
              horizontal: 25.0,
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.email_outlined, color: Colors.blueGrey,),
                SizedBox(
                  width: 15.0,
                ),
                Text("${item.emailAddress}", style: TextStyle(
                  fontFamily: "AkayaTelivigala",
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.blueGrey,
                ),),

              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                child: RaisedButton(
                  child: Text("Edit", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "font1",
                  ),),
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditSettingPage(movies: item,))).then((value) {
                          setState(() {
                            _apiSettingData = readSettingApi();
                          });
                    });
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 120,
                child: RaisedButton(
                  child: Text("Sign Out", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "font1",
                  ),),
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                ),
              ),
            ],
          ),
          Card(
            color: Colors.white,
            // padding: EdgeInsets.all(10.0), Card class no padding supported.
            margin: EdgeInsets.symmetric(vertical: 10.0,
              horizontal: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}