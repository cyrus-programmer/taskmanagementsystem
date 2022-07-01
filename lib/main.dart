import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/controller/data_controller.dart';
import 'package:taskmanagementsystem/routes/routes.dart';
import 'package:taskmanagementsystem/screens/HomeScreen.dart';
import 'package:taskmanagementsystem/screens/addTask.dart';
import 'package:taskmanagementsystem/screens/allTask.dart';
import 'package:taskmanagementsystem/screens/view_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      title: 'Task Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteClass.getHomeRoute(),
      getPages: RouteClass.routes,
    );
  }
}
