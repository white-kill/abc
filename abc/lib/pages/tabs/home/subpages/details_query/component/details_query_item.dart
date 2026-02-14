import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/details_query_model.dart';

class DetailsQueryItem extends StatefulWidget {
  final DetailsQueryList model;

  const DetailsQueryItem({super.key, required this.model});

  @override
  State<DetailsQueryItem> createState() => _DetailsQueryItemState();
}

class _DetailsQueryItemState extends State<DetailsQueryItem> {
  String amountString(String type, String mount) {
    String m = mount.replaceAll("-", "").replaceAll("+", "");

    if (type == '2') {
      return '- $m';
    }
    if (type == '1') {
      return '+ $m';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: widget.model.excerpt,
                    color: Color(0xff333333),
                    fontSize: 16.sp,
                  ).withContainer(width: 160.w),
                  BaseText(
                    text: amountString(widget.model.type, widget.model.amount),
                    color: widget.model.type == '1'
                        ? Colors.orangeAccent
                        : Color(0xff333333),
                    fontSize: 16.sp,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: widget.model.billDetail?.transactionTime ?? '',
                    color: Color(0xff666666),
                    fontSize: 14.sp,
                  ),
                  BaseText(
                    text: '余额：${widget.model.accountBalance}',
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
    );
  }
}
