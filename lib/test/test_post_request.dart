import 'package:dio/dio.dart';
import 'package:social_media/model/post_model.dart';
import 'package:social_media/model/user_model.dart';
import 'package:social_media/utils/style_constants.dart';

class TestPostRequest {
  static const String apiUrl = "${url}users";
  Dio dio = Dio();

  Future<void> createUser() async {
    final postModel = PostModel.requestModel(null,
        userId: 1, title: "wsbwe", content: "asdjbnksdj", likes: []);

    print(apiUrl);

    try {
      final response = await dio.post("http://localhost:3000/posts", data: postModel.toJson(postModel));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('User created successfully');
        print('Response data: ${response.data}');
      } else {
        print('Failed to create user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
