import 'package:abc/utils/abc_button.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/app_config.dart';
import 'transfer_notice_logic.dart';
import 'transfer_notice_state.dart';

class Transfer_noticePage extends BaseStateless {
  Transfer_noticePage({Key? key}) : super(key: key, title: '通知收款人');

  final Transfer_noticeLogic logic = Get.put(Transfer_noticeLogic());
  final Transfer_noticeState state = Get.find<Transfer_noticeLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.w),
      children: [
        Container(
          width: 1.sw,
          height: 420.w,
          decoration: decorationImage('tz_top_bg'),
          child: Column(
            children: [
              Container(
                  height: 130.w,
                  margin: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Stack(
                  children: [
                    Positioned(
                        right: 18.w,
                        child: Image(image: 'ic_z'.png3x,width: 120.w,height: 140.w,)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: '${AppConfig.config.abcLogic.memberInfo.realName}向${Get.arguments?['name']??''}转账',
                          fontSize: 14.sp,
                        ),

                        SizedBox(height: 20.w,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BaseText(text: '¥ ',fontSize: 26.sp,),
                            BaseText(text: double.parse('${Get.arguments?['amount']??'0'}').bankBalance,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                            ),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Expanded(
                  child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        text: state.titleList[index],
                        color: Color(0xff555555),
                        fontSize: 14.sp,
                      ),
                      if (state.titleList[index] == '付款账户' ||
                          state.titleList[index] == '收款帐号')
                        logic.replaceAsterisksWithImages(
                            logic.valueText(state.titleList[index])),
                      if (state.titleList[index] != '付款账户' &&
                          state.titleList[index] != '收款帐号')
                        BaseText(
                          text: logic.valueText(state.titleList[index]),
                          color: Color(0xff555555),
                          fontSize: 14.sp,
                        )
                    ],
                  ).withContainer(height: 32.w);
                },
                itemCount: state.titleList.length,
              ).withContainer(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 15.w),
                      margin: EdgeInsets.only(left: 15.w, right: 15.w))),
            ],
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        VerticalGridView(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          widgetBuilder: (_, index) {
            return Obx(() => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(
                          color: logic.selIndex.value == index
                              ? Colors.orangeAccent
                              : Colors.transparent,
                          width: 1.w)),
                  child: Image(
                    image: 'tz_$index'.png3x,
                    fit: BoxFit.fill,
                  ),
                )).withOnTap(onTap: () {
              logic.selIndex.value = index;
            });
          },
          itemCount: 9,
          crossCount: 3,
          mainHeight: 70.w,
          spacing: 10.w,
          crossSpacing: 20.w,
        ),
        SizedBox(
          height: 20.w,
        ),
        AbcButton(
          title: '发送到微信',
          width: 344.w,
          height: 45.w,
          titleColor: Colors.white,
          bgColor: Color(0xffF8A82F),
          radius: 2,
          fontSize: 18,
          onTap: () {
            Get.back();
            Get.back();
          },
        ).withPadding(left: 15.w, right: 15.w),
        SizedBox(
          height: 10.w + ScreenUtil().bottomBarHeight,
        ),
      ],
    );
  }
}
