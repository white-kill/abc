import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';
import 'account_transfer_widget.dart';

class ZhRemarks extends StatefulWidget {
  const ZhRemarks({super.key});

  @override
  State<ZhRemarks> createState() => _ZhRemarksState();
}

class _ZhRemarksState extends State<ZhRemarks> {


  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;


  List contentList = [
    '生活费',
    '信用卡',
    '工资',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(width: 1.sw, height: 95.w, color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transfer.itemCellWidget(
                  title: "转账附言",
                  hintText: '30个字以内的附言',
                  controller: state.remarksTextController,
                  textAlign: TextAlign.right,
                  onChanged: (text){
                    state.cardReq.purpose = text;
                  },
                  onTap: (){
                    setState(() {});
                  }
              ).withPadding(
                  top: 5.w,
                  bottom: 5.w
              ),

              Image(
                image: 'ic_jt_top'.png3x,
                width: 24.w,
                height: 24.w,
              ).withPadding(right: 16.w),
            ],
          ),
          Container(
            width: 1.sw,
            height: 1.w,
            margin: EdgeInsets.only(left: 15.w),
            color: const Color(0xffE7E9EB),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: contentList.map((e){
              return Container(
                width: 92.w,
                height: 27.w,
                margin: EdgeInsets.only(right: 12.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  border: Border.all(
                    color: Color(0xffCECECE),
                    width: 0.5.w,
                  )
                ),
                child: BaseText(text: e,fontSize: 16.sp,color: Color(0xff999999),),
              ).withOnTap(onTap: (){
                state.cardReq.purpose = e;
                state.remarksTextController.text = e;
              });
            }).toList(),
          ).withPadding(
            left: 12.w,top: 6.w
          )
        ],
      ),
    );
  }
}
