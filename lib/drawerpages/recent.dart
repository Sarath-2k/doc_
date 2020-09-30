import 'package:doc_/main.dart';
import 'package:flutter/material.dart';

import '../fileops.dart';

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  LocalStorage localStorage = LocalStorage();
  @override
  void initState() {
    localStorage.listFilesInDirectory().then((value) => setState(() {
          current_page = Recent();
          print("State Set");
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: textname.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(textname[index]),
        onTap: (){},
        ),

    ));
  }
}
