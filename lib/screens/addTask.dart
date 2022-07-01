import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/controller/data_controller.dart';
import 'package:taskmanagementsystem/screens/allTask.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';
import 'package:taskmanagementsystem/widgets/button.dart';
import 'package:taskmanagementsystem/widgets/popup_err.dart';
import 'package:taskmanagementsystem/widgets/textField.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  bool _dataValidation() {
    if (nameController.text.trim().isEmpty) {
      Message.errorMessage("Task Name", "Task name is empty");
      return false;
    } else if (detailController.text.trim().isEmpty) {
      Message.errorMessage("Task detail", "Task detail is empty");
      return false;
    } else if (nameController.text.trim().length < 10) {
      Message.errorMessage(
          "Task Name", "Task name should be at least 10 character");
      return false;
    } else if (detailController.text.trim().length < 20) {
      Message.errorMessage(
          "Task detail", "Task detail should be at least 20 character");
      return false;
    }
    return true;
  }

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
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().sendData(
                          nameController.text.trim(),
                          detailController.text.trim());
                      Get.to(() => AllTask(), transition: Transition.zoom);
                    }
                  },
                  child: ButtonWidget(
                      backgroundColor: AppColor.mainColor,
                      text: "Add",
                      textColor: Colors.white),
                ),
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
