import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../home/subpages/month_bill/month_widget/month_widget_view.dart';
import '../../other/customer/customer_view.dart';
import 'yueduo_logic.dart';
import 'yueduo_state.dart';

class YueduoPage extends BaseStateless {
  YueduoPage({Key? key}) : super(key: key, title: '月度账单');

  final YueduoLogic logic = Get.put(YueduoLogic());
  final YueduoState state = Get.find<YueduoLogic>().state;

  @override
  List<Widget>? get rightAction => [
        Image(
          image: 'ic_home_customer'.png3x,
          width: 22.w,
          height: 22.w,
          color: Colors.black,
        )
            .withPadding(
          left: 0.w,
          right: 15.w,
        )
            .withOnTap(onTap: () {
          Get.to(() => CustomerPage());
        }),
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Image(image: 'yd_first'.png3x),
            Positioned(
                left: 0.w,
                top: 280.w,
                child: Container(
                  width: 1.sw,
                  height: 60.w,
                  alignment: Alignment.center,
                  child: Text(
                    '${DateTime(DateTime.now().year, DateTime.now().month - 1).year}年${DateTime(DateTime.now().year, DateTime.now().month - 1).month}月',
                    style: TextStyle(color: Colors.white),
                  ),
                ).withOnTap(onTap: () {
                  Get.off(() => Month_widgetPage(),
                      transition: Transition.noTransition);
                })),
            Positioned(
                left: 40.w,
                bottom: 150.w,
                child: Container(
                  width: 1.sw - 80.w,
                  height: 60.w,
                ).withOnTap(onTap: () {
                  Get.off(() => Month_widgetPage(),
                      transition: Transition.noTransition);
                }))
          ],
        )
      ],
    );
  }
}
