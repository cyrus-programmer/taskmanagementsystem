import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:taskmanagementsystem/services/services.dart';
import 'package:taskmanagementsystem/widgets/popup_err.dart';

class DataController extends GetxController {
  DataService services = new DataService();
  bool _isloading = false;
  bool get isloading => _isloading;
  List<dynamic> myData = [];
  List<dynamic> get myData1 => myData;
  getData() async {
    _isloading = true;
    Response response = await services.getData();
    if (response.statusCode == 200) {
      myData = response.body;
      // print(response.body);
      print("We got the data");
      update();
    } else {
      print("No data");
    }
  }

  sendData(String taskName, String taskDetail) async {
    _isloading = true;
    Response response = await services
        .sendData({"task_name": taskName, "task_detail": taskDetail});
    if (response.statusCode == 200) {
      update();
      Message.errorMessage("Successful", "Data posted Successfully");
    } else {
      Message.errorMessage("Unsuccessful", "Error in posting data");
    }
  }
}
