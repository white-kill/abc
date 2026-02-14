import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/bill_one_model.dart';

class Item2Widget extends StatefulWidget {
  final BillOneList model;
  final bool isLastInMonth;
  const Item2Widget({super.key, required this.model, this.isLastInMonth = false});

  @override
  State<Item2Widget> createState() => _Item2WidgetState();
}

class _Item2WidgetState extends State<Item2Widget> {

  /// 将时间字符串转换为 分钟:秒 格式
  /// 例如：2025-10-30 20:12:08 -> 12:08
  String _formatTime(String timeStr) {
    if (timeStr.isEmpty) return '';
    
    try {
      // 解析时间字符串，提取时间部分
      List<String> parts = timeStr.split(' ');
      if (parts.length >= 2) {
        String timePart = parts[1]; // 获取时间部分 20:12:08
        List<String> timeParts = timePart.split(':');
        if (timeParts.length >= 3) {
          String minutes = timeParts[0]; // 分钟
          String seconds = timeParts[1]; // 秒
          return '$minutes:$seconds';
        }
      }
    } catch (e) {
      print('时间格式转换错误: $e');
    }
    
    return '';
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
            width: 50.w,
            height: 20.w,
            margin: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
              border: Border.all(color: Color(0xff979797), width: 1.w),
            ),
            alignment: Alignment.center,
            child: BaseText(text: widget.model.day),
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
                    text: widget.model.excerptName.replaceAll('()', ''),
                    color: Color(0xff333333),
                    fontSize: 16.sp,
                  ).withContainer(
                    width: 164.w
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
                    left: 2.w,right: 2.w,
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
                text: "${widget.model.bankCard} ${_formatTime(widget.model.billDetail?.transactionTime ?? '')}",
                color: Color(0xff666666),
                fontSize: 14.w,
              ),

              BaseText(
                text: '余额：￥ ${widget.model.accountBalance}',
                color: Color(0xff666666),
                fontSize: 14.w,
              ),

            ],
          ).withPadding(
            left: 37.w,
            right: 36.w,
          ),

          SizedBox(height: 20.w,),

          widget.isLastInMonth ? SizedBox.shrink() : Container(
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
