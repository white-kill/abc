import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/yueduo/yueduo_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../mine_logic.dart';
import '../mine_state.dart';

class MineItem2 extends StatefulWidget {
  const MineItem2({super.key});

  @override
  State<MineItem2> createState() => _MineItem2State();
}

class _MineItem2State extends State<MineItem2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final double totalWidth = 288;
  double _width1 = 0;
  double _width2 = 0;

  void _calculateWidths() {
    double value1 = AppConfig.config.abcLogic.memberInfo.expensesTotal;
    double value2 = AppConfig.config.abcLogic.memberInfo.incomeTotal;
    double sum = value1 + value2;

    if (sum == 0) {
      setState(() {
        _width1 = totalWidth / 2;
        _width2 = totalWidth / 2;
      });
      return;
    }

    setState(() {
      _width1 = ((value1 / sum) * totalWidth).w;
      _width2 = ((value2 / sum) * totalWidth).w;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateWidths();
  }

  final MineLogic logic = Get.put(MineLogic());
  final MineState state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Image(image: 'bg_mine_item_2'.png3x, fit: BoxFit.fitWidth, width: 1.sw, gaplessPlayback: true,),
              Positioned(child: Container(
                height: 40.w,
                width: 1.sw,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.billPagePage);
              })),
              Positioned(
                  left: 125.w,
                  top: 10.w,
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
              // 支出
              Positioned(
                left: 35.w,
                top: 75.w,
                child:                           Obx(() => Container(
                  height: 22.sp,
                  child: logic.isOpen.value
                      ? BaseText(
                    text:
                    '¥ ${AppConfig.config.abcLogic.memberInfo.expensesTotal.bankBalance}',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      // fontFamily: "MiSans"
                    ),
                  )
                      : logic.replaceAsterisksWithImages(),
                )),),
              // 收入
              Positioned(
                left: 205.w,
                top: 75.w,
                child:  Obx(() => Container(
                  height: 22.sp,
                  child:  logic.isOpen.value
                      ? BaseText(
                    text:
                    '¥ ${AppConfig.config.abcLogic.memberInfo.incomeTotal.bankBalance}',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      // fontFamily: "MiSans"
                    ),
                  )
                      : logic.replaceAsterisksWithImages(),
                )),),
              // 进度
              Positioned(
                top: 102.w,
                left: 33.w,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: _width1,
                    height: 6.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        bottomLeft: Radius.circular(3.w),
                        topRight: Radius.circular(_width2 > 0 ? 0 : 3.w),
                        bottomRight: Radius.circular(_width2 > 0 ? 0 : 3.w),
                      ),
                      color: Color(0xff56BD9B),
                    ),
                  ),
                  (_width1 == 0 || _width2 == 0)
                      ? SizedBox.shrink()
                      : Image(
                      image: 'ic_mine_pors'.png3x,
                      width: 18.w,
                      height: 6.w),
                  Container(
                    width: _width2,
                    height: 6.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.w),
                        bottomRight: Radius.circular(3.w),
                        topLeft: Radius.circular(_width1 > 0 ? 0 : 3.w),
                        bottomLeft: Radius.circular(_width1 > 0 ? 0 : 3.w),
                      ),
                      color: Color(0xffF5C366),
                    ),
                  ),
                ],
              ).withContainer(width: 308.w),),
              // 月度账单
              Positioned(
                  top: 140.w,
                  right: 50.w,
                  child: Text("您的${DateTime(DateTime.now().year, DateTime.now().month - 1).month}月账单已出", style: TextStyle(
                    fontSize: 13.w,
                    height: 1.0,
                    color: Color(0xFF777777)
                  ),).withOnTap(onTap: () {
                    Get.to(() => YueduoPage());
                  })),



            ],
          ),
        ),
      ],
    );


    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'bg_mine_item_2'.png3x,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // SizedBox(height: 65.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: '支出',
                            fontSize: 13.sp,
                            color: Color(0xff979797),
                          ),
                          SizedBox(height: 10.w),
                          Obx(() => Container(
                            height: 22.sp,
                            child: logic.isOpen.value
                                ? BaseText(
                              text:
                              '¥ ${AppConfig.config.abcLogic.memberInfo.expensesTotal.bankBalance}',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                // fontFamily: "MiSans"
                              ),
                            )
                                : logic.replaceAsterisksWithImages(),
                          )),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BaseText(
                            text: '收入',
                            fontSize: 13.sp,
                            color: Color(0xff979797),
                          ),
                          SizedBox(height: 10.w),
                          Obx(() => Container(
                            height: 22.sp,
                            child:  logic.isOpen.value
                                ? BaseText(
                              text:
                              '¥ ${AppConfig.config.abcLogic.memberInfo.incomeTotal.bankBalance}',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                  // fontFamily: "MiSans"
                              ),
                            )
                                : logic.replaceAsterisksWithImages(),
                          )),
                        ],
                      ),
                    ],
                  )
                      .withPadding(
                        left: 10.w,
                        right: 10.w,
                      )
                      .withContainer(width: 308.w),
                  SizedBox(height: 10.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _width1,
                        height: 6.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.w),
                            bottomLeft: Radius.circular(3.w),
                            topRight: Radius.circular(_width2 > 0 ? 0 : 3.w),
                            bottomRight: Radius.circular(_width2 > 0 ? 0 : 3.w),
                          ),
                          color: Color(0xff56BD9B),
                        ),
                      ),
                      (_width1 == 0 || _width2 == 0)
                          ? SizedBox.shrink()
                          : Image(
                              image: 'ic_mine_pors'.png3x,
                              width: 18.w,
                              height: 6.w),
                      Container(
                        width: _width2,
                        height: 6.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3.w),
                            bottomRight: Radius.circular(3.w),
                            topLeft: Radius.circular(_width1 > 0 ? 0 : 3.w),
                            bottomLeft: Radius.circular(_width1 > 0 ? 0 : 3.w),
                          ),
                          color: Color(0xffF5C366),
                        ),
                      ),
                    ],
                  ).withContainer(width: 308.w),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                      text: "月度账单", style: TextStyle(
                    fontSize: 17.sp, color: Color(0xff333333),
                    fontFamily: "PingFang",
                    fontWeight: FontWeight.bold
                  ),),
                  Row(
                    children: [
                      BaseText(
                        text: '您的月份账单已出',
                        color: Color(0xff9D9D9D),
                        fontSize: 12.sp,
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 16.w,
                        height: 16.w,
                      )
                    ],
                  )
                ],
              ).withOnTap(onTap: (){
                Get.to(() => YueduoPage());
              }).withPadding(
                left: 40.w,
                bottom: 35.w,
                right: 30.w,
              ),
            ],
          ),
          Positioned(
              left: 125.w,
              top: 17.w,
              child: Obx(() => Container(
                    width: 50.w,
                    height: 20.w,
                    color: Colors.transparent,
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: logic.isOpen.value
                          ? 'ic_mine_open'.png3x
                          : 'ic_mine_close'.png3x,
                      width: 20.w,
                      height: 12.w,
                    ),
                  ).withOnTap(onTap: () {
                    logic.isOpen.value = !logic.isOpen.value;
                  }))),
          Positioned(
              top: 17.h,
              left: screenWidth/5.0 * 2,
              child: Container(
                width: screenWidth/5.0 * 3,
                height: 50.w,

              ).withOnTap(onTap: () {
                Get.toNamed(Routes.billPagePage);
              }
              ))
        ],
      ),
    );
  }
}
