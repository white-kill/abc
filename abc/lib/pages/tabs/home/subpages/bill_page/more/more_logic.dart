import 'package:get/get.dart';

import '../../../../mine/mine_property/mine_property_view.dart';
import '../../../../other/customer/customer_view.dart';
import '../../month_bill/month_widget/month_widget_view.dart';
import 'more_state.dart';

class MoreLogic extends GetxController {
  final MoreState state = MoreState();


  void jumpPage(String name){
    if(name == '资产负债'){
      Get.to(() => MinePropertyPage());
    }
    if(name == '月度账单'){
      Get.to(() => Month_widgetPage());
    }
    if(name == '记账本'){}
    if(name == '设置预算'){}
    if(name == '在线客服'){
      Get.to(() => CustomerPage());
    }
  }
}
