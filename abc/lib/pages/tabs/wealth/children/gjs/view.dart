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
class GjsPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '贵金属',
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
    final logic = Get.put(GjsLogic());
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 1354, deviceWidth: screenWidth);

    return SingleChildScrollView(
      child: Column(
        children: [
          CcWidget(),
          Stack(
            children: [
              Image(
                  image: 'gjs_1'.png3x,
                  width: screenWidth,
                  fit: BoxFit.fitWidth),
              StackPositionGridWidget.grid4x4(
                      stackPosition: position,
                      x: 0,
                      y: 0,
                      bottomMargin: 1050,
                      itemCount: 4,
                      onItemTap: (index) {
                        if (index == 0) {
                          Get.toNamed(Routes.fixedNavPage, arguments: {
                            'title': '存金通',
                            'imageList': ["cjt"],
                            'top': 0,
                            'background': Colors.white,
                            'right': true
                          });
                        }
                        else if (index == 1) {
                          Get.toNamed(Routes.fixedNavPage, arguments: {
                            'title': '贵金属商城',
                            'imageList': ["gjssc"],
                            'top': 0,
                            'background': Colors.white,
                            'right': true
                          });
                        }
                        else if (index == 2) {
                          Get.toNamed(Routes.fixedNavPage, arguments: {
                            'title': '贵金属纪念币预约',
                            'imageList': ["gjsjnbyy"],
                            'top': 0,
                            'background': Colors.white,
                            'right': true
                          });
                        }
                        else if (index == 3) {
                          Get.toNamed(Routes.fixedNavPage, arguments: {
                            'title': '账户贵金属',
                            'imageList': ["zhgjs"],
                            'top': 0,
                            'background': Colors.white,
                            'right': true
                          });
                        }
                      })
                  .build()
            ],
          ),
          Image(image: 'gjs_2'.png3x, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'gjs_3'.png3x, width: screenWidth, fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
