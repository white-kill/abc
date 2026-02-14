import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/new_transfer_list_model.dart';

class RecordItem extends StatefulWidget {
  final NewTransferListList model;

  const RecordItem({super.key, required this.model});

  @override
  State<RecordItem> createState() => _RecordItemState();
}

class _RecordItemState extends State<RecordItem> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
       widget.model.day != ''? Container(
          width: 1.sw,
          height: 36.w,
          color: Color(0xffF7F7F7),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16.w),
          child: BaseText(
            text: widget.model.day,
            fontSize: 14.sp,
            color: Color(0xff666666),
          ),
        ):SizedBox.shrink(),
        Container(
          height: 70.w,
          width: 1.sw,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 8.w,
              ),
              netImage(
                url: widget.model.icon,
                width: 25.w,
                height: 25.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text:
                            '${widget.model.oppositeName}(${widget.model.oppositeAccount.maskBankCardNumber()})',
                            style: TextStyle(
                                color: Color(0xff373737),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),
                          ).withContainer(
                              width: 160.w
                          ),
                          BaseText(
                            text: widget.model.amount,
                            color: Color(0xff373737),
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 6.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text: widget.model.transactionTime,
                            color: Color(0xff666666),
                            fontSize: 14.sp,
                          ),
                          BaseText(
                            text: '成功',
                            color: Color(0xff666666),
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                width: 10.w,
              ),
              Image(
                image: 'ic_jt_right'.png3x,
                width: 20.w,
                height: 20.w,
              )
            ],
          ),
        )
      ],
    );
  }
}
