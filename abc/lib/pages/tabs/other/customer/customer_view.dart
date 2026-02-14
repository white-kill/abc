import 'package:abc/pages/tabs/other/customer/my_customer/my_customer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'customer_logic.dart';
import 'customer_state.dart';

class CustomerPage extends BaseStateless {
  CustomerPage({Key? key}) : super(key: key, title: '在线客服');

  final CustomerLogic logic = Get.put(CustomerLogic());
  final CustomerState state = Get.find<CustomerLogic>().state;




  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Image(
                image: 'ic_kf_c1'.png3x,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),


        Container(
          height: ScreenUtil().bottomBarHeight + 10.w + 45.w,
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 10.w),
          child: Image(
            image: 'ic_kf_d1'.png3x,
            width: 1.sw,
            fit: BoxFit.fitWidth,
            height: 45.w,
          ).withOnTap(onTap: (){
            Get.to(() => My_customerPage());
          }),
        )
      ],
    );
  }
}
