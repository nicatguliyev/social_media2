import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';

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
  TextEditingController controller = TextEditingController();

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
                 CustomTextField(
                  controller: controller,
                  textlabel: "Username",
                  icon: const Icon(Icons.person),
                  secure: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                 CustomTextField(
                  controller: controller,
                  textlabel: "Password",
                  icon: const Icon(Icons.lock),
                  secure: true,
                  isDone: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    title: "LOGIN",
                    width: 200,
                    onpressed: () {
                      
                    },
                  )
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
    Response _ = await dio.get("http://34.125.169.237/users");
    setState(() {
      isIndicatorVisible = false;
    });
  }
}
