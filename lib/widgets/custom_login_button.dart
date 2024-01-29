import 'package:flutter/material.dart';
import 'package:social_media/utils/style_constants.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback onpressed;
  const CustomLoginButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
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
            child:  Center(
              child: Text(
                
                "LOGIN",
                style: const TextStyle(
                    color: green,
                    fontSize: 18,
                    fontWeight: FontWeight.w600).merge(fontFamily),
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
