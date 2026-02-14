import 'package:abc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

/// 家电换新
class JdhxPage extends BaseStateless {
  JdhxPage({Key? key}) : super(key: key);

  final JdhxLogic logic = Get.put(JdhxLogic());
  final JdhxState state = Get.find<JdhxLogic>().state;

  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
        '家电换新',
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
      child: Container(
        child: Column(
          children: [
            Image(
              image: 'bg_jdhx_top'.png3x,
              width: screenWidth,
            ),
            Image(
              image: 'bg_jdhx_bottom'.png3x,
              width: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}

