import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/utils/style_constants.dart';

class CustomTextField extends StatefulWidget {
  final String textlabel;
  final Icon icon;
  final bool secure;
  final bool isDone;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.textlabel,
      required this.icon,
      required this.secure,
      this.isDone = false, required this.controller});

  @override
  State<CustomTextField> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  final FocusNode focusNode = FocusNode();
  Color floatingTextColor = green;

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
      controller: widget.controller,
      focusNode: focusNode,
      obscureText: widget.secure == true ? true : false,
      textInputAction:
          widget.isDone == false ? TextInputAction.next : TextInputAction.done,
      style: const TextStyle(color: white).merge(fontFamily),
      decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
                  color: floatingTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)
              .merge(fontFamily),
          labelText: widget.textlabel,
          fillColor: black,
          filled: true,
          prefixIcon: widget.icon,
          prefixIconColor: grey,
          labelStyle: const TextStyle(color: grey).merge(fontFamily),
          focusedBorder: textFieldBorder(red),
          enabledBorder: textFieldBorder(green)),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
      ],
    );
  }

  InputBorder textFieldBorder(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)));
  }
}
