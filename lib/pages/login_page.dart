import 'package:flutter/material.dart';
import 'package:social_media/widgets/custom_login_button.dart';
import 'package:social_media/widgets/custom_textfield.dart';
import 'package:yg_indicator_button/yg_indicator_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginpageState();
  }
}

class LoginpageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/logo3.png",
                  height: 150,
                  width: 150,
                ),
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
                CustomLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

}