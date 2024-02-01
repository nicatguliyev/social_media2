import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class CircleIconButton extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  const CircleIconButton({super.key, required this.backgroundColor, required this.onPressed});

  @override
  State<CircleIconButton> createState() {
    return CircleIconButtonState();
  }
}

class CircleIconButtonState extends State<CircleIconButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      child: const Icon(Icons.arrow_back, color: black, size: 30,),
    );
  }
}
