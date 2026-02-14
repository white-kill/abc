import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../home/placeholder_search_widget.dart';
import 'main_order_logic.dart';
import 'main_order_state.dart';

class Main_orderPage extends BaseStateless {

  Main_orderPage({Key? key})
      : super(key: key, title: Get.arguments?['titleName'] ?? '全部订单');

  final Main_orderLogic logic = Get.put(Main_orderLogic());
  final Main_orderState state = Get
      .find<Main_orderLogic>()
      .state;

  @override
  Color? get background => Colors.white;

  List titleNames = [
    '全部',
    '待发货',
    '待收货',
    '已完成',
    '已取消'
  ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 18.w,),
            PlaceholderSearchWidget(
              width: 298,
              height: 30,
              contentList: ['商品名称',],
              bgColor: Color(0xffEFEFEF),
              rightIcon: Container(),
            ),
            SizedBox(width: 12.w,),
            BaseText(text: '搜索', fontSize: 14.sp, color: Color(0xff6C6C6C),),
            SizedBox(width: 12.w,),
          ],
        ),
        SizedBox(height: 6.w,),
        Container(
          width: 375.w,
          height: 30.w,
          padding: EdgeInsets.only(left: 23.w),
          alignment: Alignment.centerLeft,
          color: Color(0xffFCEFB9),
          child: BaseText(
            text: '涉及第三方服务的订单信息，如未显示，请到购买页面查询。',
            fontSize: 10.sp,),
        ),

        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titleNames.map((e) {
              int index = titleNames.indexOf(e);
              bool selIndex = index == logic.tabIndex.value;
              return InkWell(
                onTap: () {
                  logic.tabIndex.value = index;
                },
                child: Column(
                  children: [
                    BaseText(text: e, fontSize: 14.sp, color: selIndex ? Color(
                        0xff53B88B) : Colors.black,),
                    SizedBox(height: 12.w,),
                    Container(
                      width: 35.w, height: 2.w,
                      color: selIndex ? Color(0xff53B88B) : Colors.white,
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }).withPadding(
          left: 23.w, right: 23.w, top: 12.w,
        ),

        SizedBox(height: 12.w,),
        Expanded(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Image(image: 'bg_order1'.png3x, width: 1.sw, height: 207.w,)
          ],
        ))
      ],
    );
  }
}
