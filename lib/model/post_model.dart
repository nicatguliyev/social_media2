
class PostModel {
  final int? id;
  final int userId;
  final String title;
  final String content;
  final List<dynamic> likes;


  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.content,
      required this.likes});

  PostModel.requestModel(this.id , {required this.userId, required this.title, required this.content,  required this.likes});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "userId": userId,
      "likes": likes
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        userId: json["userId"],
        likes: json["likes"]);
  }

  

  @override
  String toString() {
    return super.toString();
  }
}


