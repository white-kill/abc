import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/other/verification_box/verification_box.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/dio/network.dart';
import '../../../../../../../config/net_config/apis.dart';
import '../../../../../../../routes/app_pages.dart';
import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';

class TransferPasswordWidget extends StatefulWidget {
  const TransferPasswordWidget({super.key});

  @override
  State<TransferPasswordWidget> createState() => _TransferPasswordWidgetState();
}

class _TransferPasswordWidgetState extends State<TransferPasswordWidget> {
  final CardTransferState state = Get.find<CardTransferLogic>().state;
  final CardTransferLogic logic = Get.put(CardTransferLogic());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 150.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              ).withOnTap(onTap: () {
                SmartDialog.dismiss();
              }),
              BaseText(
                text: '请输入取款密码',
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 24.w,
              ),
            ],
          ).withPadding(
            top: 12.w,
          ),

          SizedBox(height: 32.w,),
          VerificationBox(
            count: 6,
            borderColor: Colors.grey,
            itemWidth: 45.w,
            itemHeight:45.w,
            obscureText: true,
            onSubmitted: (value) {
              SmartDialog.dismiss().then((v){
                Http.post(Apis.billTransfer,data: state.cardReq.toJson()).then((v){
                  if(v != null){
                    logic.transferInfo['time'] = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
                    logic.transferInfo['name'] = state.cardReq.realName;
                    logic.transferInfo['bankCard'] = state.cardReq.cardNo;
                    logic.transferInfo['amount'] =state.cardReq.amount;
                    logic.transferInfo['purpose'] = state.remarksTextController.text;
                    Get.offAndToNamed(Routes.transferResultPage,arguments: logic.transferInfo);
                    AppConfig.config.abcLogic.memberInfoData();
                  }
                });
              });
            },
          ),

        ],
      ).withPadding(left: 12.w, right: 12.w),
    );
  }
}
