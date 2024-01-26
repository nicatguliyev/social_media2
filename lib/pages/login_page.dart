import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';
import 'package:social_media/widgets/register_here.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginpageState();
  }
}

class LoginpageState extends State<LoginPage> {
  void messageFromChild() {
    print("Message from child");
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  CustomLoginButton(
                    onpressed: messageFromChild,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const RegisterHereButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
