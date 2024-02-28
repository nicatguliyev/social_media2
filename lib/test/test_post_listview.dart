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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
          child: ListView(
        children: const [
          TestCard1(),
          TestCard1(),
          TestCard1(),
          TestCard1(),
          TestCard1(),
          TestCard1(),
          TestCard1(),
          TestCard1()
        ],
      )),
    );
  }
}

class TestCard1 extends StatelessWidget {
  const TestCard1({Key? key}) : super(key: key);

  static const borderRadius = Radius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 194, 194, 194),
              spreadRadius: 1,
              blurRadius: 10)
        ]),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: borderRadius,
                  topRight: borderRadius,
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBRLqGxOTaFurWKWnDIFU801pXqilF7XPpPA&usqp=CAU"),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Helen Tran",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Feel free to copy and paste these code snippets into your Flutter development environment for proper syntax highlighting. If you have any specific questions or need further assistance, please let me know!",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
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
              color: Colors.red,
              height: 0.5,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                  bottomLeft: borderRadius,
                  bottomRight: borderRadius,
                ),
              ),
              height: 80,
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                const Expanded(
                    child: ProductDetailItem(
                  detailName: "Pickup",
                  detailValue: "Now",
                )),
                const Expanded(
                    child: ProductDetailItem(
                  detailName: "Price",
                  detailValue: "RP 42000",
                )),
                const Expanded(
                    child: ProductDetailItem(
                  detailName: "Status",
                  detailValue: "Complete",
                  detailColor: Colors.green,
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("lib/assets/cristmas.png"),
                ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailItem extends StatelessWidget {
  final String detailName;
  final String detailValue;
  final Color? detailColor;
  const ProductDetailItem(
      {super.key,
      required this.detailName,
      required this.detailValue,
      this.detailColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          detailName,
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          detailValue,
          style: TextStyle(fontWeight: FontWeight.w700, color: detailColor),
        )
      ],
    );
  }
}
