import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class RegisterHereButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RegisterHereButton({super.key, required this.onPressed});


  @override
  Widget build(BuildContext context) {

      return TextButton(onPressed: onPressed, child: Text("Don't have an account? Register here" ,
       style: const TextStyle(color: white).merge(fontFamily),),);
  }
}