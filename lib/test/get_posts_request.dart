// import 'package:flutter/material.dart';

// class GetPostRequest extends StatefulWidget {
//   const GetPostRequest({super.key});

//   @override
//   State<GetPostRequest> createState() {
//     return GetPostsRequestState();
//   }
// }

// class GetPostsRequestState extends State<GetPostRequest> {
//   @override
//   Widget build(BuildContext context) {
//     return Center();
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/model/post_model.dart';

class GetPostsRequest {
  static const String apiUrl = "http://localhost:3000/posts";
  Dio dio = Dio();

  Future<void> getPosts() async {
    // final postModel = PostModel.requestModel(id, userId: userId, title: title, content: content, likes: likes)
    try {
      List<int> likes = List.empty();
      final response = await dio.get(apiUrl);
      List<dynamic> posts = response.data;
      //print(posts[0]);
      var post = {
        "id": 11,
        "title": "Post1",
        "content": "sdjbsadm",
        "userId": 4,
      };
      Map<String, dynamic> regularMap = posts[0] as Map<String, dynamic>;
      print(post.runtimeType);
      print(regularMap.runtimeType);
      print(posts[0].runtimeType);
      //var model = PostModel.fromJson(post);
      // print(model.likes);
    } catch (e) {
      print(e);
    }
  }
}
