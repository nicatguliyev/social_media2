import 'package:flutter/material.dart';

class CustomInkWellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("object");
          },
          splashColor: Color.fromARGB(80, 66, 66, 66),
          borderRadius: const  BorderRadius.all(Radius.circular(10)),
              child: const Center(
                child: Text("LOGIN"),
              ),
        ),
      ),
    );
  }
}
