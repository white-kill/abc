import 'package:abc/pages/tabs/wealth/children/cc_widget/CcWidget.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

/// 贵金属
class CfbxPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '保险',
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
    final logic = Get.put(CfbxLogic());

    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 3508, deviceWidth: screenWidth);
    return SingleChildScrollView(
        child: Stack(
      children: [
        Image(image: 'cf_bx'.png3x, width: screenWidth, fit: BoxFit.fitWidth),
        StackPositionGridWidget.grid5x5(
            stackPosition: position,
            x: 0,
            y: 646,
            bottomMargin: 2477,
            itemCount: 9,
            onItemTap: (index) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '保险',
                'imageList': ["bx_$index"],
                'top': 0,
                'background': Colors.white,
                'right': true
              });
            }).build(),
      ],
    ));
  }
}
