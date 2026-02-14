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

class ZqqhPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '证券期货',
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
    final logic = Get.put(ZqqhLogic());

    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 2160, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Column(
        children: [
          CcWidget(),
          Stack(
            children: [
              Image(
                  image: 'zqqh'.png, width: screenWidth, fit: BoxFit.fitWidth),
              StackPositionGridWidget(
                stackPosition: position,
                designX: 0,
                designY: 0,
                bottomMargin: 1913,
                itemCount: 4,
                crossCount: 4,
                onItemTap: (index) {
                  if (index == 0) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '证券开户',
                      'image': 'zqkh',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  } else if (index == 1) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '银证转账',
                      'image': 'yzzz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  } else if (index == 2) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '银期转账',
                      'image': 'yqzz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  } else if (index == 3) {
                    Get.toNamed(Routes.changeNavi, arguments: {
                      'title': '银衍转账',
                      'image': 'yyzz',
                      'offset':false,
                      'defTitleColor': Colors.black,
                    });
                  }
                },
              ).build()
            ],
          )
        ],
      ),
    );
  }
}
