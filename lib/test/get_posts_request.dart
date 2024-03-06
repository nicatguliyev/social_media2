import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:social_media/model/post_model.dart';

class GetPostsRequest {
  static const String apiUrl = "http://localhost:3000/posts";
  Dio dio = Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 2000)));
  ApiResponse apiResponse = ApiResponse();

  Future<ApiResponse> getPosts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      apiResponse.exception = "There is no internet connection";
      return apiResponse;
    } else {
      try {
        List<PostModel> posts = [];
        final response = await dio.get(apiUrl);
        var postsJson = response.data;
        for (var element in postsJson) {
          var postModel = PostModel.fromJson(element);
          posts.add(postModel);
        }
        apiResponse.data = posts;
        return apiResponse;
      } catch (e) {
        if (e is DioException) {
          apiResponse = ApiResponse(exception: handleException(e.type));
        } else {
          apiResponse.exception = "Unknown error occured: ${e.toString()}";
        }
        return apiResponse;
      }
    }
  }
}

String handleException(DioExceptionType exception) {
  if (exception == DioExceptionType.badResponse) {
    return "404 Not Found Error";
  } else if (exception == DioExceptionType.connectionError) {
    return "Connection Error";
  } else if (exception == DioExceptionType.connectionTimeout) {
    return "Connection Timeout Error";
  } else {
    return "Error occured";
  }
}

class ApiResponse<T> {
  T? data;
  String? exception;

  ApiResponse({this.data, this.exception});
}
