import 'package:abc/config/app_config.dart';
import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'logic.dart';
import 'state.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';

class ZfmmxgPage extends BaseStateless {
  ZfmmxgPage({Key? key}) : super(key: key, title: "支付密码修改");

  final ZfmmxgLogic logic = Get.put(ZfmmxgLogic());
  final ZfmmxgState state = Get.find<ZfmmxgLogic>().state;

  @override
  Widget? get leftItem => Row(
        children: [
          SizedBox(width: 15.w),
          Image(
                  width: 22.w,
                  height: 22.w,
                  image: ('go_back').png3x,
                  color: Colors.black)
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
        _customWidget('kefu', '客服').withOnTap(onTap: () {
          Get.to(() => CustomerPage());
        }),
      ];

  Widget _customWidget(String imgName, String title) {
    return Column(
      children: [
        SizedBox(height: 12.w),
        Image(
          width: 22.w,
          height: 22.w,
          image: imgName.png3x,
          color: Colors.black,
        ),
      ],
    ).paddingOnly(right: 15.w);
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1293, designHeight: 2503, deviceWidth: screenWidth);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'zfmmxg'.png, width: screenWidth, fit: BoxFit.fitWidth,),

            Positioned(
              right: position.getX(100),
              top: position.getY(80),
              child: BaseText(
                  text: AppConfig.config.abcLogic.card(), fontSize: 16.sp),
            ),
            Positioned(
                right: position.getY(50),
                top: position.getY(200),
                child: Container(
                  width: position.getY(888),
                  height: position.getY(138),
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  child: CleanTextField.password(
                    textAlign: TextAlign.right,
                    inputFormatters: [PasswordInputFormatter()],
                    hintText: "请输入支付密码",
                    obscuringCharacter: "•",
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "PingFang",
                        color: Colors.grey.withOpacity(0.7),
                        letterSpacing: 0
                        // height: 1.2
                    ),
                    textStyle: TextStyle(
                      fontSize: 17.sp,
                      letterSpacing: 2,
                      fontFamily: "PingFang",
                        color: Color(0xFF333333),

                        height: 1.0
                    ),
                  ),
                )),
            Positioned(
                right: position.getY(50),
                top: position.getY(348),
                child: Container(
                  width: position.getY(888),
                  height: position.getY(138),
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  child: CleanTextField.password(
                    textAlign: TextAlign.right,
                    hintText: "请输入新密码",
                    inputFormatters: [PasswordInputFormatter()],

                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "PingFang",
                        color: Colors.grey.withOpacity(0.7),
                        letterSpacing: 0
                      // height: 1.2
                    ),
                    textStyle: TextStyle(
                        fontSize: 17.sp,
                        letterSpacing: 2,
                        fontFamily: "PingFang",
                        color: Color(0xFF333333),

                        height: 1.0
                    ),
                  ),
                )),
            Positioned(
                right: position.getY(50),
                top: position.getY(504),
                child: Container(
                  width: position.getY(888),
                  height: position.getY(138),
                  color: Colors.white,
                  alignment: Alignment.centerRight,
                  child: CleanTextField.password(
                    textAlign: TextAlign.right,
                    hintText: "请再次输入密码",
                    inputFormatters: [PasswordInputFormatter()],
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "PingFang",
                        color: Colors.grey.withOpacity(0.7),
                        letterSpacing: 0
                      // height: 1.2
                    ),
                    textStyle: TextStyle(
                        fontSize: 17.sp,
                        letterSpacing: 2,
                        color: Color(0xFF333333),
                        fontFamily: "PingFang",
                        height: 1.0
                    ),
                  ),
                )),
            // Positioned(
            //     right: position.getX(100),
            //     top: position.getY(200),
            //     child: CleanTextField.password()),
            // Positioned(
            //     right: position.getX(100),
            //     top: position.getY(200),
            //     child: CleanTextField.password()),
          ],
        )
      ],
    );
  }
}
