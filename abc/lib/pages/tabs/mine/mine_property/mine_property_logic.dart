import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';

import 'mine_property_state.dart';

class MinePropertyLogic extends GetxController {

  var showLine = true.obs;

  var nowTime = '--'.obs;
  final MinePropertyState state = MinePropertyState();

  @override
  void onInit() {
    super.onInit();
    nowTime.value = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
  }
}
