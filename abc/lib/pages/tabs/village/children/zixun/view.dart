import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';

class VillageZiXunPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '资讯',
        style: TextStyle(color: Colors.black, fontSize: 17.sp),
      );

  @override
  Widget? get leftItem => Row(
        children: [
          SizedBox(width: 15.w),
          Image(width: 22.w, height: 22.w, image: ('go_back').png3x, color: Colors.black).withOnTap(
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
    final logic = Get.put(VillageZiXunLogic());

    return SingleChildScrollView(child: Obx(() {
      return Stack(
        children: [
          Image(
            image: "xc_zx_${logic.index.value + 1}".png3x,
            gaplessPlayback: true,
          ),

          StackPositionWidget(
            stackPosition: logic.stack,
            designX: 35,
            designY: 107,
            designWidth: 118,
            designHeight: 89,
          ).build(
            onTap: () {
              logic.index.value = 0;
            },
          ),
          StackPositionWidget(
            stackPosition: logic.stack,
            designX: 200,
            designY: 107,
            designWidth: 150,
            designHeight: 89,
          ).build(
            onTap: () {
              logic.index.value = 1;
            },
          ),
          StackPositionWidget(
            stackPosition: logic.stack,
            designX: 380,
            designY: 107,
            designWidth: 180,
            designHeight: 89,
          ).build(
            onTap: () {
              logic.index.value = 2;
            },
          ),
          StackPositionWidget(
            stackPosition: logic.stack,
            designX: 600,
            designY: 107,
            designWidth: 180,
            designHeight: 89,
          ).build(
            onTap: () {
              logic.index.value = 3;
            },
          ),
        ],
      );
    }));
  }

  getStackPosition() {}
}
