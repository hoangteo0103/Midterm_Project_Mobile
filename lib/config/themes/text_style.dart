import 'package:flutter/material.dart';
import 'package:flutter_test_2/config/themes/app_color.dart';

class TxtStyle {
  static const heading1 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 30, height: 1.2);
  static const heading2 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.2,
      decoration: TextDecoration.none,
      color: Colors.black);

  static final heading22 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.2,
      decoration: TextDecoration.none,
      color: Colors.white.withOpacity(0.8));

  static final heading21 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.2,
      decoration: TextDecoration.none,
      color: Colors.white.withOpacity(0.8));
  static const heading3 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 20, height: 1.2);
  static const heading4 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.2,
      decoration: TextDecoration.none,
      color: Colors.black);
  static final headingFINAL = TextStyle(
  color: Color(0xff324A59),
  fontWeight: FontWeight.w500,
  fontSize: 21);
  static final headingFINAL2 = TextStyle(
      color: Color(0xff324A59),
      fontWeight: FontWeight.w500,
      fontSize: 15);
  static const heading1SemiBold = TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xFF181D2D),
    fontSize: 30,
  );

  static const heading1Medium = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 30,
    height: 1.2,
  );
  static const heading3Medium = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 20,
      height: 1.2,
      decoration: TextDecoration.none,
      color: Colors.black);

  static const heading3Light = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 20,
      height: 1.2,
      color: Colors.black,
      decoration: TextDecoration.none);

  static final heading3Light2 = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 16,
      height: 1.2,
      color: Colors.white.withOpacity(0.9),
      decoration: TextDecoration.none);
  static const heading4Light = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 16,
      height: 1.2,
      color: Colors.black,
      decoration: TextDecoration.none);

  static final heading4Light2 = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 16,
      height: 1.4,
      color: Colors.black.withOpacity(0.4),
      decoration: TextDecoration.none);
}

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    @required this.gradient,
  });

  final String text;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          // The color must be set to white for this to work
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
