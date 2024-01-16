import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<List<String>> fetchGoogleImages(String query, Future<Directory?> directory) async {
  final response = await http.get(Uri.parse('https://www.google.com/search?q=$query&tbm=isch'));
  
  if (response.statusCode == 200) {
    final document = parse(response.body);

     //Directory? documentDirectory = await getDownloadsDirectory();
     // String filePath = '${directory!.path}/images.html';
     String filePath = "";

      File file = File(filePath);
      //print(filePath);
      await file.writeAsString(response.body);

    final imageElements = document.querySelectorAll('src');

    List<String> imageLinks = [];

    for (int i = 0; i < imageElements.length && i < 50; i++) {
      String? dataSrc = imageElements[i].attributes['data-src'];
      String? src = imageElements[i].attributes['src'];

      // Check for both 'data-src' and 'src' attributes
      if (dataSrc != null) {
        imageLinks.add(dataSrc);
      } else if (src != null) {
        imageLinks.add(src);
      }
    }
       return imageLinks;
  } else {
    throw Exception('Failed to fetch images');
  }
}

  void printLargeString(String largeString, int chunkSize) {
  for (int i = 0; i < largeString.length; i += chunkSize) {
    int end = (i + chunkSize < largeString.length) ? i + chunkSize : largeString.length;
    print(largeString.substring(i, end));
  }
}

