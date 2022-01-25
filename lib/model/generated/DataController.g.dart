import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import '../dataControllerModel.dart';

class DataControllerGenerated extends NsgBaseController {
  NsgDataProvider? provider;
  @override
  void onInit() async {
    if (provider == null) {
      provider = NsgDataProvider(firebaseToken: '');
      provider!.serverUri = 'http://alex.nsgsoft.ru:5073';
      NsgDataClient.client
          .registerDataItem(PassData(), remoteProvider: provider);
      provider!.useNsgAuthorization = false;
      await provider!.connect(this);
      if (provider!.isAnonymous) {
        await Get.to(provider!.loginPage)?.then((value) => loadData());
      } else {
        await loadData();
      }
    }
    super.onInit();
  }

  Future loadData() async {}
}
