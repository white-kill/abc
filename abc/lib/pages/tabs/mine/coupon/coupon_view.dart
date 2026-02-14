import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'coupon_logic.dart';
import 'coupon_state.dart';

class CouponPage extends BaseStateless {
  CouponPage({Key? key}) : super(key: key,title: '我的礼券');

  final CouponLogic logic = Get.put(CouponLogic());
  final CouponState state = Get.find<CouponLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 25.w),
      shrinkWrap: true,
      children: [
        Image(image: 'bg_lj'.png3x,fit: BoxFit.fitWidth,),
      ],
    );
  }
}
