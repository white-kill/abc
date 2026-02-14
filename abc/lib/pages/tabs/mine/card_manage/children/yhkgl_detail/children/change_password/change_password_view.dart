import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'change_password_logic.dart';
import 'change_password_state.dart';

class Change_passwordPage extends BaseStateless {
  Change_passwordPage({Key? key}) : super(key: key, title: '修改密码');

  final Change_passwordLogic logic = Get.put(Change_passwordLogic());
  final Change_passwordState state = Get.find<Change_passwordLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'change_p'.png3x),
            Positioned(
                top: 25.w,
                right: 12.w,
                child: Positioned(
              child: replaceAsterisksWithImages(
                  AppConfig.config.abcLogic.card(),
                  fontSize: 16.sp,color: Color(0xff666666)),
            ))
          ],
        )
      ],
    );
  }

  Widget replaceAsterisksWithImages(String text,
      {Color color = Colors.black, double fontSize = 14}) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: TextStyle(fontSize: fontSize.sp, color: color),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
            image: 'ic_mine_xin'.png3x,
            width: 6.w,
            height: 6.w,
            color: color,
          ).withPadding(bottom: 4.w),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }
}
