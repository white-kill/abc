import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:get/get.dart';

class VillageZiXunLogic extends GetxController {

  var index = 0.obs;
  
  StackPosition stack = StackPosition(designWidth: 779, designHeight: 3927, deviceWidth: screenWidth);

  @override
  void onInit() {
    super.onInit();
    index.value = Get.arguments?["index"];
  }


}
