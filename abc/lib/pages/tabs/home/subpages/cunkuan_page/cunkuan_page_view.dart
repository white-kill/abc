import 'package:abc/pages/tabs/home/subpages/cunkuan_page/children/view.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/pages/tabs/wealth/children/cc_widget/CcWidget.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'cunkuan_page_logic.dart';
import 'cunkuan_page_state.dart';

class Cunkuan_pagePage extends BaseStateless {
  Cunkuan_pagePage({Key? key}) : super(key: key);

  final Cunkuan_pageLogic logic = Get.put(Cunkuan_pageLogic());
  final Cunkuan_pageState state = Get.find<Cunkuan_pageLogic>().state;
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text('存款',style: TextStyle(color: Colors.black,fontSize: 17.sp),);

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
  Image(
  width: 22.w,
  height: 22.w,
  image: ('go_back').png3x, color: Colors.black
  ).withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );
  @override
  List<Widget>? get rightAction => [
    _customWidget('kefu', '客服').withOnTap(onTap: () {
      Get.to(() => CustomerPage());
    }),
  ];
  Widget _customWidget(String imgName, String title) {

        return Column(
          children: [
            SizedBox(height: 12.w),
            Image(
              width: 22.w,
              height: 22.w,
              image: imgName.png3x,
              color: Colors.black,
            ),
          ],
        ).paddingOnly(right: 15.w);
  }

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
    logic.navActionColor.value = v ? Colors.black : Colors.white;
  };

  @override
  Color? get background => Colors.white;
  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 1125, designHeight: 3351, deviceWidth: screenWidth);
    // TODO: implement initBody
    return ListView(
      children: [
        // SizedBox(
        //   height: 10.w + MediaQuery.of(context).padding.top + AppBar().preferredSize.height,
        // ),
        CcWidget(),
        Stack(
          children: [
            Image(image: 'ck_big_bg'.png3x,fit: BoxFit.fitWidth,),
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
                      'title': '养老储蓄',
                      'image': 'ylcx',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 1) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '银利多',
                      'image': 'yld',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 2) {
                    Get.to(DaecdPage());
                  }
                  else if (index == 3) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '通知存款',
                      'image': 'tzcx',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 4) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '定活互转（整取整存）',
                      'image': 'dhhz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 5) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '聪明账',
                      'image': 'cmz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 6) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '存单存着',
                      'image': 'cdcz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                  else if (index == 7) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '定活两便',
                      'image': 'dhlb',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                }).build(),
          ],
        )
      ],
    );
  }
}
