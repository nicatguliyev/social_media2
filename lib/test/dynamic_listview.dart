import 'package:flutter/material.dart';
import 'package:social_media/model/post_model.dart';
import 'package:social_media/test/get_posts_request.dart';
import 'package:social_media/widgets/post_list_item.dart';

class DynamicListview extends StatefulWidget {
  const DynamicListview({super.key});

  @override
  State<DynamicListview> createState() {
    return DynamicListViewSate();
  }
}

class DynamicListViewSate extends State<DynamicListview> {
  late List<PostModel>? posts = [];
  GetPostsRequest getPostsRequest = GetPostsRequest();
  ApiResponse apiResponse = ApiResponse();

  @override
  void initState() {
    super.initState();
    getPostsRequest.getPosts().then((value) {
      setState(() {
        apiResponse = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (apiResponse.data == null && apiResponse.exception == null)
          ? const Center(child: CircularProgressIndicator())
          :  displayPosts(apiResponse)
    );
  }
}

Widget displayPosts(ApiResponse apiResponse) {
  return (apiResponse.data == null)
      ? Center(
          child: Text(apiResponse.exception!, textAlign: TextAlign.center,),
        )
      : ListView.builder(
          itemBuilder: (context, index) {
            return PostListItem(postModel: apiResponse.data[index]);
          },
          itemCount: apiResponse.data.length,
          itemExtent: 180,
        );
}
