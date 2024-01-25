import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String textlabel;
  final Icon icon;
  final bool secure;
  final  bool isDone;

  const CustomTextField({super.key, required this.textlabel, required this.icon, required this.secure, this.isDone = false});

  @override
  State<CustomTextField> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  Color floatingTextColor = Colors.green;
  Color green = Colors.green;
  Color red = Colors.red;
  Color white = Colors.white;
  Color black  = Colors.black;
  Color grey = Colors.grey;
  TextStyle fontFamily = const TextStyle(fontFamily: "AROneSans");

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          floatingTextColor = red;
        });
      } else {
        setState(() {
          floatingTextColor = green;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: widget.secure == true ? true : false,
        textInputAction: widget.isDone == false ? TextInputAction.next : TextInputAction.done,
        style:  TextStyle(color: white).merge(fontFamily),
        decoration: InputDecoration(
            floatingLabelStyle: TextStyle(
                color: floatingTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w700).merge(fontFamily),
            labelText: widget.textlabel,
            fillColor: black,
            filled: true,
            prefixIcon: widget.icon,
            prefixIconColor: grey,
            labelStyle: TextStyle(color: grey).merge(fontFamily),
            focusedBorder: textFieldBorder(red),
            enabledBorder: textFieldBorder(green)));
  }

  InputBorder textFieldBorder(Color color){
    return OutlineInputBorder(
                borderSide: BorderSide(color: color, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)));
  }
}
