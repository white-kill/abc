import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';

class ZhInfo1 extends StatefulWidget {

  const ZhInfo1({super.key,});

  @override
  State<ZhInfo1> createState() => _ZhInfo1State();
}

class _ZhInfo1State extends State<ZhInfo1> {

  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  String formatCardNumber(String cardNumber) {
    String digitsOnly = cardNumber.replaceAll(RegExp(r'[^\d]'), '');

    // 每4位添加一个空格
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digitsOnly[i]);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CardTransferLogic c){
      return Container(
        width: 1.sw,
        height: 100.w,
        color: Colors.white,
        child: Column(
          children: [
            BaseText(
              text: "收款人",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ).withContainer(
              width: 1.sw,
              padding: EdgeInsets.only(top: 12.w, left: 15.w,),
            ),
            Expanded(
              child: Row(
                children: [
                  netImage(url: state.cardInfo['icon']??'',width: 32.w,height: 32.w).withPadding(
                    left: 12.w,right: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        BaseText(text:state.cardInfo['name']??'',fontSize: 16.sp,),
                        SizedBox(width: 8.w,),
                        BaseText(text: state.cardInfo['bankName']??''),
                      ],),

                      BaseText(text: formatCardNumber(state.cardInfo['bankCard']??''),style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Color(0xff666666),
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },id: 'updateUI',);
  }
}
