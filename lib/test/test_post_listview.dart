import 'package:flutter/material.dart';

class TestPostList extends StatefulWidget {
  const TestPostList({super.key});

  @override
  State<TestPostList> createState() {
    return TestPostListState();
  }
}

class TestPostListState extends State<TestPostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: ListView(
          children: [const TestCard1()],
        )),
      ),
    );
  }
}

class TestCard1 extends StatelessWidget {
  const TestCard1({Key? key}) : super(key: key);

  static const borderRadius = Radius.circular(10);
  static const profil_picture_url =
      "https://www.woolha.com/media/2020/03/eevee.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: borderRadius,
              topRight: borderRadius,
            ),
            color: Colors.green,
          ),
          child: const Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,  
                  backgroundImage: NetworkImage("https://www.woolha.com/media/2020/03/eevee.png"),
                ),
                 SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Helen Tran",
                        style:  TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Feel free to copy and paste these code snippets into your Flutter development environment for proper syntax highlighting. If you have any specific questions or need further assistance, please let me know!",
                        style:  TextStyle(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 219, 219, 219),
            borderRadius: BorderRadius.only(
              bottomLeft: borderRadius,
              bottomRight: borderRadius,
            ),
          ),
          height: 80,
        ),
      ],
    );
  }
}
