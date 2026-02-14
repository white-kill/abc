import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/app_config.dart';
import '../../../../../../utils/abc_button.dart';
import '../details_query_logic.dart';
import '../details_query_state.dart';

class DetailsQueryTopWidget extends StatefulWidget {
  const DetailsQueryTopWidget({super.key});

  @override
  State<DetailsQueryTopWidget> createState() => _DetailsQueryTopWidgetState();
}

class _DetailsQueryTopWidgetState extends State<DetailsQueryTopWidget> {

  final DetailsQueryLogic logic = Get.put(DetailsQueryLogic());
  final DetailsQueryState state = Get.find<DetailsQueryLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 44.w,
            color: Colors.white,
            padding: EdgeInsets.only(left: 20.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: 'ic_ly_logo'.png3x, width: 20.w, height: 20.w),
                    SizedBox(width: 8.w),
                    BaseText(
                        text: AppConfig.config.abcLogic.card(), fontSize: 16.sp),
                  ],
                ),
                Row(
                  children: [
                    BaseText(
                      text: '人民币 | 本币',
                      color: Color(0xff333333),
                      fontSize: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Image(
                      image: 'tag_down'.png3x,
                      width: 12.w,
                      height: 12.w,
                    ).withPadding(bottom: 2.w),
                  ],
                ).withOnTap(onTap: (){
                  AlterPickerTime.showDataPick(
                    context,
                    dataList: ['人民币 | 本币'],
                    onConfirm: (List v) {
                    },
                  );
                }),
              ],
            ),
          ),
          Container(
            height: 60.w,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state.tagName.map((e) {
                return Obx(
                      () => AbcButton(
                        height: 28.w,
                    title: e,
                    bgColor: logic.tagIndex.value == state.tagName.indexOf(e)
                        ? Colors.orangeAccent
                        : Colors.white,
                    titleColor: logic.tagIndex.value == state.tagName.indexOf(e)
                        ? Colors.white
                        : Colors.black,
                    onTap: () {
                      if (e == '筛选') {
                        logic.openPermanentDialog();
                      } else {
                        logic.tagIndex.value = state.tagName.indexOf(e);
                        logic.changeTime();
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
