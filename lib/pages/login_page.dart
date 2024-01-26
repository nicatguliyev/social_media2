import 'package:flutter/material.dart';
import 'package:social_media/test/test_inkwell_button.dart';

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
                stops: [0.2, 0.9])),
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
                const  SizedBox(height: 50,),
                CustomInkWellButton(),
               // customtextField("Username", const Icon(Icons.person)),
                const SizedBox(height: 20,),
                //customtextField("Password", const Icon(Icons.lock))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField customtextField(String labelText, Icon icon) {   
    
    FocusNode focusNode = FocusNode();

    const textFieldBackgroundColor = Colors.white;
    const blackColor = Colors.black;
    const greyColor = Colors.grey;
    const borderRadius = BorderRadius.all(Radius.circular(10));
    const textStyle =  TextStyle(color: greyColor, fontSize: 18);
    const floatingTextStyle =   TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.w500);

    return  TextField(
      style: textStyle,
      cursorColor: greyColor,
        decoration: InputDecoration(
      floatingLabelStyle: floatingTextStyle,
          prefixIcon: icon,
          prefixIconColor: greyColor,
          hintStyle: const TextStyle(color: greyColor),
      labelText: labelText,
      labelStyle:  textStyle,
      filled: true,
      fillColor: textFieldBackgroundColor,
      enabledBorder: const OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none),
      focusedBorder: const  OutlineInputBorder(
          borderRadius: borderRadius, 
          borderSide: BorderSide(color: blackColor, width: 1.5)),
    ), 
    );
  }
}
