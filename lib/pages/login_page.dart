import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  String response = "No data";
  bool isIndicatorVisible = false;

  void messageFromChild(BuildContext context) {
    FocusScope.of(context).unfocus();
    //print(context.mounted);
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
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomLoginButton(
                    onpressed: (){
                      messageFromChild(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                 const RegisterHereButton(),
                  const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Visibility(
                      visible: isIndicatorVisible,
                      child: const CircularProgressIndicator(
                        color: green,
                      ),
                    ))
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
