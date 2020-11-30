import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:passport_recognize/data.dart';
import 'package:passport_recognize/model/dataControllerModel.dart';
import 'package:passport_recognize/model/resultBinding.dart';
import 'package:passport_recognize/recognizeResult.dart';

class PassDataController extends NsgDataController<PassData> {
  PassDataController()
      : super(requestOnInit: false, autoRepeate: true, autoRepeateCount: 1000);

  bool isUploaded = false;
  double progressProcent = 0;
  bool dataReady = false;

  void setProgress(double procent, bool finished) {
    progressProcent = procent;
    isUploaded = finished;
    if (isUploaded && !dataReady) {
      requestItems();
    }
  }

  @override
  void afterRequestItems(List<NsgDataItem> newItemsList) {
    super.afterRequestItems(newItemsList);
    dataReady = true;
    sendNotify();
  }

  void recognize(String path) async {
    Get.to(RecognizeResult(), binding: ResultBinding());
    var pm = PictureManagement();
    pm.fileName = path;
    pm.sendData();
  }

  @override
  void onInit() {
    var provider = NsgDataProvider();
    provider.serverUri = "http://alex.nsgsoft.ru:5073/";
    provider.useNsgAuthorization = false;

    NsgDataClient.client.registerDataItem(PassData(), remoteProvider: provider);
    super.onInit();
  }
}
