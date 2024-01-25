import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Ink(
             decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
            child: Container(
              width: 200,
              child: Center(child: Text("LOGIN")),
            ),
          ),
        ));
  }
}
