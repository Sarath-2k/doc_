import 'package:doc_/drawerpages/bin.dart';
import 'package:doc_/drawerpages/cloud.dart';
import 'package:doc_/drawerpages/help_feedback.dart';
import 'package:flutter/material.dart';

import 'drawerpages/Shared.dart';
import 'drawerpages/notifications.dart';
import 'drawerpages/recent.dart';
import 'drawerpages/saved.dart';
import 'drawerpages/settings.dart';
import 'drawerpages/starred.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget current_page = Recent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            // Recent
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text(
                "Recent",
              ),
              onTap: () {
                setState(() {
                  current_page = Recent();
                });
              },
            ),
            // SharedWithMe
            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text(
                "Shared With Me",
              ),
              onTap: () {
                
                setState(() {
                  current_page = Shared();
                });
                },
            ),
            //Starred
            ListTile(
              leading: Icon(Icons.stars),
              title: Text(
                "Starred",
              ),
              onTap: () {
                setState(() {
                  current_page = Starred();
                });
                   },
            ),
            //Offline Files
            ListTile(
              leading: Icon(Icons.cloud_download),
              title: Text(
                "Offline Files",
              ),
              onTap: () {
                setState(() {
                  current_page = Saved();
                });
                   },
            ),
            //Bin
            ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text(
                "Bin",
              ),
              onTap: () {
                setState(() {
                  current_page = Bin();
                });},
            ),
            //Notifications
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                "Notifications",
              ),
              onTap: () {
                setState(() {
                  current_page = Notifications();
                });},
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15,vertical:10),
              child: Divider(
                thickness:2,
              ),
            ),
            //Settings
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
              ),
              onTap: () {
                setState(() {
                  current_page = Settings();
                });
            },),
            //Help&Feedback
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help & Feedback",
              ),
              onTap: () {
                setState(() {
                  current_page = Help_Feedback();
                });},
            ),
            //Cloud
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text(
                "Cloud",
              ),
              onTap: () {
                setState(() {
                  current_page = Cloud();
                });;},
            ),
          ],
        ),
      ),
      body: current_page
    );
  }
}
