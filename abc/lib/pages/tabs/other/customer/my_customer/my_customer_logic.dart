import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../mine/xiaodou/xiaodou_view.dart';
import 'my_customer_state.dart';

class My_customerLogic extends GetxController {
  final My_customerState state = My_customerState();


  void jumpPage(String name){

    if(name == '限额设置'){}
    if(name == '小豆乐园'){
      Get.to(() => XiaodouPage());
    }
    if(name == '明细查询'){
      Get.toNamed(Routes.detailsQueryPage);
    }
    if(name == '转账'){
      Get.toNamed(Routes.transferAccountsPage,);
    }

  }
}
