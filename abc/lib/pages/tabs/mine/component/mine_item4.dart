import 'package:abc/pages/tabs/mine/login_setting/login_setting_view.dart';
import 'package:abc/pages/tabs/mine/zz_setting/zz_setting_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../pay_setting/pay_setting_view.dart';
import '../phone_setting/phone_setting_view.dart';

class MineItem4 extends StatefulWidget {
  const MineItem4({super.key});

  @override
  State<MineItem4> createState() => _MineItem4State();
}

class _MineItem4State extends State<MineItem4> {
  List titleName = [
    '登录设置',
    '转账设置',
    '支付设置',
    '手机号管理',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 160.w,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: 'bg_mine_item_4'.png3x,
            fit: BoxFit.fill,
          )),
          child: VerticalGridView(
            spacing: 5.w,
            mainHeight: 64.w,
            padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 30.w),
            widgetBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 30.w,
                    height: 30.w,
                    child: Image(image: 'mine_item_4_$index'.png3x),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  BaseText(
                    text: titleName[index],
                    fontSize: 12.sp,
                    color: Color(0xff333333),
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Color(0xff333333),
                        fontFamily: "PingFang",
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ).withOnTap(onTap: () {
                if (index == 0) {
                  Get.to(() => Login_settingPage());
                }
                if (index == 1) {
                  Get.to(() => Zz_settingPage());
                  // Get.to(Login_settingPage());
                }
                if (index == 2) {
                  Get.to(() => Pay_settingPage());
                }
                if (index == 3) {
                  Get.to(() => Phone_settingPage());
                }
              });
            },
            itemCount: titleName.length,
          ),
        ),
        Positioned(
            top: 10.h,
            left: 10.h,
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.aqzxPage);
              },
              child: Container(
                height: 40.h,
                width: screenWidth,
              ),
            ))
      ],
    );
  }
}
