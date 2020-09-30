import 'package:doc_/fileops.dart';
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

  LocalStorage localStorage = LocalStorage();

  String doc_name = "Unknown";

  TextEditingController savedialogue;

  var _value;
  @override
  void initState() {
    // TODO: implement initState
    savedialogue = new TextEditingController();
    super.initState();
  }

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
              if (doc_name == "Unknown") {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Give name to your file"),
                        content: TextField(
                          decoration:
                              new InputDecoration(hintText: "Update Info"),
                          controller: savedialogue,
                        ),
                        actions: <Widget>[
                          //cancel
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          //save
                          FlatButton(
                              child: Text("Save"),
                              onPressed: () {
                                setState(() async {
                                  doc_name = savedialogue.text;
                                  final value =
                                      await _keyEditor.currentState.getText();
                                  _scaffoldState.currentState
                                      .showSnackBar(SnackBar(
                                    duration: Duration(seconds: 5),
                                    content: Text(value),
                                  ));
                                  _value = value;
                                  localStorage.filename = doc_name;
                                  localStorage.writetoFile(_value);
                                });
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              } else {
                final value = await _keyEditor.currentState.getText();
                _scaffoldState.currentState.showSnackBar(SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text("value"),
                ));
                _value = value;
                localStorage.filename = doc_name;
                localStorage.writetoFile(_value);
              }
            },
          )
        ],
      ),
      body: FlutterSummernote(
        hint: "Your text here...",
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        key: _keyEditor,
      ),
    );
  }
}
