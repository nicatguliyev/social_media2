import 'package:flutter/material.dart';

class PostModel {
  final int? id;
  final int userId;
  final String title;
  final String content;
  final List<int> likes;


  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.content,
      required this.likes});

  PostModel.requestModel(this.id , {required this.userId, required this.title, required this.content,  required this.likes});

  Map<String, dynamic> toJson(PostModel postModel) {
    return {
      "id": postModel.id,
      "title": postModel.title,
      "content": postModel.content,
      "userId": postModel.userId,
      "likes": postModel.likes
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        content: json["content"],
        likes: json["likes"]);
  }

  

  @override
  String toString() {
    return super.toString();
  }
}
