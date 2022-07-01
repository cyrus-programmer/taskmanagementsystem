import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanagementsystem/services/services.dart';
import 'package:taskmanagementsystem/utils/app_constants.dart';
import 'package:taskmanagementsystem/widgets/popup_err.dart';

class DataController extends GetxController {
  DataService services = DataService();
  bool _isloading = false;
  bool get isloading => _isloading;
  List<dynamic> myData = [];
  List<dynamic> get myData1 => myData;
  Map<String, dynamic> singleTask = {};
  Map<String, dynamic> get singleTask1 => singleTask = {};
  getData() async {
    _isloading = true;
    Response response = await services.getData(AppConstants.Get_Data);
    if (response.statusCode == 200) {
      myData = response.body;
      update();
    } else {
      print("No data");
    }
    _isloading = false;
  }

  getTask(String id) async {
    _isloading = true;
    Response response =
        await services.getData("${AppConstants.Get_TASK}" "$id");
    if (response.statusCode == 200) {
      singleTask = jsonDecode(response.body);
      update();
    } else {
      print("No data");
    }
    _isloading = false;
  }

  sendData(String taskName, String taskDetail) async {
    _isloading = true;
    Response response = await services.sendData(
        {"task_name": taskName, "task_detail": taskDetail},
        AppConstants.POST_DATA);
    if (response.statusCode == 200) {
      update();
      Message.errorMessage("Successful", "Data posted Successfully");
    } else {
      Message.errorMessage("Unsuccessful", "Error in posting data");
    }
    _isloading = false;
  }

  updateData(String taskName, String taskDetail, String id) async {
    _isloading = true;
    Response response = await services.putData(
        {"task_name": taskName, "task_detail": taskDetail},
        "${AppConstants.PUT_DATA}$id");
    if (response.statusCode == 200) {
      update();
      Message.errorMessage("Successful", "Data posted Successfully");
    } else {
      Message.errorMessage("Unsuccessful", "Error in posting data");
    }
    _isloading = false;
  }

  deleteData(String id) async {
    _isloading = true;
    update();
    Response response =
        await services.deleteData("${AppConstants.DEL_DATA}$id");
    if (response.statusCode == 200) {
      update();
      Message.errorMessage("Successful", "Data Deleted Successfully");
    } else {
      Message.errorMessage("Unsuccessful", "Error in deleting data");
    }
    Future.delayed(Duration(seconds: 1), () {
      _isloading = false;
      update();
    });
  }
}
