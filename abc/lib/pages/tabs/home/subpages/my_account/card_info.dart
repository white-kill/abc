import 'package:abc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
class CardInfo extends StatefulWidget {
  const CardInfo({super.key});

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    '复制成功'.showToast;
  }


  String formatBankCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(' ', ''); // 先移除空格
    String formatted = '';
    for (int i = 0; i < cardNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += cardNumber[i];
    }
    return formatted;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Icon(Icons.clear,size: 22.w,color: Color(0xff666666),).withOnTap(onTap: (){
                SmartDialog.dismiss();
              }),
              BaseText(
                text: '卡号信息',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(width:24.w),
            ],
          ).withPadding(left: 12.w,right: 12.w,top: 15.w,bottom: 15.w),

          Container(
            margin: EdgeInsets.only(left: 15.w,right: 12.w),
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.w,),
                BaseText(text: '户   名: ${AppConfig.config.abcLogic.memberInfo.realName}'),
                SizedBox(height: 8.w,),
                BaseText(text: '卡   号: ${formatBankCardNumber(AppConfig.config.abcLogic.card1())}'),
                SizedBox(height: 8.w,),
                BaseText(text: '开户行: ${AppConfig.config.abcLogic.openOutlets()}'),
                SizedBox(height: 24.w,),
              ],
            ),
          ),



          Container(
            width: 1.sw * 0.88,
            height: 0.5.w,
            color: const Color(0xffbbbbab),
          ),
          SizedBox(
            height: 46.w,
            width: 1.sw * 0.8,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: BaseText(
                        text: '复制全部',
                        fontSize: 16.sp,
                        color: Color(0xFF666666),
                      ),
                    ).withOnTap(onTap: () {
                      copyToClipboard(''
                          '${AppConfig.config.abcLogic.memberInfo.realName}'
                          '\n${AppConfig.config.abcLogic.card1()}'
                          '\n${AppConfig.config.abcLogic.openOutlets()}');
                      SmartDialog.dismiss();
                    })),
                Container(
                  width: 0.5.w,
                  height: 42.w,
                  color: const Color(0xffbbbbab),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: BaseText(
                        text: '仅复制卡号',
                        fontSize: 16.sp,
                        color: Colors.orangeAccent,
                      ),
                    ).withOnTap(onTap: () {
                      copyToClipboard(AppConfig.config.abcLogic.card1());
                      SmartDialog.dismiss();
                    })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
