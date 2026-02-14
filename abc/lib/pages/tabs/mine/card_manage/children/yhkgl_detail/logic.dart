import 'package:abc/utils/sp_util.dart';
import 'package:get/get.dart';

import 'state.dart';

class YhkglDetailLogic extends GetxController {
  final YhkglDetailState state = YhkglDetailState();

  bool showCard = false;

  var alias = "设置别名".obs;

  @override
  void onInit() {
    alias.value = (bankAlias.isEmpty ?? true) ? "设置别名" : bankAlias;

    super.onInit();
  }

}
