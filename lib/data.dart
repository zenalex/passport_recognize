//import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class PictureManagement {
  String fileName;
  Future<FormData> formData() async {
    return FormData.fromMap({
      "file": await MultipartFile.fromFile(fileName, filename: "pic"),
    });
  }

  Future sendData() async {
    var dio = Dio();
    dio.options.baseUrl = "http://alex.nsgsoft.ru:5073/Data/";
    dio.interceptors.add(LogInterceptor());
    //dio.interceptors.add(LogInterceptor(requestBody: true));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      // client.findProxy = (uri) {
      //   //proxy all request to localhost:8888
      //   return "PROXY alex.nsgsoft.ru:8888";
      // };
      // client.badCertificateCallback =
      //     (X509Certificate cert, String host, int port) => true;
    };
    Response response;

    //var t = await formData();
    //print(utf8.decode(await t.readAsBytes()));

    response = await dio.post(
      //"/upload",
      "Upload",
      data: await formData(),
      onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );
    print(response);
  }
}
