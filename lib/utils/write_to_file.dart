import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileExample extends StatefulWidget {
  const FileExample({super.key});

  @override
  State<FileExample> createState() {
    return FileExampleState();
  }
}

class FileExampleState extends State<FileExample> {
  bool isSuccess = false;

  Future<void> writeToFile(String text) async {
    try {
      Directory? documentDirectory = await getDownloadsDirectory();
      String filePath = '${documentDirectory!.path}/example.txt';

      File file = File(filePath);
      print(filePath);
      await file.writeAsString(text);
      setState(() {
        isSuccess = true;
      });
    } catch (e) {
       print(e.toString());
       setState(() {
         isSuccess = false;
       });
    }
  }

  @override
  void initState() {
    super.initState();
    writeToFile("Salam");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: (isSuccess == true ? Text("Sucess") : Text("Not Success")),),);
  }
}
