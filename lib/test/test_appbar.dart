import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //         title: Text("Test"),
      //         backgroundColor: red,
      //         leading: IconButton(
      //           onPressed: (){print("Back button is pressed");},
      //           icon: const Icon(Icons.arrow_back),
      //         ),
      //       ),
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child:  AppBar(
              title: Text("Test"),
              backgroundColor: transparent,
              leading: IconButton(
                onPressed: (){print("Back button is pressed");},
                icon: const Icon(Icons.arrow_back, size: 35,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
