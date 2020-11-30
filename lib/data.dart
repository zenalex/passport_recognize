//import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' as io;
import 'package:get/get.dart';
import 'package:passport_recognize/model/passDataController.dart';

class PictureManagement {
  String fileName;
  Future<io.FormData> formData() async {
    return io.FormData.fromMap({
      "file": await io.MultipartFile.fromFile(fileName, filename: "pic"),
    });
  }

  Future sendData() async {
    var dio = io.Dio();
    dio.options.baseUrl = "http://alex.nsgsoft.ru:5073/Data/";
    dio.interceptors.add(io.LogInterceptor());
    //dio.interceptors.add(LogInterceptor(requestBody: true));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {};
    io.Response response;
    var controller = Get.find<PassDataController>();
    response = await dio.post(
      //"/upload",
      "Upload",
      data: await formData(),
      onSendProgress: (received, total) {
        if (total != -1) {
          controller.setProgress(received / total, false);
        }
      },
    );
    controller.setProgress(100, true);
    print(response);
  }
}
