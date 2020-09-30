import 'dart:async';
import 'dart:io';

import 'package:doc_/main.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  String filename = "Unknown";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

//path
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/recent/$filename.txt');
  }

  Future<String> readFromFile() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "error";
    }
  }

  Future<File> writetoFile(String content) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$content');
  }

  Future<List> listFilesInDirectory() async {
    final path = await _localPath;
    List files = Directory(path).listSync(followLinks: false);

    files.forEach((element) {
      String name = element.toString();
      String file_name = name.substring(name.lastIndexOf("/") + 1,name.lastIndexOf("'"));
      if (file_name.contains(".txt")) {
        textname.add(file_name);
        print(textname);
      }
    });
    print(files);
    return files;
  }
}
