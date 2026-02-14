import 'package:abc/config/app_config.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';

import 'logic.dart';
import 'state.dart';

class JjkjbPage extends BaseStateless {
  JjkjbPage({Key? key}) : super(key: key, title: "借记卡解绑");

  final JjkjbLogic logic = Get.put(JjkjbLogic());
  final JjkjbState state = Get.find<JjkjbLogic>().state;

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
  List<Widget>? get rightAction => [
    _customWidget('kefu', '客服').withOnTap(onTap: () {
      Get.to(() => CustomerPage());
    }),  ];

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
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 1293, designHeight: 2503, deviceWidth: screenWidth);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'jie_ji_ka_jie_bang'.png3x),

            Positioned(
              right: position.getX(135),
              top: position.getY(80),
              child: BaseText(
                  text: AppConfig.config.abcLogic.card(), fontSize: 16.sp),)
          ],
        )
      ],
    );
  }

}
