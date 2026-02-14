import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'my_customer_logic.dart';
import 'my_customer_state.dart';

class My_customerPage extends BaseStateless {
  My_customerPage({Key? key}) : super(key: key, title: '在线客服');

  final My_customerLogic logic = Get.put(My_customerLogic());
  final My_customerState state = Get.find<My_customerLogic>().state;

  @override
  Color? get background => Color.fromARGB(255, 247, 247, 247);

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 120.w),
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.w),
                alignment: Alignment.center,
                child: BaseText(
                  text: '下拉查看历史消息',
                  fontSize: 14.sp,
                  color: Color(0xff444444),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.w, bottom: 20.w),
                alignment: Alignment.center,
                child: BaseText(
                  text: DateUtil.formatDate(DateTime.now(),
                      format: DateFormats.full),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              Image(
                image: 'ic_ke_c0'.png3x,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: 'ic_kf_c2'.png3x,
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 12.w,
          runSpacing: 12.w,
          children: state.nameList.map((e) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ).withOnTap(onTap: () {
                logic.jumpPage(e);
              }),
            );
          }).toList(),
        ).withContainer(
            height: 40.w, width: 1.sw, padding: EdgeInsets.only(left: 12.w)),
        Container(
          height: ScreenUtil().bottomBarHeight + 10.w + 45.w,
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 10.w),
          child: Image(
            image: 'ic_kf_d2'.png3x,
            width: 1.sw,
            fit: BoxFit.fitWidth,
            height: 45.w,
          ),
        )
      ],
    );
  }
}
