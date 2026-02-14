
import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/children/fskgl/state.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/children/gs/state.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/szmrzh/state.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';


class FskglPage extends BaseStateless {
  FskglPage({Key? key}) : super(key: key, title: "附属卡管理");

  final FskglLogic logic = Get.put(FskglLogic());
  final FskglState state = Get.find<FskglLogic>().state;

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
            Image(image: 'fskgl'.png),

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
