import 'package:flutter/material.dart';
import 'package:movie_app/model/member_model.dart';
import 'package:movie_app/repos/member_repo.dart';

import 'insert_member_page.dart';
class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  Future<MemberModel> _apiMemberData;
  List<Member> _apiMemberList;

  //// *************** Show message ***************

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMassage(String text){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text),
      backgroundColor: Colors.red,));
  }

  @override
  void initState() {
    super.initState();
    _apiMemberData = readMemberApi(); // call readLocalData() from  file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
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
      title: Text("Top Member",style: TextStyle(
        fontSize: 25,
        fontFamily: 'font1',
      ),),
      backgroundColor: Colors.black,
      ///// Add new Member
      actions: [
        _buildInsertIcon,
      ],
    );
  }
  get _buildInsertIcon{
    return IconButton( icon: Icon(Icons.add, color: Colors.white,),onPressed: (){
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => InsertMemberPage(),
      )).then((value) {
        setState(() {
          _apiMemberData = readMemberApi();
        });
      });
    });
  }
  Widget getBody(){
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: _buildFutureAPI,
    );
  }
  get _buildFutureAPI{
    return FutureBuilder<MemberModel>(
      future: _apiMemberData, //_apiFlutterData : Future variable.

      //Check if it has an error

      builder: (context, snapshot){
        if(snapshot.hasError){
          print("${snapshot.error}");
          return Text("${snapshot.error}");
        }
        if(snapshot.connectionState == ConnectionState.done){
          _apiMemberList = snapshot.data.members;
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
        itemCount: _apiMemberList.length, // _apiFlutterList : list variable declared above.
        itemBuilder: (context, index){
          return _buildItem(_apiMemberList[index]);
        }
    );
  }
  _buildItem(Member item){
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(3.0),
        //leading: Image.asset("assets/images/logo.ico"),
        leading: Image.network("${item.img}"),
        title: Text("${item.name}",style: TextStyle(
          fontFamily: 'font1',
          fontSize: 15,
        ),),
        subtitle: Text("${item.body}",style: TextStyle(
          fontFamily: 'font2',
          fontSize: 15,
        ),),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red,),
          onPressed: (){
            deleteMemberApi(item).then((value) {
              print("value : $value");
              if(value == "deleted"){
                _showMassage("Data Deleted");
                setState(() {
                  _apiMemberList.remove(item);
                });
              }
              else{
                _showMassage("Something went wrong");
              }
            });
          },
        ),
      ),
    );
  }
}
