import 'package:abc/config/app_config.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'phone_logic.dart';
import 'phone_state.dart';

class PhonePage extends BaseStateless {
  PhonePage({Key? key}) : super(key: key,title: '手机充值');

  final PhoneLogic logic = Get.put(PhoneLogic());
  final PhoneState state = Get.find<PhoneLogic>().state;

  @override
  List<Widget>? get rightAction => [
    Center(
      child: Container(
        width: 19.sp,
        height: 19.sp,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.sp),
          border: Border.all(color: Colors.black, width: 1.w),
        ),
        child: Icon(
          Icons.clear,
          color: Colors.black,
          size: 18.sp,
        ).withOnTap(onTap: () {
          Get.back();
        })
      ).withOnTap(onTap: () {
        Get.back();
      }),
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        
        Stack(
          children: [
            Image(image: 'bg_sjcz'.png3x,fit: BoxFit.fitWidth,),

            Positioned(left: 12.w,top: 12.w,child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(text:logic.phone(),style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 4.w,),
                  ],
                )
              ],
            ))
          ],
        )
      ],
    );
  }
}
