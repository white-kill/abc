import 'dart:math';

import 'package:abc/pages/tabs/home/subpages/my_account/child/zhss/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../mine/mine_property/mine_property_view.dart';
import '../../../other/customer/customer_view.dart';

class RightWidget extends StatefulWidget {
  const RightWidget({super.key});

  @override
  State<RightWidget> createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget> {
  @override
  Widget build(BuildContext context) {
    return  Image(
      image: 'ic_sz_more'.png3x,
      width: 24.w,
      height: 24.w,
    ).withOnTap(onTap: (){
      scalePoint(context);
    }).withPadding(
      right: 20.w,
    );
  }

  void scalePoint(BuildContext context) {
    SmartDialog.showAttach(
      targetContext: context,
      targetBuilder: (targetOffset, targetSize) {
        return Offset(targetOffset.dx,
            targetOffset.dy - 10.w);
      },
      maskColor: Colors.transparent,
      alignment: Alignment.bottomCenter,
      animationType: SmartAnimationType.scale,
      builder: (_) {
        return SizedBox(
          width:  135.w,
          child: Stack(children: <Widget>[

            Container(
              margin: const EdgeInsets.only(top: 15,right: 10),
              width:  135.w,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.w), // 圆角（可选）
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // 阴影颜色
                    spreadRadius: 0, // 阴影扩散范围
                    blurRadius: 5, // 阴影模糊程度
                    offset: Offset(1, 1), // 阴影偏移量 (x, y)
                  ),
                ],
              ),
              alignment: Alignment.center,
              child:
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 7.w,),
                      Image(
                        image: 'r_setting'.png3x,
                        width: 22.w,
                        height: 22.w,
                        color: Colors.black,
                      ).withPadding(
                        right: 8.w,
                      ),
                      SizedBox(width: 8.w,),
                      BaseText(
                        text: '账户设置',
                        color: Colors.black,
                      )
                    ],
                  ).withContainer(
                      height: 45.w, alignment: Alignment.centerLeft)
                      .withOnTap(onTap: () {
                    Get.to(ZhssPage());

                    SmartDialog.dismiss();
                    //TODO: 跳转消息
                  }),


                  Container(
                    width: 80.w,
                    height: 0.5.w,
                    color: Color(0xffdedede),
                  ),

                  Row(
                    children: [
                      SizedBox(width: 7.w,),
                      Image(
                        image: 'r_zcfz'.png3x,
                        width: 22.w,
                        height: 22.w,
                        color: Colors.black,
                      ).withPadding(
                        right: 8.w,
                      ),
                      SizedBox(width: 8.w,),
                      BaseText(
                        text: '资产负债',
                        color: Colors.black,
                      ),
                    ],
                  ).withContainer(
                      height: 45.w, alignment: Alignment.centerLeft).withOnTap(onTap: (){
                    SmartDialog.dismiss();
                    Get.to(() => MinePropertyPage());
                  }),
                  
                  Container(
                    width: 80.w,
                    height: 0.5.w,
                    color: Color(0xffdedede),
                  ),
                  
                  Row(
                    children: [
                      SizedBox(width: 7.w,),
                      Image(
                        image: 'kefu'.png3x,
                        width: 20.w,
                        height: 20.w,
                        color: Colors.black,
                      ).withPadding(
                        left: 0.w,
                        right: 8.w,
                      ),
                      SizedBox(width: 8.w,),
                      BaseText(
                        text: '客服',
                        fontSize: 14.sp,
                        color: Colors.black,
                      )
                    ],
                  ).withContainer(
                      height: 45.w, alignment: Alignment.centerLeft)
                      .withOnTap(onTap: () {
                    SmartDialog.dismiss();
                    Get.to(() => CustomerPage());
                    //TODO: 跳转消息
                  }),

                ],
              ).withPadding(left: 10.w).withOnTap(onTap: () {
                SmartDialog.dismiss();
                //TODO: 跳转版本
              }),
            ),
          ]),
        );
      },
    );
  }
}
