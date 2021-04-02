import 'package:flutter/material.dart';
import 'package:movie_app/json/root_app_json.dart';
import 'package:movie_app/pages/coming_soon_page.dart';
import 'package:movie_app/pages/download_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/search_page.dart';
import 'package:movie_app/pages/setting_page.dart';

import 'member_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
      appBar: getAppbar(),
      drawer: getDrawer(),
    );
  }
  Widget getDrawer(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset(
                "assets/images/logo_mv.jpg",
                height: 7,
              ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home", style: TextStyle(
              fontFamily: 'font1',
              fontSize: 17,
            ),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RootApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.play_circle_fill),
            title: Text("Coming Soon"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.download_outlined),
            title: Text("Download",style: TextStyle(
              fontFamily: 'font1',
              fontSize: 17,
            ),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DownloadPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Search",style: TextStyle(
              fontFamily: 'font1',
              fontSize: 17,
            ),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SearchPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account_sharp),
            title: Text("Top Member",style: TextStyle(
              fontFamily: 'font1',
              fontSize: 17,
            ),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MemberPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting",style: TextStyle(
              fontFamily: 'font1',
              fontSize: 17,
            ),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget getAppbar(){
    return AppBar(
      title: Text(
        "Movie App",
        style: TextStyle(
          fontFamily: 'font1',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SettingPage()));
          },
        )
      ],
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [HomePage(), ComingSoonPage(), SearchPage(), DownloadPage()],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: activeTab == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                        fontSize: 10,
                        color: activeTab == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5)),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
