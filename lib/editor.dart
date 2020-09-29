
import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

class Editor extends StatefulWidget {
  Editor({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  TextStyle textStyle;
  TextAlign textAlign;

  @override
  void initState() {
    textStyle =
        TextStyle(fontSize: 25, color: Colors.black, fontFamily: 'Billabong');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 350),
                width: 500,
                child: Text(
                  'Sample text',
                  style: textStyle,
                  textAlign: textAlign,
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextStyleEditor(
                      height: 250,
                      textStyle: textStyle,
                      onTextStyleChanged: (value) {
                        setState(() {
                          textStyle = value;
                        });
                      },
                      onTextAlignChanged: (value) {
                        setState(() {
                          textAlign = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}