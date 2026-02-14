import 'package:abc/pages/tabs/wealth/children/cc_widget/CcWidget.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class RmckPage extends BaseStateless {
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
    '热门存款',
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
    final logic = Get.put(RmckLogic());

    return SingleChildScrollView(
      child: Column(
        children: [
          CcWidget(),
          Image(image: 'rmck1'.png, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'rmck2'.png, width: screenWidth, fit: BoxFit.fitWidth),
          Image(image: 'rmck3'.png, width: screenWidth, fit: BoxFit.fitWidth),
        ],
      ),
    );
  }

}
