import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'dk_widget_logic.dart';
import 'dk_widget_state.dart';

class Dk_widgetPage extends BaseStateless {
  Dk_widgetPage({Key? key}) : super(key: key);

  final Dk_widgetLogic logic = Get.put(Dk_widgetLogic());
  final Dk_widgetState state = Get.find<Dk_widgetLogic>().state;
  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text('贷款',style: TextStyle(color: Colors.black,fontSize: 17.sp),);

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
      Image(
          width: 22.w,
          height: 22.w,
          image: ('go_back').png3x, color: Colors.black
      ).withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );
  @override
  List<Widget>? get rightAction => [
    _customWidget('xiaoxi', '消息'),
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
    // TODO: implement initBody
    return ListView(
      children: [
        Stack(
            children: [
              Image(image: 'banner_bg_yellow'.png3x),
              Positioned(
                  top: 43.w,
                  left: 17.w,
                  right: 17.w,
                  child: Row(
                    children: [
                      Text(
                        '您好，您当前没有贷款',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text('查看详情',style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                      SizedBox(width: 2.w),
                      Image(image: 'right_arrow_yellow'.png3x,width: 18.w,height: 18.w,color: Colors.white,),
                    ],
                  )
              ),
            ]
        ),
        Image(image: 'dk_big_image'.png3x,fit: BoxFit.fitWidth,),
      ],
    );
  }
  
}
