import 'package:abc/pages/tabs/mine/login_setting/child/mima/view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'child/ssdl/view.dart';
import 'login_setting_logic.dart';
import 'login_setting_state.dart';

class Login_settingPage extends BaseStateless {
  Login_settingPage({Key? key}) : super(key: key, title: '登录设置');

  final Login_settingLogic logic = Get.put(Login_settingLogic());
  final Login_settingState state = Get.find<Login_settingLogic>().state;

  bool value = false;
  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1125, designHeight: 1998, deviceWidth: screenWidth);
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(
              image: 'bg_login_setting'.png3x,
              width: screenWidth,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              right: 15,
              top: position.getY(305),
              child: Obx(() => Container(
                    color: Colors.white,
                    child: CupertinoSwitch(
                      value: logic.fanzhuan.value,
                      onChanged: (bool value) {
                        logic.fanzhuan.value = value;
                      },
                      // activeColor: Color(0xFF00C3AB),
                    ),
                  )),
            ),

            Positioned(
              right: 15,
              top: position.getY(465),
              child: Obx(() => Container(
                height: position.getY(115),
                alignment: Alignment.center,
                color: Colors.white,
                child: CupertinoSwitch(
                  value: logic.face.value,
                  onChanged: (bool value) {
                    logic.face.value = value;
                  },
                ),
              )),
            ),

            StackPositionWidget(
                    stackPosition: position,
                    designX: 0,
                    designY: 0,
                    designWidth: 1125,
                    designHeight: 159)
                .build(onTap: () {
              Get.to(MmzfPage());
            }),
            StackPositionWidget(
                    stackPosition: position,
                    designX: 0,
                    designY: 594,
                    designWidth: 1125,
                    designHeight: 590)
                .build(onTap: () {
                  Get.to(SsdlPage());
            }),
            StackPositionWidget(
                    stackPosition: position,
                    designX: 0,
                    designY: 726,
                    designWidth: 1125,
                    designHeight: 590)
                .build(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '微信登录',
                'image': 'wx',
                'top': 0,
                'right': true
              });
            })
          ],
        )
      ],
    );
  }
}
