import 'package:abc/utils/sp_util.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import 'my_account_state.dart';

class MyAccountLogic extends GetxController {
  final MyAccountState state = MyAccountState();
  var alias = "设置别名".obs;
  void jumpPage(String name){
    if(name == '查询明细'){
      Get.toNamed(Routes.detailsQueryPage);
    }
    if(name == '我要转账'){
      Get.toNamed(Routes.transferAccountsPage,);
    }
    if(name == '我要理财'){
      Get.toNamed(Routes.lccsPage, arguments: {"index":4});
    }
  }
  @override
  void onInit() {
    alias.value = (bankAlias.isEmpty ?? true) ? "设置别名" : bankAlias;
    super.onInit();
  }

}
