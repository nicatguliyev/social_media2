import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(color: green,
        
        child: Center(child: ListView(children: [ Align(child: Container(color: red, height: 50, width: 100,), alignment: Alignment.center,)], shrinkWrap: true,  ),), ),
      );

  }
}