import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class ZctjPage extends BaseStateless {
  ZctjPage({Key? key}) : super(key: key, title: "资产体检");

  final ZctjLogic logic = Get.put(ZctjLogic());
  final ZctjState state = Get
      .find<ZctjLogic>()
      .state;

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
          Get.delete<ZctjLogic>();
        },
      )
    ],
  );

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1080, designHeight: 2164, deviceWidth: screenWidth);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Obx(() {
        return Column(
          children: [
            if (logic.step.value == 0)
              Stack(
                children: [
                  Image(image: 'zctj_1'.png,
                    width: screenWidth,
                    gaplessPlayback: true,),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 0,
                      y: 1440,
                      width: 1080,
                      height: 64).build(
                      onTap: () {
                        logic.step.value = 1;
                      }
                  ),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 0,
                      y: 1560,
                      width: 494,
                      height: 144).build(
                      onTap: () {
                        Get.back();
                        Get.delete<ZctjLogic>();
                      }
                  ),
                ],
              ),
            if (logic.step.value == 1)
              Stack(
                children: [
                  Image(image: 'zctj_2'.png,
                    width: screenWidth,
                    gaplessPlayback: true,),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 0,
                      y: 1440,
                      width: 1080,
                      height: 64).build(
                      onTap: () {
                        logic.step.value = 0;
                      }
                  ),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 0,
                      y: 1560,
                      width: 494,
                      height: 144).build(
                      onTap: () {
                        Get.back();
                        Get.delete<ZctjLogic>();
                      }
                  ),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 532,
                      y: 1560,
                      width: 494,
                      height: 144).build(
                      onTap: () {
                        logic.step.value = 2;
                      }
                  ),
                ],
              ),
            if (logic.step.value == 2)
              Stack(
                children: [
                  Image(image: 'zctj_3'.png,
                    width: screenWidth,
                    gaplessPlayback: true,),
                  StackPositionWidget.fromDesign(sp: position,
                      x: 0,
                      y: 1173,
                      width: 1080,
                      height: 140).build(
                      onTap: () {
                        Get.back();
                        Get.delete<ZctjLogic>();
                      }
                  ),
                ],
              )


          ],
        );
      }),
    );
  }
}
