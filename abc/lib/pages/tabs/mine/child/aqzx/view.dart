import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_setting/transfer_setting_view.dart';
import 'package:abc/pages/tabs/mine/login_setting/login_setting_view.dart';
import 'package:abc/pages/tabs/mine/pay_setting/children/xegl/view.dart';
import 'package:abc/pages/tabs/mine/pay_setting/pay_setting_view.dart';
import 'package:abc/pages/tabs/mine/phone_setting/phone_setting_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class AqzxPage extends BaseStateless {
  AqzxPage({Key? key}) : super(key: key);

  final AqzxLogic logic = Get.put(AqzxLogic());
  final AqzxState state = Get.find<AqzxLogic>().state;



  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => Text(
    '安全中心',
    style: TextStyle(color: Colors.white, fontSize: 17.sp),
  );

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
      Image(
          width: 22.w,
          height: 22.w,
          image: ('go_back').png3x,
          color: Colors.white)
          .withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'icon_search'.png3x,
      width: 22.w,
      height: 22.w,
      color: Colors.white,
    ).withOnTap(onTap: () {
      Get.toNamed(
        Routes.detailSearchPage,
      );
    }).withPadding(
      right: 12.w,
    ),
  ];

  @override
  double? get lefItemWidth => 80.w;



  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 3240, designHeight: 7125, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Image(image: 'aqzx'.png, width: screenWidth, fit: BoxFit.fitWidth,),
              StackPositionGridWidget.grid4x4(stackPosition: position, x: 0, y: 2125, itemCount: 4, bottomMargin: 4272, onItemTap: (index) {
                if (index == 0) {
                  Get.to(Login_settingPage());
                }
                else if (index == 1) {
                  Get.to(Transfer_settingPage());
                }
                else if (index == 2) {
                  Get.to(Pay_settingPage());
                }
                else if (index == 3) {
                  Get.to(Phone_settingPage());
                }
              }).build(),
              StackPositionGridWidget.custom(stackPosition: position, x: 0, y: 3980, itemCount: 6, bottomMargin: 0, crossCount: 1, onItemTap: (index) {
                if (index == 0) {
                }
                else if (index == 1) {
                  Get.to(XeglPage());
                }
                else if (index == 2) {
                }
                else if (index == 3) {
                }
              }).build(),
            ],
          )
      ),
    );
  }
}
