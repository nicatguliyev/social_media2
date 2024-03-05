

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'package:social_media/model/post_model.dart';

class GetPostsRequest {
  static const String apiUrl = "http://localhosrt:3000/postsaa";
  Dio dio = Dio();

  Future<List<PostModel>?> getPosts() async {
    var connectivity_result = await Connectivity().checkConnectivity();
    if (connectivity_result != ConnectivityResult.mobile &&
        connectivity_result != ConnectivityResult.wifi) {
      print("There is no internet connection");
    } else {
          try {
      List<PostModel> posts = [];
      final response = await dio.get(apiUrl);
      var postsJson = response.data;
      for (var element in postsJson) {
        var postModel = PostModel.fromJson(element);
        posts.add(postModel);
      }
      return posts;
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          print("Connection Error");
        } else if (e.type == DioExceptionType.connectionTimeout) {
          print("Connection TimeOut Error: ${e.response!.statusCode}");
        } else if (e.type == DioExceptionType.receiveTimeout) {
          print("Recieve Timeout Error: ${e.response!.statusCode}");
        } else if (e.type == DioExceptionType.badResponse) {
          print("Bad Response Error: ${e.response!.statusCode}");
        } else if (e.type == DioExceptionType.sendTimeout) {
          print("Send Timeout Error: ${e.response!.statusCode}");
        } else {
          print("UNKNOW DIOEXCEPTION: ${e.response!.statusCode}");
        }
      }
      return null;
    }
    }

  }
}
