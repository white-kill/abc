import 'package:abc/pages/tabs/home/subpages/netpoint_page/netpoint_page/netpoint_page_view.dart';
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

class WhPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '外汇',
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
    final logic = Get.put(WhLogic());

    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 2160, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Column(
        children: [
          CcWidget(),
          Stack(
            children: [
              Image(image: 'wh'.png, width: screenWidth, fit: BoxFit.fitWidth),
              StackPositionGridWidget(
                stackPosition: position,
                designX: 0,
                designY: 0,
                crossCount: 4,
                itemCount: 8,
                bottomMargin: 1700,
                onItemTap: (index) {
                  if (index == 0) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '结售汇',
                      'image': 'jsh',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 1) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '跨境汇款',
                      'image': 'kjhkuan',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 2) {
                    Get.toNamed(Routes.lccsPage, arguments: {"index":4});
                  }
                  else if (index == 3) {
                    Get.to(() => Netpoint_pagePage());
                  }
                  else if (index == 4) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '存款证明',
                      'image': 'ckzm',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 5) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '外汇存款利率',
                      'image': 'whckll',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 6) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '申请记录查询',
                      'image': 'sqjlcx',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 7) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '跨境支付通',
                      'image': 'kjzft',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                }
              ).build()
            ],
          )
        ],
      ),
    );
  }
}
