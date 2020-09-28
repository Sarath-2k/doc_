import 'package:flutter/material.dart';

class Templates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Center(
        child: Text("Choose templates From Here"),
      ),
    );
  }
}
