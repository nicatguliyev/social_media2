
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/pages/login_page.dart';
import 'package:social_media/test/dynamic_listview.dart';
import 'package:social_media/test/static_listview.dart';
import 'package:social_media/widgets/post_list_item.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const  MaterialApp(
      title: 'Flutter Demo',
      home: DynamicListview(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold();
  }
}
