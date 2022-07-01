import 'package:get/route_manager.dart';
import 'package:taskmanagementsystem/screens/allTask.dart';
import 'package:taskmanagementsystem/screens/edit_task.dart';

import '../screens/HomeScreen.dart';
import '../screens/addTask.dart';
import '../screens/view_task.dart';

class RouteClass {
  static String home = '/';
  static String allTasks = '/allTasks';
  static String addTasks = '/addTasks';
  static String editTasks = '/editTasks';
  static String viewTasks = '/viewTasks';

  static String getHomeRoute() => home;
  static String getAllTasks() => allTasks;
  static String getAddTasks() => addTasks;
  static String getEditTasks(String id) => "$editTasks?id=$id";
  static String getViewTasks(String id) => "$viewTasks?id=$id";

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(
        name: allTasks,
        page: () => AllTask(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        name: addTasks,
        page: () => AddTask(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        name: viewTasks,
        page: () {
          var id = Get.parameters["id"];
          return ViewTask(id: id!);
        },
        transition: Transition.upToDown,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        name: editTasks,
        page: () {
          var id = Get.parameters["id"];
          return EditTask(id: id!);
        },
        transition: Transition.zoom,
        transitionDuration: Duration(seconds: 1)),
  ];
}
