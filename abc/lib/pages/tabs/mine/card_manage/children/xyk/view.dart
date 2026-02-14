import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class YhkglXYKPage extends BaseStateless {
  YhkglXYKPage({Key? key}) : super(key: key);

  final YhkglXYKLogic logic = Get.put(YhkglXYKLogic());
  final YhkglXYKState state = Get.find<YhkglXYKLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '信用卡',
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
    StackPosition position = StackPosition(
        designWidth: 900, designHeight: 3919, deviceWidth: screenWidth);
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          children: [
            Image(
              image: 'yhkgl_xyk'.png,
              width: screenWidth,
            ),
            Positioned(
              top: position.getY(40),
              left: position.getX(50),
              child: GetBuilder(
                builder: (AbcLogic c) {
                  return Text(
                    c.memberInfo.city,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ),
                  );
                },
                id: 'updateUI',
              ),
            )
          ],
        ),
      ],
    ));
  }
}
