import 'package:doc_/blankdoc.dart';
import 'package:doc_/drawerpages/bin.dart';
import 'package:doc_/drawerpages/cloud.dart';
import 'package:doc_/drawerpages/help_feedback.dart';
import 'package:doc_/templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
      darkTheme: ThemeData(
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  Widget current_page = Recent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
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
                });
              },
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
                });
              },
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Divider(
                thickness: 2,
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
              },
            ),
            //Help&Feedback
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help & Feedback",
              ),
              onTap: () {
                setState(() {
                  current_page = HelpFeedback();
                });
              },
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
                });
              },
            ),
          ],
        ),
      ),
      body: current_page,
      floatingActionButton: SpeedDial(
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          visible: true,
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.edit),
              backgroundColor: Colors.red,
              label: "New Document",
              labelStyle: TextStyle(fontSize:20,fontWeight: FontWeight.w500),
              labelBackgroundColor: Colors.black45,
              onTap: () {
                print("New Document Tapped");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BlankDoc()));
              }
            ),
            SpeedDialChild(
              child: Icon(Icons.description),
              backgroundColor: Colors.blue,
              label: "Use a Template",
              labelStyle: TextStyle(fontSize:20,fontWeight: FontWeight.w500,),
              labelBackgroundColor: Colors.black45,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Templates()));},
            ),
          ],
        ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      title: Text("Doc"),
    );
  }
}
