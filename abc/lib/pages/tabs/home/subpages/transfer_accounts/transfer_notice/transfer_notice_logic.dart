import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/function_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'transfer_notice_state.dart';

class Transfer_noticeLogic extends GetxController {
  final Transfer_noticeState state = Transfer_noticeState();

  var selIndex = 0.obs;

  String valueText(String name){

    if(name == '付款人'){
      return AppConfig.config.abcLogic.memberInfo.realName;
    }
    if(name == '付款账户'){
      return AppConfig.config.abcLogic.card();
    }
    if(name == '收款人'){
      return Get.arguments?['name']??'';
    }
    if(name == '收款帐号'){
      return '${Get.arguments?['bankCard']??''}'.maskBankCardNumber();
    }
    if(name == '转账金额'){
      return double.parse('${Get.arguments?['amount']??'0'}').bankBalance;
    }
    if(name == '转账附言'){
      return Get.arguments?['purpose']??'';
    }
    if(name == '交易时间'){
      return Get.arguments?['time']??'';
    }

    return '';
  }
  Widget replaceAsterisksWithImages(String text) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
            image: 'ic_mine_xin'.png3x,
            width: 6.w,
            height: 6.w,
            color: Color(0xff555555),
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
