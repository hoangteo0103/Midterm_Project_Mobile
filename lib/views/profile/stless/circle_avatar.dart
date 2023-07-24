import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomCircleAvatar extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  const CustomCircleAvatar(
      {Key? key,
      required this.height,
      required this.width,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FaIcon(FontAwesomeIcons.user , color : Colors.black)
      ,
    );
  }
}
