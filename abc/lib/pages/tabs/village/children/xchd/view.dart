import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

/// 乡村好店页面
/// 使用路由导航到此页面：
/// Get.toNamed(Routes.xchdPage);
/// 或
/// Get.toNamed('/xchdPage');
class XchdPage extends BaseStateless {
  XchdPage({Key? key}) : super(key: key);

  final XchdLogic logic = Get.put(XchdLogic());
  final XchdState state = Get.find<XchdLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '乡村好店',
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
    return SingleChildScrollView(
      child: Obx(() {
        return Stack(
          children: [
            Container(
              child: logic.index.value == 0
                  ? Image(
                      image: 'xchd_1'.png3x,
                      width: screenWidth,
                    )
                  : Image(
                      image: 'xchd_2'.png3x,
                      width: screenWidth,
                    ),
            ),
            Positioned(
              left: 10.w,
              top: 10.w,
              child:

            GetBuilder(
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
            ),

            StackPositionWidget(
                    stackPosition: StackPosition(
                        designWidth: 1080,
                        designHeight: 2164,
                        deviceWidth: screenWidth),
                    designX: 174,
                    designY: 129,
                    designWidth: 259,
                    designHeight: 81)
                .build(onTap: () {
              logic.index.value = 0;
            }),
            StackPositionWidget(
                    stackPosition: StackPosition(
                        designWidth: 1080,
                        designHeight: 2164,
                        deviceWidth: screenWidth),
                    designX: 700,
                    designY: 129,
                    designWidth: 259,
                    designHeight: 81)
                .build(onTap: () {
              logic.index.value = 1;
            }),
          ],
        );
      }),
    );
  }
}
