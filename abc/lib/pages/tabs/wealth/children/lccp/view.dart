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

class LccpPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
    '理财产品',
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
    final logic = Get.put(LccpLogic());
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 1152, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Column(
        children: [
          CcWidget(),
          Stack(
            children: [
              Image(image: 'lccp_1'.png, width: screenWidth, fit: BoxFit.fitWidth),

              StackPositionGridWidget.grid4x4(
                  stackPosition: position,
                  x: 0,
                  y: 0,
                  bottomMargin: 850,
                  itemCount: 4,
                  onItemTap: (index) {
                    if (index == 3) {
                      Get.toNamed(Routes.lccsPage, arguments: {"index":index+1});
                      return;
                    }
                    Get.toNamed(Routes.lccsPage, arguments: {"index":index});

                  }).build(),
            ],
          ),
          Image(image: 'lccp_2'.png, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'lccp_3'.png, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'lccp_4'.png, width: screenWidth, fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
