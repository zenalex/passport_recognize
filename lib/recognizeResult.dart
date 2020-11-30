import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passport_recognize/model/passDataController.dart';

class RecognizeResult extends GetView<PassDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recognition Results'),
      ),
      body: controller.obx((state) => getBody(context)),
      //getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    if (controller.dataReady) {
      return Center(
          child: Column(children: [
        Text(controller.items[0].firstName),
        Text(controller.items[0].secondName),
        Text(controller.items[0].lastName)
      ]));
    }
    if (controller.isUploaded) {
      return Center(child: CircularProgressIndicator()
          //semanticsLabel: "Recognishing...",
          );
    } else {
      return Center(
        child: CircularProgressIndicator(
            value: controller.progressProcent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
      );
    }
  }
}
