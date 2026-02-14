import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'details_export_logic.dart';
import 'details_password.dart';

class AlterContent extends StatefulWidget {
  const AlterContent({super.key});

  @override
  State<AlterContent> createState() => _AlterContentState();
}

class _AlterContentState extends State<AlterContent> {
  final DetailsExportLogic logic = Get.put(DetailsExportLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseText(
                text: '提示',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ).withPadding(left: 12.w, right: 12.w, top: 15.w, bottom: 15.w),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 12.w,bottom: 25.w),
            width: 1.sw,
            height: 60.w,
            alignment: Alignment.center,
            child: BaseText(
              text: '请确认您接收交易明细的邮箱如下:\n${logic.state.emailTextController.text}',
              textAlign: TextAlign.center,
              fontSize: 15.sp,
              color: Color(0xff666666),
            ),
          ),
          Container(
            width: 1.sw * 0.88,
            height: 0.5.w,
            color: const Color(0xffbbbbab),
          ),
          SizedBox(
            height: 46.w,
            width: 1.sw * 0.8,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: BaseText(
                    text: '取消',
                    fontSize: 16.sp,
                    color: Color(0xFF666666),
                  ),
                ).withOnTap(onTap: () {
                  SmartDialog.dismiss();
                })),
                Container(
                  width: 0.5.w,
                  height: 42.w,
                  color: const Color(0xffbbbbab),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: BaseText(
                    text: '确定',
                    fontSize: 16.sp,
                    color: Colors.orangeAccent,
                  ),
                ).withOnTap(onTap: () {
                  SmartDialog.dismiss().then((_) {
                    AlterWidget.alterWidget(builder: (context) {
                      return const DetailsPassword();
                    });
                  });
                })),
              ],
            ),
          )
        ],
      ),
    );
  }
}
