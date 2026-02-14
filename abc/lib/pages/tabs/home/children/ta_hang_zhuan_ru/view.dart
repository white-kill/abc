import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class TaHangZhuanRuPage extends BaseStateless {
  TaHangZhuanRuPage({Key? key}) : super(key: key, title: '他行转入');

  final TaHangZhuanRuLogic logic = Get.put(TaHangZhuanRuLogic());
  final TaHangZhuanRuState state = Get
      .find<TaHangZhuanRuLogic>()
      .state;


  @override
  Color? get background => Colors.white;

  @override
  List<Widget>? get rightAction =>
      [
        Image(
          image: 'ic_home_customer'.png3x,
          width: 22.w,
          height: 22.w,
          color: Colors.black,
        ).withPadding(
          left: 0.w,
          right: 15.w,
        ).withOnTap(onTap: () {
          Get.to(() => CustomerPage());
        }),
      ];


  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2503, deviceWidth: screenWidth);
    return Stack(
      children: [
        Obx(() {
          return Container(
            width: screenWidth,
            child:
            logic.index.value == 0 ?
            Image(image: 'thzr_1'.png) : Image(image: 'thzr_2'.png),
          );
        }),
        StackPositionWidget(stackPosition: position,
            designX: 0,
            designY: 0,
            designWidth: 625,
            designHeight: 157).build(
            onTap: () {
              logic.index.value = 0;
            }
        ),
        StackPositionWidget(stackPosition: position,
            designX: 625,
            designY: 0,
            designWidth: 625,
            designHeight: 157).build(
            onTap: () {
              logic.index.value = 1;
            }
        )

      ],
    );
  }

}
