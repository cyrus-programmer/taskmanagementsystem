import 'dart:html';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:taskmanagementsystem/utils/app_constants.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    String url = AppConstants.BASE_URL + uri;
    Response response = await get(url,
        headers: {"Content-Type": "application/json; charset='UTF-8'"});
    return response;
  }

  Future<Response> sendData(dynamic body, String uri) async {
    String url = AppConstants.BASE_URL + uri;
    Response response = await post(url, body,
        headers: {"Content-Type": "application/json; charset='UTF-8'"});

    return response;
  }

  Future<Response> putData(dynamic body, String uri) async {
    String url = AppConstants.BASE_URL + uri;
    Response response = await put(url, body,
        headers: {"Content-Type": "application/json; charset='UTF-8'"});

    return response;
  }

  Future<Response> deleteData(String uri) async {
    String url = AppConstants.BASE_URL + uri;
    Response response = await delete(url,
        headers: {"Content-Type": "application/json; charset='UTF-8'"});

    return response;
  }
}
