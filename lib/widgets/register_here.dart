import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class RegisterHereButton extends StatelessWidget {
  const RegisterHereButton({super.key});


  @override
  Widget build(BuildContext context) {
      return TextButton(onPressed: (){}, child: Text("Don't have an account? Register here" ,
       style: const TextStyle(color: white).merge(fontFamily),),);
  }
}