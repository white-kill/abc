import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class LifeMsshPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '饭票',
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
    StackPosition position = StackPosition(designWidth: 1080, designHeight: 2169, deviceWidth: screenWidth);
    return SingleChildScrollView(
        child: Stack(
      children: [
        Image(
          image: 'life_mssh'.png3x,
          width: screenWidth,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          left: position.getX(45),
          top: position.getY(45),
          child: Row(
            children: [
              GetBuilder(
                builder: (AbcLogic c) {
                  return Text(
                    c.memberInfo.city,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                      height: 1.0
                    ),
                  );
                },
                id: 'updateUI',
              ),
              // SizedBox(width: 2.w),
              // Image(width: 21.w, height: 21.w, image: 'location'.png3x, color: Color(0xff333333)),
            ],
          )
        )
      ],
    ));
  }
}
