import 'package:get/get.dart';

import 'main_order_state.dart';

class Main_orderLogic extends GetxController {
  final Main_orderState state = Main_orderState();

  var tabIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    tabIndex.value = Get.arguments?['index'] ?? 0;

    super.onInit();
  }

}
