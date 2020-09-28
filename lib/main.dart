import 'package:flutter/material.dart';

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
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text(
                "Recent",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text(
                "Shared With Me",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.stars),
              title: Text(
                "Starred",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.cloud_download),
              title: Text(
                "Offline Files",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text(
                "Bin",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                "Notifications",
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15,vertical:10),
              child: Divider(
                thickness:2,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help & Feedback",
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text(
                "Cloud",
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
