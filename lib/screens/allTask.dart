import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/controller/data_controller.dart';
import 'package:taskmanagementsystem/screens/HomeScreen.dart';
import 'package:taskmanagementsystem/screens/addTask.dart';
import 'package:taskmanagementsystem/utils/app_color.dart';
import 'package:taskmanagementsystem/widgets/button.dart';
import 'package:taskmanagementsystem/widgets/taskWidget.dart';

class AllTask extends StatelessWidget {
  AllTask({Key? key}) : super(key: key);
  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    print(Get.find<DataController>().myData.length);

    List myData = Get.find<DataController>().myData;
    // List myData = [
    //   {"task_name": "Practice Go Language"},
    //   {"task_name": "Exercise for 15 min"},
    //   {"task_name": "Read a Book"}
    // ];

    final leftEditSide = Container(
      alignment: Alignment.centerLeft,
      // margin: EdgeInsets.only(bottom: 10),
      child: Icon(Icons.edit, color: Colors.white),
      color: Colors.blueGrey[600],
    );
    final rightDeleteSide = Container(
      alignment: Alignment.centerRight,
      // margin: EdgeInsets.only(bottom: 10),
      child: Icon(Icons.delete, color: Colors.white),
      color: Colors.redAccent,
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20,
            ),
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => HomeScreen(),
                        transition: Transition.circularReveal);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    child: Icon(
                      Icons.home,
                      color: AppColor.secoundaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AddTask(),
                        transition: Transition.circularReveal);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(12.5)),
                    width: 18,
                    height: 18,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: 20,
                  height: 20,
                  child: Icon(
                    Icons.calendar_month_sharp,
                    color: AppColor.secoundaryColor,
                  ),
                ),
                SizedBox(width: 10),
                GetBuilder<DataController>(builder: ((controller) {
                  return Text(
                    "${controller.myData.length}",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  );
                })),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 22),
          Flexible(child: GetBuilder<DataController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.myData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Dismissible(
                      background: leftEditSide,
                      secondaryBackground: rightDeleteSide,
                      onDismissed: (DismissDirection direction) async {
                        return;
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  width: double.maxFinite,
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  decoration: BoxDecoration(
                                      color:
                                          AppColor.mainColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonWidget(
                                            backgroundColor: AppColor.mainColor,
                                            text: "View",
                                            textColor: Colors.white),
                                        SizedBox(height: 10),
                                        ButtonWidget(
                                            backgroundColor: AppColor.mainColor,
                                            text: "Edit",
                                            textColor: Colors.white)
                                      ],
                                    ),
                                  ),
                                );
                              });
                          return false;
                        } else {
                          return Future.delayed(Duration(seconds: 1),
                              () => (direction == DismissDirection.endToStart));
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 14,
                        child: TaskWidget(
                            color: AppColor.textColor,
                            text: "${controller.myData[index]["task_name"]}"),
                      ),
                    ),
                  );
                });
          }))
        ],
      ),
    );
  }
}
