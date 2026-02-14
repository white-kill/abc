
import 'package:abc/config/app_config.dart';
import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';

class MmzfPage extends BaseStateless {
  MmzfPage({Key? key}) : super(key: key, title: "密码支付");

  final MmzfLogic logic = Get.put(MmzfLogic());
  final MmzfState state = Get.find<MmzfLogic>().state;

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
      Image(
          width: 22.w,
          height: 22.w,
          image: ('go_back').png3x,
          color: Colors.black)
          .withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );
  var paySwitch = true.obs;

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2503, deviceWidth: screenWidth);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'mima'.png3x, width: screenWidth, fit: BoxFit.fitWidth,),
            // Positioned(
            //   right: position.getX(50),
            //   top: position.getY(0),
            //   child: Obx(() {
            //     return Container(
            //       color: Colors.white,
            //       child: CupertinoSwitch(
            //         value: paySwitch.value,
            //         onChanged: (value) {
            //           paySwitch.value = value;
            //         },
            //         focusColor: Colors.green, // 激活时的thumb颜色（iOS绿色）
            //         trackColor: Colors.grey[300], // 未激活时的轨道颜色（浅灰色）
            //       ),
            //     );
            //   }),)
          ],
        )
      ],
    );
  }
}
