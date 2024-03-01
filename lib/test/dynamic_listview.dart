import 'package:flutter/material.dart';
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
  GetPostsRequest getPostsRequest = GetPostsRequest();

  @override
  void initState() {
    super.initState();
    getPostsRequest.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemExtent: 180,
        itemBuilder: (context, index) {
          return PostListItem();
        },
        itemCount: 100,
      ),
    );
  }
}
