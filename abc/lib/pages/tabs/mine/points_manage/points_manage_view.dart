import 'package:abc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'points_manage_logic.dart';
import 'points_manage_state.dart';

class PointsManagePage extends BaseStateless {
  PointsManagePage({Key? key}) : super(key: key, title: '积分换礼');

  final PointsManageLogic logic = Get.put(PointsManageLogic());
  final PointsManageState state = Get.find<PointsManageLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Image(
          image: 'bg_points_gl1'.png3x,
          fit: BoxFit.fitWidth,
        ),
        Container(
          height: 141.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: 'bg_points_gl2'.png3x, fit: BoxFit.fitWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 60.w,),
              BaseText(
                text: AppConfig.config.abcLogic.memberInfo.points.toString(),
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333)),
              ),
              SizedBox(height: 12.w,),
              BaseText(text: '下月过期积分0',fontSize: 14.sp,color: Color(0xff888585),)
            ],
          ).withPadding(left: 30.w),
        ),
        Image(
          image: 'bg_points_gl3'.png3x,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
