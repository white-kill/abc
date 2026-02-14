import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/pages/tabs/life/children/cxfw/state.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class CxfwPage extends BaseStateless {
  CxfwPage({Key? key}) : super(key: key);

  final CxfwLogic logic = Get.put(CxfwLogic());
  final CxfwState state = Get.find<CxfwLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
    '出行服务',
    style: TextStyle(color: Colors.black, fontSize: 17.sp),
  );

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

  @override
  double? get lefItemWidth => 80.w;
  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2094, deviceWidth: screenWidth);
    return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: 'life_cx_1'.png3x,
                  width: screenWidth,
                ),
                Positioned(
                  left: position.getX(330),
                  top: position.getY(35),
                  child: GetBuilder(
                    builder: (AbcLogic c) {
                      return Text(c.memberInfo.city,
                          style: TextStyle(fontSize: 14.sp, color: Colors.black, height: 1));
                    },
                    id: 'updateUI',
                  ),
                )
              ],
            ),
            Image(
              image: 'life_cx_2'.png3x,
              width: screenWidth,
            ),
            Image(
              image: 'mydy_3'.png3x,
              width: screenWidth,
            ),
          ],
        ));
  }
}
