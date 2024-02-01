import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  final double width;
  const CustomButton({super.key, required this.onpressed, required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            btnShadow(black, 0.5, 3.0, 3.0, const Offset(0, 4)),
          ],
          borderRadius: btnBorderRadius,
          gradient: const LinearGradient(
              colors: [loginBtnStartGradientColor, black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0])),
      child: Material(
        color: transparent,
        child: InkWell(
            onTap: onpressed,
            splashColor: loginBtnSplashColor,
            borderRadius: btnBorderRadius,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                        color: green, fontSize: 18, fontWeight: FontWeight.w600)
                    .merge(fontFamily),
              ),
            )),
      ),
    );
  }

  BoxShadow btnShadow(Color color, double opacity, double spreadRadius,
      double blurRadius, Offset offset) {
    return BoxShadow(
      color: color.withOpacity(opacity),
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: offset,
    );
  }
}
