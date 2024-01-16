import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<void> fetcImages() async{
    String url = 'https://unsplash.com/';

 final response = await http.get(Uri.parse(url),);
 var document = parse(response.body);

  // Extract image links
  List<String> imageLinks = [];
  document.querySelectorAll('img').forEach((element) {
    var imageUrl = element.attributes['src'];
    if (imageUrl != null && imageUrl.isNotEmpty) {
      imageLinks.add(imageUrl);
    }
  });

  // Print the first 50 image links
  print(imageLinks[18]);
  

}