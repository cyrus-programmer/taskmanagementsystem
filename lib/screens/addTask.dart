import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';
import 'package:taskmanagementsystem/widgets/button.dart';
import 'package:taskmanagementsystem/widgets/textField.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("/addtask2.jpg"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 14),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColor.mainColor,
                    ))
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    controller: nameController, hinttext: "Add Task"),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                TextFieldWidget(
                  controller: detailController,
                  hinttext: "Task Details",
                  borderRadius: 14,
                  maxlines: 4,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                ButtonWidget(
                    backgroundColor: AppColor.mainColor,
                    text: "Add",
                    textColor: Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
