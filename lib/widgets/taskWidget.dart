import 'package:flutter/material.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      color: AppColor.mainColor.withOpacity(0.5),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: color, fontSize: 20),
      )),
    );
  }
}
