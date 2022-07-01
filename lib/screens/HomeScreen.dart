import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/routes/routes.dart';
import 'package:taskmanagementsystem/screens/addTask.dart';
import 'package:taskmanagementsystem/screens/allTask.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';
import 'package:taskmanagementsystem/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Home.jpg"), fit: BoxFit.cover)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          RichText(
              text: TextSpan(
                  text: "Welcome",
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: "\nHope You have a Nice Day...",
                    style: TextStyle(color: AppColor.textColor, fontSize: 16))
              ])),
          SizedBox(height: MediaQuery.of(context).size.height / 2.5),
          Material(
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
              onTap: () {
                Get.toNamed(RouteClass.getAddTasks());
              },
              child: ButtonWidget(
                  backgroundColor: AppColor.mainColor,
                  text: "Add Task",
                  textColor: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Material(
            borderRadius: BorderRadius.circular(40),
            child: InkWell(
              onTap: () {
                Get.toNamed(RouteClass.getAllTasks());
              },
              child: ButtonWidget(
                  backgroundColor: Colors.white,
                  text: "View All",
                  textColor: AppColor.mainColor),
            ),
          )
        ],
      ),
    );
  }
}
