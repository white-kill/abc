import 'package:abc/config/abc_config/balance_eye_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'progress_logic.dart';
import 'progress_state.dart';

class ProgressPage extends BaseStateless {
  ProgressPage({Key? key}) : super(key: key, title: '查询进度');

  final ProgressLogic logic = Get.put(ProgressLogic());
  final ProgressState state = Get.find<ProgressLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 't_cxjd'.png),
            Positioned(
                left: 40.w,
                top: 43.w,
                child: BaseText(
                  text: logic.time.replaceAll('/', '-'),
                  fontSize: 12.5.sp,
                  color: Color(0xff666666),
                )),
            Positioned(
                left: 40.w,
                top: 185.w,
                child: BaseText(
                  text: '流水号:103100000026${logic.code2}${logic.generateRandomEightDigits()}(可凭此号码前往对方银行查询)',
                  maxLines: 10,
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12.5.sp,
                    height: 1.4
                  ),
                ).withSizedBox(width: 1.sw - 56.w)),
          ],
        )
      ],
    );
  }
}
