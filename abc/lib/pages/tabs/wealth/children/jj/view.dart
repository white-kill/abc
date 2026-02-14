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

class JijinPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
    '基金',
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
    final logic = Get.put(JijinLogic());
    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 3508, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Stack(
        children: [
          CcWidget(),
          Image(image: 'cf_jj_1'.png, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'cf_jj_2'.png, width: screenWidth, fit: BoxFit.fitWidth),

          StackPositionGridWidget.custom(
              stackPosition: position,
              x: 0,
              y: 0,
              bottomMargin: 2876,
              crossCount: 4,
              itemCount: 8,
              onItemTap: (index) {
                if (index == 0) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '基金超市',
                    'image': 'jjcs',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 1) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '首发基金',
                    'image': 'sfjj',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 2) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '优选基金',
                    'image': 'yxjj',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });                }
                else if (index == 3) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '轻盈投',
                    'image': 'qyt',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 4) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '农银快e宝',
                    'image': 'nykeb',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 5) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '农银快e宝2号',
                    'image': 'nykeb2',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 6) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '养老专属基金',
                    'image': 'yljj',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 7) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '基金定投',
                    'image': 'jjdt',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
                else if (index == 8) {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '财富号',
                    'image': 'cfh',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });
                }
              }).build(),
        ],
      )
    );
  }
}
