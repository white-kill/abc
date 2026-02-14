import 'package:abc/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/abc_config/abc_logic.dart';
import '../../../../routes/app_pages.dart';
import '../mine_logic.dart';
import '../mine_state.dart';

class MineItem1 extends StatefulWidget {
  const MineItem1({super.key});

  @override
  State<MineItem1> createState() => _MineItem1State();
}

class _MineItem1State extends State<MineItem1> {

  final MineLogic logic = Get.put(MineLogic());
  final MineState state = Get.find<MineLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          margin: EdgeInsets.only(top: 15),
          child: Stack(
            children: [
              Image(image: "bg_mine_item_1".png3x, fit: BoxFit.fitWidth, width: 1.sw,),
              Positioned(
                  left: 125.w,
                  top: 5.w,
                  child: Obx(() =>Container(
                    width: 120.w,
                    height: 40.w,
                    color: Colors.transparent,
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: logic.isOpen.value?'ic_mine_open'.png3x:'ic_mine_close'.png3x,
                      width: 20.w,
                      height: 12.w,
                    ),
                  ).withOnTap(onTap: (){
                    logic.isOpen.value = !logic.isOpen.value;
                  }))
              ),


              // 我的资产
              Positioned(
                left: 35.w,
                top: 75.w,
                child: GetBuilder(builder: (AbcLogic c) {
                return Obx(() =>
                    Container(
                      height: 24.sp,
                      child: logic.isOpen.value?  BaseText(
                        text: '¥ ${c.memberInfo.accountBalance.bankBalance}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            fontFamily: "MiSans"
                        ),
                      ):logic.replaceAsterisksWithImages(),
                    )
                );
              },id: 'updateUI',),),
              //我的负债
              Positioned(
                left: 205.w,
                top: 75.w,
                child: Obx(() => Container(
                height: 24.sp,
                child:  logic.isOpen.value?BaseText(
                  text: '¥ 0.00',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      fontFamily: "MiSans"

                  ),
                ):logic.replaceAsterisksWithImages(),
              )),),

              // 月度账单
              Positioned(
                  bottom: 20.w,
                  child: Container(
                    height: 40.w,
                    width: 1.sw,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.billPagePage);
                  }))
            ],
          ),
        ).withOnTap(onTap: () {
          Get.toNamed(Routes.minePropertyPage);
        }),
      ],
    );
    
    
    return Container(
      width: 375.w,
      height: 160.w,
      padding: EdgeInsets.only(bottom: 44.w),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: 'bg_mine_item_1'.png3x,
            fit: BoxFit.fitWidth,)
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BaseText(
                  //   text: '我的资产',
                  //
                  //   style: TextStyle(
                  //       color: Color(0xff979797),
                  //       fontSize: 14.sp,
                  //       fontFamily: 'PingFang'
                  //   ),
                  // ),
                  // SizedBox(height: 5.w,),
                  GetBuilder(builder: (AbcLogic c) {
                    return Obx(() =>
                            Container(
                              height: 24.sp,
                              child: logic.isOpen.value?  BaseText(
                                text: '¥ ${c.memberInfo.accountBalance.bankBalance}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    fontFamily: "MiSans"
                                ),
                              ):logic.replaceAsterisksWithImages(),
                            )
                       );
                  },id: 'updateUI',),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // BaseText(
                  //   text: '我的负债',
                  //   style: TextStyle(
                  //       color: Color(0xff979797),
                  //       fontSize: 14.sp,
                  //       fontFamily: 'PingFang'
                  //   ),
                  // ),
                  // SizedBox(height: 5.w,),
                  Obx(() => Container(
                    height: 24.sp,
                    child:  logic.isOpen.value?BaseText(
                      text: '¥ 0.00',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          fontFamily: "MiSans"

                      ),
                    ):logic.replaceAsterisksWithImages(),
                  )),
                ],
              ),
            ],
          ).withPadding(
            left: 40.w,
            right: 40.w
          ).withOnTap(onTap: (){
            Get.toNamed(Routes.minePropertyPage);
          }),

          Positioned(
            left: 125.w,
            top: 9.w,
            child: Obx(() =>Container(
              width: 120.w,
              height: 40.w,
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              child: Image(
                image: logic.isOpen.value?'ic_mine_open'.png3x:'ic_mine_close'.png3x,
                width: 20.w,
                height: 12.w,
              ),
            ).withOnTap(onTap: (){
              logic.isOpen.value = !logic.isOpen.value;
            }))
          )
        ],
      ),
    );
  }
}
