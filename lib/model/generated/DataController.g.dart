import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import '../dataControllerModel.dart';

class DataControllerGenerated extends GetxController
    with StateMixin<NsgBaseControllerData> {
  NsgDataProvider provider;
  @override
  void onInit() async {
    if (provider == null) {
      provider = NsgDataProvider();
      provider.serverUri = 'http://alex.nsgsoft.ru:5073';
      NsgDataClient.client
       .registerDataItem(PassData(), remoteProvider: provider);
      await provider.connect();
      if (provider.isAnonymous) {
        await Get.to(NsgPhoneLoginPage(provider,
          widgetParams: NsgPhoneLoginParams.defaultParams))
          .then((value) => loadData());
      } else {
        await loadData();
      }
    }
    super.onInit();
  }
  
  Future loadData() async {}
}