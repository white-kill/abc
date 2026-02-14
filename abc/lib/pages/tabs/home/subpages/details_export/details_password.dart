import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../other/verification_box/verification_box.dart';
import 'details_export_logic.dart';

class DetailsPassword extends StatefulWidget {
  const DetailsPassword({super.key});

  @override
  State<DetailsPassword> createState() => _DetailsPasswordState();
}

class _DetailsPasswordState extends State<DetailsPassword> {
  final DetailsExportLogic logic = Get.put(DetailsExportLogic());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 150.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              ).withOnTap(onTap: () {
                SmartDialog.dismiss();
              }),
              BaseText(
                text: '请输入您的账户密码',
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 24.w,
              ),
            ],
          ).withPadding(
            top: 12.w,
          ),

          SizedBox(height: 32.w,),
          VerificationBox(
            count: 6,
            borderColor: Colors.grey,
            itemWidth: 45.w,
            itemHeight:45.w,
            obscureText: true,
            onSubmitted: (value) {
              SmartDialog.dismiss().then((_) {
                logic.print();
              });
            },
          ),

        ],
      ).withPadding(left: 12.w, right: 12.w),
    );
  }
}
