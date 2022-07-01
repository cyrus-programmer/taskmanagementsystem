import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get("http://localhost:8080/getTasks",
        headers: {"Content-Type": "application/json; charset='UTF-8'"});
    return response;
  }

  Future<Response> sendData(dynamic body) async {
    Response response = await post("http://localhost:8080/create", body,
        headers: {"Content-Type": "application/json; charset='UTF-8'"});

    return response;
  }
}
