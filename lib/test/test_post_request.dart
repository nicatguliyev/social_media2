import 'package:dio/dio.dart';
import 'package:social_media/model/user_model.dart';
import 'package:social_media/utils/style_constants.dart';

class TestPostRequest {
  static const String apiUrl = "${url}users";
  Dio dio = Dio();

  Future<void> createUser() async {
    final newUser = UserModel(
        fullName: "Nicat Guliyev",
        email: "Nicatguliyev3@gmail.com",
        userName: "Qladio11",
        password: "12345",
        profileIimageUrl: "djkbaskd");

        print(apiUrl);

    try {
      final response = await dio.post(apiUrl, data: newUser.toJson());
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
