import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

///
class DaecdPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget =>
      Text(
        '大额存单',
        style: TextStyle(color: Colors.black, fontSize: 17.sp),
      );

  @override
  Widget? get leftItem =>
      Row(
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
    final logic = Get.put(DaecdLogic());

    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2503, deviceWidth: screenWidth);
    return SingleChildScrollView(
        child: Stack(
          children: [
            Obx(() {
              return Image(image:
              'daecd_${logic.index}'.png,
                width: screenWidth,
                fit: BoxFit.fitWidth,
                gaplessPlayback: true,);
            }),
            StackPositionGridWidget.custom(
                stackPosition: position,
                x: 0,
                y: 0,
                bottomMargin: 2330,
                itemCount: 3,
                onItemTap: (index) {
                  logic.index.value = index + 1;
                },
                crossCount: 3).build(),
          ],
        ));
  }
}
