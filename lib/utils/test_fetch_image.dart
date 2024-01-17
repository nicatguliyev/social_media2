import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<void> fetcImages() async{
    String url = 'https://unsplash.com/';

 final response = await http.get(Uri.parse(url),);
 var document = parse(response.body);

  List<String> imageLinks = [];
  document.querySelectorAll('img').forEach((element) {
    var imageUrl = element.attributes['src'];
    if (imageUrl != null && imageUrl.isNotEmpty && imageUrl.contains("http")) {
      imageLinks.add(imageUrl);
    }
  });

  for(int i = 0; i < 40; i++){
    print(imageLinks[i]);
  }
}