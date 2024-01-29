import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';
import 'package:social_media/widgets/register_here.dart';

class LoginPageWithListview extends StatefulWidget {
  const LoginPageWithListview({super.key});

  @override
  State<LoginPageWithListview> createState() {
    return LoginpageWithListviewState();
  }
}

class LoginpageWithListviewState extends State<LoginPageWithListview> {
  Dio dio = Dio();
  String response = "No data";
  bool isIndicatorVisible = false;

  void messageFromChild() {
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 156, 156, 156), Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo,
                const SizedBox(
                  height: 50,
                ),
                const CustomTextField(
                  textlabel: "Username",
                  icon: Icon(Icons.person),
                  secure: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  textlabel: "Password",
                  icon: Icon(Icons.lock),
                  secure: true,
                  isDone: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomLoginButton(
                    onpressed: messageFromChild,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                
                
                // isginCompleted == false ? const CircularProgressIndicator(color: green,) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getUsers() async {
    setState(() {
      isIndicatorVisible = true;
    });
    Response response = await dio.get("http://34.125.169.237/users");
    setState(() {
      isIndicatorVisible = false;
    });
  }
}
