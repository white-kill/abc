import 'package:abc/pages/tabs/home/subpages/bill_page/bill_analysis/bill_analysis_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/bill_one_model.dart';

class Item1Widget extends StatefulWidget {
  final BillOneList model;

  const Item1Widget({super.key, required this.model});

  @override
  State<Item1Widget> createState() => _Item1WidgetState();
}

class _Item1WidgetState extends State<Item1Widget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: 350.w,
          width: 1.sw,
          height: 413 / 1290 * 1.sw,
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: 'bg_bill_item1'.png3x, fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style, // 继承默认文字样式
                      children: <InlineSpan>[
                        TextSpan(
                            text: widget.model.month,
                            style: TextStyle(
                                fontSize: 40.sp,
                                color: Color(0xff333333),
                                height: 56 / 40)), // 默认颜色部分
                        TextSpan(
                            text: '月',
                            style: TextStyle(
                                fontSize: 18.sp, color: Color(0xff333333))), //

                        TextSpan(
                            text: '/${widget.model.year}',
                            style: TextStyle(
                                fontSize: 14.sp, color: Color(0xff666666))),
                        WidgetSpan(
                          child: Image(
                            image: 'tips111'.png3x,
                            width: 13.w,
                            height: 13.w,
                          ).withContainer(
                            padding: EdgeInsets.only(left: 4.w),
                          ).withOnTap(onTap: (){
                            Get.dialog(
                              Material(
                                color: Colors.transparent,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Image(
                                        image: 'shouzhi_dialog'.png,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              barrierDismissible: true,
                            );
                          }),
                          alignment: PlaceholderAlignment.middle,
                        )
                      ],
                    ),
                  ).withPadding(
                    left: 25.w,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(
                            text: widget.model.expensesTotal,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          BaseText(
                            text: '支出(元)',
                            fontSize: 13.sp,
                            color: Color(0xff666666),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(
                            text: widget.model.incomeTotal,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                          BaseText(
                            text: '收入(元)',
                            fontSize: 13.sp,
                            color: Color(0xff666666),
                          ),
                        ],
                      ),
                    ],
                  ).withPadding(
                    left: 23.w,
                    right: 23.w,
                  ),
                ],
              ),
              Positioned(
                  right: 12.w,
                  top: 15.w,
                  child: SizedBox(
                    width: 45.w,
                    height: 32.w,
                  ).withOnTap(onTap: () {
                    Get.to(() => BillAnalysisPage(), arguments: {
                      'm':
                          '${widget.model.year}-${widget.model.month.padLeft(2, '0')}'
                    });
                  }))
            ],
          ),
        ),
        (widget.model.incomeTotal == '0' && widget.model.expensesTotal == '0')
            ? Container(
                height: 60.w,
                color: Colors.white,
                alignment: Alignment.center,
                child: BaseText(
                  text: '无收支记录',
                  fontSize: 14.sp,
                  color: Color(0xff999999),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
