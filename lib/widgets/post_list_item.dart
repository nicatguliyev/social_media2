import 'package:flutter/material.dart';
import 'package:social_media/model/post_model.dart';
import 'package:social_media/utils/style_constants.dart';

class PostListItem extends StatefulWidget {
  final PostModel postModel;
  const PostListItem({super.key, required this.postModel});

  @override
  State<PostListItem> createState() {
    return PostListItemState();
  }
}

class PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        color: Color.fromARGB(255, 211, 211, 211),
                        blurRadius: 10,
                        offset: Offset(0, -5))
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Color.fromARGB(255, 238, 238, 238)),
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBRLqGxOTaFurWKWnDIFU801pXqilF7XPpPA&usqp=CAU"),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                       Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Yakov Soobsikov",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            Text(
                              widget.postModel.title,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 71, 71, 71),
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 160, 160, 160),
              height: 1,
            ),
            Container(
              height: 60,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        color: Color.fromARGB(255, 211, 211, 211),
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color.fromARGB(255, 238, 238, 238)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                     Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const  Icon(
                            color: Colors.blue,
                            Icons.thumb_up,
                            size: 30,
                          ),
                         const  SizedBox(
                            width: 10,
                          ),
                          Text("${widget.postModel.likes.length}Likes")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: 1.5,
                        color: const Color.fromARGB(255, 160, 160, 160),
                      ),
                    ),
                    const Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          color: Colors.green,
                          Icons.comment,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("20 Comments")
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
