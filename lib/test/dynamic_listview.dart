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

  @override
  void initState() {
    super.initState();
    getPostsRequest.getPosts().then((value) {
      setState(() {
        posts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (posts == null || posts!.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemExtent: 180,
              itemBuilder: (context, index) {
                return PostListItem(
                  postModel: posts![index],
                );
              },
              itemCount: posts!.length,
            ),
    );
  }
}
