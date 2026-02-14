import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../placeholder_search_widget.dart';
import 'lifepay_logic.dart';
import 'lifepay_state.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';

class LifepayPage extends BaseStateless {
  LifepayPage({Key? key}) : super(key: key);

  final LifepayLogic logic = Get.put(LifepayLogic());
  final LifepayState state = Get.find<LifepayLogic>().state;
  @override
  Widget? get titleWidget => Text('生活缴费',style: TextStyle(color: Colors.black,fontSize: 17.sp),);

  @override
  List<Widget>? get rightAction => [
    _customWidget('lifepay_record', '记录'),
    _customWidget('kefu', '客服').withOnTap(onTap: () {
      Get.to(() => CustomerPage());
    }),  ];

  Widget _customWidget(String imgName, String title) {
    return Column(
      children: [
        SizedBox(height: 12.w),
        Image(
          width: 22.w,
          height: 22.w,
          image: imgName.png3x,
          color: Colors.black,
        ),
      ],
    ).paddingOnly(right: 15.w);
  }
  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 7.w),
                    Row(
                        children: [
                          SizedBox(width: 25.w),
                          Text('合肥', style: TextStyle(fontSize: 12.sp,color: Colors.grey)),
                          SizedBox(width: 2.w),
                          Image(
                            width: 21.w,
                            height: 21.w,
                            image: ('location').png3x,color: Colors.black,
                          ),
                        ]
                    ),
                  ],
                ),
                PlaceholderSearchWidget(
                  width: 265.w,
                  contentList: ['请输入关键字搜索'],
                  bgColor: Color(0xffEAF2FD).withOpacity(0.4),
                  textColor: Colors.grey,
                ).paddingOnly(left: 10.w),
              ],
            ).withOnTap(
              onTap: () {
                //TODO: 点击事件 抽奖
              },
            ),
          ],
        ),
        SizedBox(height: 26.w),
        Image(image: 'lifepay_big_bg'.png3x),
      ],
    ).withContainer(
      color: Colors.white,
    );
  }
}
