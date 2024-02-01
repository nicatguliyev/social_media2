import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/utils/style_constants.dart';
import 'package:social_media/widgets/circle_icon_button.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  Dio dio = Dio();
  bool isIndicatorVisible = false;
  String responseText = "";
  bool isResponseTextVisible = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        scrollPosition = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // void loginBtnOnPress(
  //     {required BuildContext context,
  //     required String username,
  //     required String password}) {
  //   FocusScope.of(context).unfocus(); // dismiss keyboard
  //   scrollController.jumpTo(50);
  //   login(username, password);
  // }

  void onEditCompleted() {
    setState(() {
      FocusScope.of(context).unfocus();
      scrollController.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color dynamicColor = Color.lerp(const Color.fromARGB(75, 243, 243, 243),
            white, scrollPosition > 100 ? 1 : scrollPosition / 100) ??
        const Color.fromARGB(75, 243, 243, 243);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: CircleIconButton(backgroundColor: dynamicColor, onPressed: Navigator.of(context).pop, ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return true;
        },
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
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
                  controller: scrollController,
                  shrinkWrap: true,
                  children: [
                    logo,
                    sizedBox(50),
                    CustomTextField(
                      controller: nameController,
                      textlabel: "Name and Surname",
                      icon: const Icon(Icons.person),
                      onEditComleted: onEditCompleted,
                      isSpaceAllowed: true,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: emailController,
                      textlabel: "Email",
                      icon: const Icon(Icons.email),
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: userNameController,
                      textlabel: "Username",
                      icon: const Icon(Icons.account_circle),
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: passwordController,
                      textlabel: "Password",
                      icon: const Icon(Icons.lock),
                      secure: true,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(30),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        onpressed: () {
                        },
                        title: "REGISTER",
                        width: 220,
                      ),
                    ),
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
        ]),
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
          if (response.data.length == 0) {
            responseText = incorretUsernamePassword;
          } else {
            setVisibility(false, false);
            userNameController.text = "";
            passwordController.text = "";
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        } else {
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
