import 'package:abc/utils/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'account_car_info_state.dart';

class Account_car_infoLogic extends GetxController {
  final Account_car_infoState state = Account_car_infoState();


  var showCopy = false.obs;
  var registrationValue = ''.obs;
  var openOutletsValue = ''.obs;
  var cardStatusValue = ''.obs;
  var accountStatusValue = ''.obs;
  var defaultAccountValue = ''.obs;
  var alias = "设置别名".obs;

  @override
  void onInit() {
    super.onInit();
    registrationValue.value = bankRegistration == ''?'网点注册':bankRegistration;
    openOutletsValue.value = bankOpenOutlets == ''?'开户网点':bankOpenOutlets;
    cardStatusValue.value = bankCardStatus == ''?'正常户':bankCardStatus;
    accountStatusValue.value = bankAccountStatus == ''?'正常户':bankAccountStatus;
    defaultAccountValue.value = bankDefaultAccount == ''?'是':bankDefaultAccount;
    alias.value = bankAlias.isEmpty ? "设置别名" : bankAlias;

  }
  Widget replaceAsterisksWithImages(String text) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: TextStyle(
          fontSize: 18.sp,
        ),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
            image: 'ic_mine_xin'.png3x,
            width: 7.w,
            height: 7.w,
          ).withPadding(bottom:10.w),
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

  String formatCardNumberWithRegex(String cardNumber) {
    return cardNumber.replaceAllMapped(
      RegExp(r'.{4}'),
          (match) => '${match.group(0)} ',
    ).trim();
  }
}
