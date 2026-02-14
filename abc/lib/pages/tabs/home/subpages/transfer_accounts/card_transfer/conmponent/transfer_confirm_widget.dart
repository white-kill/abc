import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/transfer_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';

class TransferConfirmWidget extends StatefulWidget {
  const TransferConfirmWidget({super.key});

  @override
  State<TransferConfirmWidget> createState() => _TransferConfirmWidgetState();
}

class _TransferConfirmWidgetState extends State<TransferConfirmWidget> {
  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  List titleNames = [
    '收款户名',
    '收款账号',
    '收款银行',
  ];

  String money = '0';

  @override
  void initState() {
    super.initState();
    if (state.moneyStr != '') {
      money = NumberFormat("#,##0.00", "zh_CN")
          .format(double.parse(state.moneyStr));
    }
  }

  String valueStr(String name) {
    if (name == '收款户名') {
      return state.cardReq.realName;
    }
    if (name == '收款账号') {
      return state.cardReq.cardNo;
    }
    if (name == '收款银行') {
      return state.cardReq.bankName;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 32.w,
          ),
          BaseText(
            text: money,
            fontSize: 26.sp,
          ),
          SizedBox(
            height: 4.w,
          ),
          BaseText(
            text: '转账金额(元)',
            fontSize: 12.sp,
            color: Color(0xff666666),
          ),
          SizedBox(
            height: 32.w,
          ),
          ListView.separated(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 40.w,
                padding: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(text: titleNames[index]),
                    BaseText(
                      text: valueStr(titleNames[index]),
                      color: Color(0xff666666),
                    )
                  ],
                ),
              );
            },
            itemCount: titleNames.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                width: 1.sw,
                height: 0.5.w,
                margin: EdgeInsets.only(left: 15.w),
                color: Color(0xffE9E9E9),
              );
            }, //state.list.length,
          ),
          Container(
            width: 340.w,
            height: 45.w,
            margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.w,bottom: ScreenUtil().bottomBarHeight + 12.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:Color(0xffF3AD3C),
              borderRadius: BorderRadius.all(Radius.circular(6.w)),
            ),
            child: BaseText(text: "确认", color: Colors.white, fontSize: 14.sp),
          ).withOnTap(onTap: () {
            Get.back();
            AlterWidget.alterWidget(builder: (context) {
              return const TransferPasswordWidget();
            });
          })
        ],
      ),
    );
  }
}
