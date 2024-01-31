import 'package:flutter/material.dart';

const Color green = Colors.green;
const Color red = Colors.red;
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color loginBtnSplashColor = Color.fromARGB(61, 76, 175, 79);
const Color transparent = Colors.transparent;
const Color loginBtnStartGradientColor = Color.fromARGB(255, 119, 119, 119);
const Color backgroundStartGradientColor = Color.fromARGB(255, 156, 156, 156);

const btnBorderRadius = BorderRadius.all(Radius.circular(20));
const TextStyle fontFamily = TextStyle(fontFamily: "AROneSans");

var logo = Image.asset(
  "lib/assets/logo3.png",
  height: 150,
  width: 150,
);

const String incorretUsernamePassword = "Username or password is incorrect";
const String noInternetConnection = "There is no internet connection";
const String unExceptedError = "Unexcepted error occured";
const String url = "http://34.125.169.237/";
const String somethingWrong = "Something went wrong. Try again";

SizedBox sizedBox(double height){
  return SizedBox(height: height,);
}
