import 'package:doc_/1.dart';
import 'package:doc_/2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';

class BlankDoc extends StatefulWidget {
  @override
  _BlankDocState createState() => _BlankDocState();
}

class _BlankDocState extends State<BlankDoc> {
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  final _scaffoldState = GlobalKey<ScaffoldState>();
  String result = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Doc"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final value = await _keyEditor.currentState.getText();
              _scaffoldState.currentState.showSnackBar(SnackBar(
                duration: Duration(seconds: 5),
                content: Text(value),
              ));
            },
          )
        ],
      ),
      // backgroundColor: Colors.blac,
      body: FlutterSummernote(
        hint: "Your text here...",
        decoration: BoxDecoration(
          color:Colors.black26,
        ),
        key: _keyEditor,
        // customToolbar: """
        //   [
        //     ['style', ['bold', 'italic', 'underline', 'clear']],
        //     ['font', ['strikethrough', 'superscript', 'subscript']]
        //   ]
        // """,
      ),
    );
  }
}
