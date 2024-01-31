import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page.dart';
import 'package:social_media/utils/style_constants.dart';
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

  void loginBtnOnPress(
      {required BuildContext context,
      required String username,
      required String password}) {
    FocusScope.of(context).unfocus(); // dismiss keyboard
    scrollController.jumpTo(50);
    login(username, password);
  }

  void onEditCompleted() {
    setState(() {
      FocusScope.of(context).unfocus();
      scrollController.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color dynamicColor = Color.lerp(
            transparent,
            const Color.fromARGB(255, 82, 82, 82),
            scrollPosition > 100 ? 1 : scrollPosition / 100) ??
        transparent;

       Color dynamicColor2 = Color.lerp(
            transparent,
            white,
            scrollPosition > 100 ? 1 : scrollPosition / 100) ??
        transparent;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      textlabel: "Name",
                      icon: const Icon(Icons.person),
                      secure: false,
                      isDone: true,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: surnameController,
                      textlabel: "Surname",
                      icon: const Icon(Icons.person),
                      secure: false,
                      isDone: true,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: emailController,
                      textlabel: "Email",
                      icon: const Icon(Icons.person),
                      secure: false,
                      isDone: true,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: userNameController,
                      textlabel: "Username",
                      icon: const Icon(Icons.person),
                      isDone: true,
                      secure: false,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(20),
                    CustomTextField(
                      controller: passwordController,
                      textlabel: "Password",
                      icon: const Icon(Icons.lock),
                      secure: true,
                      isDone: true,
                      onEditComleted: onEditCompleted,
                    ),
                    sizedBox(30),
                    Align(
                      alignment: Alignment.center,
                      child: CustomLoginButton(
                        onpressed: () {
                          loginBtnOnPress(
                              context: context,
                              username: userNameController.text,
                              password: passwordController.text);
                        },
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: AppBar(
              backgroundColor: dynamicColor,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Register", style: TextStyle(color: dynamicColor2, fontSize: 22).merge(fontFamily),),
              ),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: white,
                  ),
                  iconSize: 32,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          )
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
