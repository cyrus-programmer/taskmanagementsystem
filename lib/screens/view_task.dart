import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/controller/data_controller.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';

class ViewTask extends StatelessWidget {
  final String id;
  const ViewTask({Key? key, required this.id}) : super(key: key);
  _loadSingleTask() async {
    await Get.find<DataController>().getTask(id);
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    return Scaffold(body: GetBuilder<DataController>(builder: (controller) {
      return Column(children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.arrow_back,
                color: AppColor.mainColor,
              ),
            ),
          ),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("/Home.jpg"), fit: BoxFit.cover)),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: AppColor.secoundaryColor, width: 1.6))),
          child: Text(
            "${controller.singleTask["task_name"]}",
            style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          height: MediaQuery.of(context).size.height / 3,
          width: double.maxFinite,
          decoration: BoxDecoration(color: AppColor.textFieldColor),
          child: Text(
            "${controller.singleTask["task_detail"]}",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 18,
            ),
          ),
        )
      ]);
    }));
  }
}
