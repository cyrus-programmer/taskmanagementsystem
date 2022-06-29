import 'package:flutter/material.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  const ButtonWidget(
      {Key? key,
      required this.backgroundColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      // ignore: prefer_const_constructors
      child: Center(
          // ignore: prefer_const_constructors
          child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      )),
    );
  }
}
