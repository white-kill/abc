import 'package:abc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../card_transfer/conmponent/account_transfer_widget.dart';
import 'phone_transfer_logic.dart';
import 'phone_transfer_state.dart';

class PhoneTransferPage extends BaseStateless {
  PhoneTransferPage({Key? key}) : super(key: key, title: '手机号转账');

  final PhoneTransferLogic logic = Get.put(PhoneTransferLogic());
  final PhoneTransferState state = Get.find<PhoneTransferLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Row(
          children: [
            BaseText(
              text: '设置手机号收款，他人可通过手机号给您转账',
              color: Color(0xffDCA43D),
            ).withPadding(left: 16.w, right: 16.w),

            Container(
              width: 42.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: Color(0xffDCA43D),
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
              ),
              alignment: Alignment.center,
              child: BaseText(text: '设置',fontSize: 12.sp,color: Colors.white,textAlign: TextAlign.center,),
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '错误提示',
                'image': 'cwts',
              });
            }),
          ],
        ).withPadding(top: 8.w, bottom: 8.w),
        Container(
          width: 1.sw,
          height: 90.w,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Transfer.abcTextField(
                        title: "收款手机号",
                        hintText: '请输入手机号',
                        // controller: state.nameTextController,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff333333),
                        ),
                        hintColor: Color(0xffC7C7C7),
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      height: 1.w,
                      margin: EdgeInsets.only(left: 15.w),
                      color: const Color(0xffE7E9EB),
                    ),
                    Expanded(
                      child: Transfer.abcTextField(
                        title: "收款人",
                        hintText: '请输入真实姓名',
                        keyboardType: TextInputType.datetime,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff333333),
                        ),
                        hintColor: Color(0xffC7C7C7),
                        // controller: state.accountTextController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        BaseText(
          text:
              "温馨提示\n"
              "1.请您从通讯录选择收款人正确手机号，\n"
              "2.请务必确认收款人姓名、手机号真实有效。\n"
              "3.如未在收款行设置手机号收款，则无法使用本功能对其转账。",
          maxLines: 20,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xff636363),
            height: 20 / 14,
          ),
        ).withContainer(
          width: 350.w,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 17.w, right: 25.w, top: 24.w),
        ),

        Container(
          width: 340.w,
          height: 45.w,
          margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffFBE7B8),
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
          ),
          child: BaseText(text: "下一步", color: Colors.white, fontSize: 14.sp),
        ).withOnTap(onTap: () {}),

        SizedBox(height: ScreenUtil().bottomBarHeight + 25.w),
      ],
    );
  }
}
