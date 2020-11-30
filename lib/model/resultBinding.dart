import 'package:get/get.dart';
import 'package:passport_recognize/model/passDataController.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PassDataController());
  }
}
