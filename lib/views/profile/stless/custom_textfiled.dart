import 'package:flutter/material.dart';
import 'package:flutter_test_2/config/themes/app_color.dart';
import 'package:flutter_test_2/config/themes/text_style.dart';

class CustomTextField extends StatelessWidget {
  final height;
  final content;

  const CustomTextField({Key? key, this.height, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //box
        Container(
            margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
            alignment: Alignment.center,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: DarkTheme.darkBackground,
                  // color: AppColor.blueMain
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: content,
                      border: InputBorder.none,
                      hintStyle: TxtStyle.heading4)),
            )),
        Container(
          color: DarkTheme.red,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(content, style: TxtStyle.heading4Light),
          ),
        )
      ],
    );
  }
}
