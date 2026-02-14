import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_notice/transfer_notice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'transfer_result_logic.dart';
import 'transfer_result_state.dart';

class TransferResultPage extends BaseStateless {
  TransferResultPage({Key? key}) : super(key: key,title: '操作结果');

  final TransferResultLogic logic = Get.put(TransferResultLogic());
  final TransferResultState state = Get.find<TransferResultLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;

    double h = 442.w -navHeight;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'transfer_result'.png3x,
          fit: BoxFit.fitWidth,
        ),
      ),
      child:Column(
        children: [
          SizedBox(height:330.w + navHeight),

          Row(
            children: [
              SizedBox(width: 17.w,),
              Container(
                width: 1.sw/2 - 25.w,
                height: 65.w,
              ).withOnTap(onTap: (){
                Get.back();
              }),

              SizedBox(width: 15.w,),
              Container(
                width: 1.sw/2 - 25.w,
                height: 65.w,
              ).withOnTap(onTap: (){
                Get.to(() => Transfer_noticePage(),arguments: Get.arguments);
              }),
              SizedBox(width: 17.w,),
            ],
          )
        ],
      ),
    );
  }
}
