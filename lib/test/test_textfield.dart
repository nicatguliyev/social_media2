import 'package:flutter/material.dart';

class TextFieldTest extends StatefulWidget {
  @override
  State<TextFieldTest> createState() {
    return TextFieldTestState();
  }
}

class TextFieldTestState extends State<TextFieldTest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(),
              SizedBox(
                height: 50,
              ),
              CustomTextField()
            ],
          ),
        )),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  Color borderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (controller.text.isEmpty) {
          setState(() {
            borderColor = Colors.transparent;
          });
        } else {
          setState(() {
            borderColor = Colors.blue;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red)),
          filled: true,
          fillColor: Colors.grey,
          labelText: "Username"),
    );
  }
}
