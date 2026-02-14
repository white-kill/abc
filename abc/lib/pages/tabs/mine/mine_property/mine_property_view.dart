import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/mine_property/zctj/view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import 'mine_property_logic.dart';
import 'mine_property_state.dart';

class MinePropertyPage extends BaseStateless {
  MinePropertyPage({super.key,super.title = '资产负债'});

  final MinePropertyLogic logic = Get.put(MinePropertyLogic());
  final MinePropertyState state = Get.find<MinePropertyLogic>().state;


  @override
  bool get isChangeNav => true;


  @override
  Color? get titleColor => Colors.black;

  @override
  Color? get navColor => Color(0xffF9DD9C);


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'zcfz_right'.png3x,
      width: 22.w,
      height: 22.w,
      color: Colors.black,
    ).withPadding(
      left: 0.w,
      right: 15.w,
    ).withOnTap(onTap: (){
      Get.toNamed(Routes.myAccountPage);
    }),
  ];


  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    StackPosition position = StackPosition(designWidth: 1125, designHeight: 917, deviceWidth: screenWidth);
    return ListView(
        padding: EdgeInsets.zero,
      children: [

        Stack(
          children: [
            Container(
              width: 1.sw,height: 220.w + navHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: 'ic_zcfz'.png3x,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Expanded(child: Row(
                    children: [

                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(text: AppConfig.config.abcLogic.memberInfo.accountBalance.bankBalance,style: TextStyle(
                            fontSize: 22.sp,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 12.w,),
                          BaseText(text: '总资产(元)',style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff333333),
                          ),),
                          SizedBox(height: 8.w,),
                          Container(
                            width: 75.w,
                            height: 3.w,
                            color: logic.showLine.value?Color(0xffF3AD3C):null,
                          ),
                          SizedBox(height: 30.w,),
                        ],
                      ).withOnTap(onTap: (){
                        logic.showLine.value = true;
                      })),

                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(text: '0.00',style: TextStyle(
                            fontSize: 22.sp,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 12.w,),
                          BaseText(text: '总负债(元)',style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff333333),
                          ),),
                          SizedBox(height: 8.w,),
                          Container(
                            width: 75.w,
                            height: 3.w,
                            color: logic.showLine.value?null:Color(0xffF3AD3C),
                          ),
                          SizedBox(height: 30.w,),
                        ],
                      )),
                    ],
                  ).withOnTap(onTap: (){
                    logic.showLine.value = false;
                  }))),

                  Row(
                    children: [
                      Obx(() => BaseText(text: '数据截至:${logic.nowTime.value}').withPadding(
                          left: 40.w,
                          right: 10.w
                      )),
                      RotatingWidget(
                        image: 'ic_home_ref'.png3x,
                        color: Color(0xff459B7F),
                        disCallBack: (){
                          logic.nowTime.value = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 30.w,),
                ],
              ),
            ),
            StackPositionWidget(stackPosition: position, designX: 839, designY: 767, designWidth: 237, designHeight: 110).build(
              onTap: () {
                Get.to(ZctjPage());
              }
            ),
            StackPositionWidget(stackPosition: position, designX: 0, designY: 292, designWidth: 755, designHeight: 52).build(
                onTap: () {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '定活互转（整取整存）',
                    'image': 'dhhz',
                    'offset':false,
                    'defTitleColor': Colors.black,
                  });                }
            )
          ],
        ),


        SizedBox(height: 12.w,),


        Container(
          width: 375.w,
          height: 107.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 16.w,right: 8.w,top: 6.w,bottom: 6.w),
          child: Column(
            children: [
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BaseText(text: '活期',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Color(0xff333333),
                      ),),
                      Image(image: "zc_fz_h".png3x,width: 14.w,height: 14.w,).withPadding(
                        left: 13.w,),
                      // BaseText(text: '（占比100.0%）',fontSize: 16.sp,color: Color(0xff6E6E6E),)
                    ],
                  ).withOnTap(onTap: () {
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
                                image: 'debt_tip'.png,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      barrierDismissible: true,
                    );
                  }),
                  Row(
                    children: [
                      BaseText(text: AppConfig.config.abcLogic.memberInfo.accountBalance.bankBalance,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Color(0xff333333),
                      ),),
                      Image(image: "ic_jt_right".png3x,width: 24.w,height: 24.w,),
                    ],
                  ),
                ],
              ).withOnTap(onTap: (){
                Get.toNamed(Routes.billPagePage,);
              })),

              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BaseText(text: '尾号${AppConfig.config.abcLogic.cardFour()}',style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff333333),
                      ),),
                      BaseText(text: '（人民币）',fontSize: 14.sp,color: Color(0xff6E6E6E),)
                    ],
                  ),

                  Row(
                    children: [
                      BaseText(text: '￥${AppConfig.config.abcLogic.memberInfo.accountBalance.bankBalance}',style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff333333),
                      ),),
                      Image(image: "zc_fz_dian".png3x,width: 24.w,height: 24.w,),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),

        SizedBox(height: 40.w,),
        
        Container(
          padding: EdgeInsets.only(left: 16.w,right: 7.w),
          child:Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '温馨提示:\n资产视图展示您在农业银行的存款类、'
                      '理财类、基金类、债券类等相关资产信息，'
                      '统计范围不限于掌上银行签约账户，所有数据仅供参考，'
                      '不作为对账依据。如果您有外币资产将会被折算成人民币计算。\n'
                      '2.如有疑问，请联系我行客服电话 ',
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.sp,
                  ),
                ),
                TextSpan(
                  text: '95599',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14.sp,
                  ),
                ),

                TextSpan(
                  text: '或亲临农行网点。',
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          )
        )

      ],
    );
  }
}
