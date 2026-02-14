import 'dart:math';

import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/phone_setting/phone_setting_view.dart';
import 'package:abc/utils/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/count_down_btn.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';


class CodeAlterWidget extends StatefulWidget {
  final Function sureCallBack;
  const CodeAlterWidget({super.key, required this.sureCallBack});

  @override
  State<CodeAlterWidget> createState() => _CodeAlterWidgetState();
}

class _CodeAlterWidgetState extends State<CodeAlterWidget> {

  CountDownBtnController downBtnController = CountDownBtnController();

  String formattedDate = '';
  String code = '';
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();

    formattedDate = DateFormat('yy年MM月dd日HH:mm').format(now);
    code = Random().nextVerificationCode(6);
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
                text: '短信验证码',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(width:24.w),
            ],
          ).withPadding(left: 12.w,right: 12.w,top: 15.w,bottom: 15.w),

          Container(
            height: 45.w,
            margin: EdgeInsets.only(left: 12.w,right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.w)),
              border: Border.all(color: Color(0xff555555),width: 0.5.w,),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w,),
                BaseText(text: '验证码'),
                TextFieldWidget(
                  hintText: '6位短信验证码',
                  textAlign: TextAlign.end,
                ).withContainer(
                  width: 140.w,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w,right: 10.w),
                  color: Color(0xff555555),width: 0.5.w,height: 40.w,
                ),

                WzhCountDownBtn(
                  controller: downBtnController,
                  showBord: false,
                  textColor: Colors.black,
                  getVCode: () async {
                    Future.delayed(const Duration(milliseconds: 1500),(){
                      NotificationHelper.getInstance().showNotification(
                          title: "95599",
                          body: "【中国农业银行】验证码$code，请不要告诉他人。"
                              "您于$formattedDate申请查看银行卡号，"
                              "如有疑问，请致电95599。", payload: "payload");
                    });

                    return true;
                  },
                )
              ],
            ),
          ),

          BaseText(
              text: '验证码发送至手机'
                  '号${AppConfig.config.abcLogic.memberInfo.phone.desensitize()}',
            fontSize: 14.sp,
            color: Color(0xff666666),
          ).withContainer(
            width: 1.sw,
            alignment: Alignment.centerLeft
          ).withPadding(
              left: 12.w,right: 12.w,
            bottom: 15.w,top: 15.w,
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
                        text: '跟换手机号',
                        fontSize: 16.sp,
                        color: Color(0xFF666666),
                      ),
                    ).withOnTap(onTap: () {
                      SmartDialog.dismiss();
                      Get.to(() => Phone_settingPage());
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
                        text: '确定',
                        fontSize: 16.sp,
                        color: Color(0xFF666666),
                      ),
                    ).withOnTap(onTap: () {
                      SmartDialog.dismiss();
                      widget.sureCallBack();
                    })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
