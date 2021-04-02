import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/root_app.dart';
import 'package:movie_app/pages/video_detail_page.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: Text(
        "My Downloads",
        style: TextStyle(fontFamily: 'font1',fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.collections_bookmark,
              size: 28,
            ),
            onPressed: () {}),
        IconButton(
          icon: Icon(Icons.brightness_2_outlined),
          onPressed: (){},
        ),
      ],
    );
  }

  Widget getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white,),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                      color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "ON",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueGrey),
              child: Center(
                child: Icon(
                  Icons.file_download,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Never be without Netflix",
              style: TextStyle(fontSize: 20,
                fontFamily: 'font1',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Download shows and movies so you'll never be without something to watch even when you're offline",
                style: TextStyle(
                    height: 1.5, fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                    textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RootApp()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Text(
                      "Click To Download",
                      style: TextStyle(
                          fontFamily: 'font1',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Spacer()
      ],
    );
  }
}
