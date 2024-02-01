import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:social_media/pages/home_page.dart';
import 'package:social_media/pages/register_page.dart';
import 'package:social_media/test/test_post_request.dart';
import 'package:social_media/utils/style_constants.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';
import 'package:social_media/widgets/register_here.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}


class LoginPageState extends State<LoginPage> {
  Dio dio = Dio();
  bool isIndicatorVisible = false;
  String responseText = "";
  bool isResponseTextVisible = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TestPostRequest request = TestPostRequest();

  void loginBtnOnPress(
      {required BuildContext context,
      required String username,
      required String password}) {
    FocusScope.of(context).unfocus(); // dismiss keyboard
    login(username, password);
  }

  @override
  void initState() {
    super.initState();
    request.createUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [backgroundStartGradientColor, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                logo,
                sizedBox(50),
                CustomTextField(
                  controller: userNameController,
                  textlabel: "Username",
                  icon: const Icon(Icons.person),
                  secure: false,
                ),
                sizedBox(20),
                CustomTextField(
                  controller: passwordController,
                  textlabel: "Password",
                  icon: const Icon(Icons.lock),
                  secure: true,
                  isDone: true,
                ),
                sizedBox(30),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    title: "LOGIN",
                    width: 200,
                    onpressed: () {
                      loginBtnOnPress(
                          context: context,
                          username: userNameController.text,
                          password: passwordController.text);
                    },
                  ),
                ),
                sizedBox(40),
                 RegisterHereButton(onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                }, ),
                sizedBox(40),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Visibility(
                        visible: isIndicatorVisible,
                        child: const CircularProgressIndicator(
                          color: green,
                        ),
                      ),
                      Visibility(
                          visible: isResponseTextVisible,
                          child: Text(
                            responseText,
                            style: const TextStyle(color: red),
                          )),
                    ],
                  ),
                ),
                sizedBox(20)
              ],
            ),
          ),
        ),
      ),
    );
  }


  void login(String username, String password) async {
    setState(() {
      setVisibility(true, false);
    });
    try {
      Response response =
          await dio.get("${url}users?username=$username&password=$password");
      setState(() {
            setVisibility(false, true);
        if (response.data is List) {
            if(response.data.length == 0){
              responseText = incorretUsernamePassword;
            }
            else {
              setVisibility(false, false);
              userNameController.text = "";
              passwordController.text = "";
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            }
        }
        else {
              responseText = somethingWrong;
        }
      });
    } on DioException catch (e) {
      setState(() {
        setVisibility(false, true);
        if (e.response != null) {
          responseText = "An error occured: ${e.response!.statusCode}";
        } else {
          if (e.error is SocketException) {
            responseText = noInternetConnection;
          }
        }
      });
    } catch (e) {
      setState(() {
        setVisibility(false, true);
        responseText = unExceptedError;
      });
    }
  }

  void setVisibility(bool indicatorVisibility, bool responseTextVisibility) {
    isIndicatorVisible = indicatorVisibility;
    isResponseTextVisible = responseTextVisibility;
  }
}
