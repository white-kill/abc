import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'card_req.dart';
import 'card_transfer_state.dart';

class CardTransferLogic extends GetxController {
  final CardTransferState state = CardTransferState();

  Map<String, dynamic> transferInfo = {};

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments?['cardInfo'] != null) {
      state.cardInfo = Get.arguments?['cardInfo'];
      state.cardReq.bankId = state.cardInfo['id'];
      state.cardReq.realName = state.cardInfo['name'];
      state.cardReq.bankName = state.cardInfo['bankName'];
      state.cardReq.cardNo = state.cardInfo['bankCard'];
      update(['updateUI']);
    }
  }

  String type = '实时到账';

  Widget typeText() {
    String text = '实时';
    if (type == '实时到账') text = '实时';
    if (type == '普通转账(2小时后转出)') text = '普通';
    if (type == '次日转账(24小时后转出)') text = '次日';
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '预计',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff999999),
            ),
          ),
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.orange,
            ),
          ),
          TextSpan(
            text: '到账 ',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff999999),
            ),
          ),
          WidgetSpan(
            child: Image(
              image: '111111111'.png3x,
              width: 14.w,
              height: 14.w,
            ),
            alignment: PlaceholderAlignment.middle,
          )
        ],
      ),
    );
    if (type == '0') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '预计',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '实时',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.orange,
              ),
            ),
            TextSpan(
              text: '到账',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff999999),
              ),
            ),
          ],
        ),
      );
    } else if (type == '1') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '2小时后',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.orange,
              ),
            ),
            TextSpan(
              text: '提交处理。',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '到账时间详情 >',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '次日',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.orange,
              ),
            ),
            TextSpan(
              text: '凌晨提交处理。',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff999999),
              ),
            ),
            TextSpan(
              text: '到账时间详情 >',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );
    }
  }
}
