import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/search_bill_model.dart';
import '../../../../../../utils/widget_util.dart';

class Item2SearchWidget extends StatefulWidget {
  final SearchBillList model;
  const Item2SearchWidget({super.key, required this.model});

  @override
  State<Item2SearchWidget> createState() => _Item2SearchWidgetState();
}

class _Item2SearchWidgetState extends State<Item2SearchWidget> {

  String dateTimeToDate(String dateTimeStr, {String format = 'yyyy-MM-dd'}) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      return DateFormat(format).format(dateTime);
    } catch (e) {
      // 如果解析失败，尝试其他方法
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.w),
          widget.model.day == ''?SizedBox.shrink():Container(
            width: 95.w,
            height: 22.w,
            margin: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.w)),
              border: Border.all(color: Color(0xff979797), width: 1.w),
            ),
            alignment: Alignment.center,
            child: BaseText(text: dateTimeToDate(widget.model.billDetail?.transactionTime??''),color: Color(0xff333333),),
          ),
          widget.model.day == ''?SizedBox.shrink():SizedBox(height: 14.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Image(image: 'ic_test1'.png3x, width: 17.w, height: 17.w),
                  netImage(url: widget.model.icon, width: 17.w, height: 17.w),
                  BaseText(
                    text: widget.model.excerpt,
                    color: Color(0xff333333),
                    fontSize: 16.sp,
                  ),
                ],
              ),

              Row(
                children: [

                  BaseText(
                    text: widget.model.type == '2'?'-':'+',
                    style: TextStyle(
                      fontSize: 16.w,
                      color:widget.model.type == '1'?Colors.orangeAccent:Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BaseText(
                    text: "¥",
                    style: TextStyle(
                      fontSize: 19.w,
                      color:widget.model.type == '1'?Colors.orangeAccent:Color(0xff333333),
                    ),
                  ).withPadding(
                    left: 4.w,right: 4.w,
                  ),
                  BaseText(
                    text: widget.model.amount.replaceAll("-", "").replaceAll("+", ""),
                    style: TextStyle(
                      fontSize: 16.w,
                      color:widget.model.type == '1'?Colors.orangeAccent:Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  Image(image: 'ic_jt_right'.png3x,width: 20.w,height: 20.w,)
                ],
              ),
            ],
          ).withPadding(
            left: 21.w,
            right: 12.w,
          ),

          SizedBox(height: 12.w,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: widget.model.bankCard,
                color: Color(0xff666666),
                fontSize: 14.w,
              ),

              BaseText(
                text: '余额：￥  ${widget.model.accountBalance}',
                color: Color(0xff666666),
                fontSize: 14.w,
              ),

            ],
          ).withPadding(
            left: 37.w,
            right: 36.w,
          ),

          SizedBox(height: 20.w,),

          Container(
            margin: EdgeInsets.only(left: 15.w,right: 15.w),
            color: const Color(0xffE7E9EB),
            height: 1.w,
            width: 355.w,
          )
        ],
      ),
    );
  }
}
