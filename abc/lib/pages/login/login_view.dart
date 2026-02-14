import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:abc/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../utils/clean_text_field.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, appBar: null, body: loginWidget());
    // return Scaffold(
    //   body: Container(
    //       color: Colors.white,
    //       child: Stack(children: [
    //         Positioned(
    //           top: ScreenUtil().statusBarHeight,
    //           left: 1.sw / 2 - 58.w / 2,
    //           child: Image(
    //               width: 61.w, height: 61.w, image: 'login_head_holder'.png3x),
    //         ),
    //         Positioned(
    //           top: 110 + ScreenUtil().statusBarHeight, // 调整垂直位置
    //           left: 20.w, // 调整水平位置
    //           right: 20.w,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               TextField(
    //                 controller: state.phoneTextController,
    //                 decoration: InputDecoration(
    //                   border: InputBorder.none, // 隐藏边框
    //                   hintText: '请输入手机号',
    //                   hintStyle: TextStyle(
    //                     color: Color(0xff999999), // 设置提示文字颜色
    //                     fontSize: 16.0, // 可选：调整字体大小
    //                   ),
    //                   contentPadding: EdgeInsets.zero,
    //                 ),
    //               ),
    //               Divider(
    //                 color: Color(0x668C8C8C),
    //                 height: 1,
    //                 thickness: 1,
    //               ),
    //
    //               SizedBox(
    //                 height: 15.w,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Expanded(
    //                     child: TextField(
    //                       controller: state.psdTextController,
    //                       obscureText: true,
    //                       decoration: InputDecoration(
    //                         border: InputBorder.none, // 隐藏边框
    //                         hintText: '请输入登录密码',
    //                         hintStyle: TextStyle(
    //                           color: Color(0xff676767), // 设置提示文字颜色
    //                           fontSize: 16.0, // 可选：调整字体大小
    //                         ),
    //                         contentPadding: EdgeInsets.zero,
    //                       ),
    //                     ),
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       // 处理忘记密码点击事件
    //                       print('点击了忘记密码');
    //                     },
    //                     child: Text(
    //                       '忘记密码？',
    //                       style: TextStyle(
    //                         color: Color(0xff676767),
    //                         fontSize: 15.sp,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Divider(
    //                 color: Color(0x668C8C8C),
    //                 height: 1,
    //                 thickness: 1,
    //               ),
    //               SizedBox(height: 40.w), // 调整下划线与输入框之间的间距
    //               // 添加登录按钮
    //               SizedBox(
    //                 width: double.infinity, // 使按钮宽度和下划线一样长
    //                 height: 44.w,
    //                 child: ElevatedButton(
    //                   style: ButtonStyle(
    //                     backgroundColor:
    //                         WidgetStateProperty.all<Color>(Color(0xffFFA801)),
    //                     elevation: WidgetStateProperty.all(0),
    //                   ),
    //                   onPressed: () {
    //                     // 处理登录点击事件
    //                     print('点击了登录按钮');
    //                     logic.goLogin();
    //                   },
    //                   child: Text('登录'),
    //                 ),
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 25.w)),
    //               SizedBox(
    //                   width: double.infinity, // 使按钮宽度和下划线一样长
    //                   height: 20.w,
    //                   child: Text(
    //                     textAlign: TextAlign.center,
    //                     "切换登录方式  ｜  登录帮助",
    //                     style: TextStyle(
    //                         color: Color(0xff6B6B6B), fontSize: 15.sp),
    //                   )), // 调整按钮与其他内容之间的间距
    //             ],
    //           ),
    //         ),
    //       ])),
    // );
  }

  loginWidget() {
    StackPosition position = StackPosition(
        designWidth: 3240, designHeight: 7125, deviceWidth: screenWidth);

    return Container(
      width: screenWidth,
      height: screenHeight,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image(
              image: "login".png3x,
              fit: BoxFit.fitWidth,
              width: screenWidth,
            ),
            StackPositionWidget(
              stackPosition: position,
              designX: 95,
              designY: 320,
              designWidth: 200,
              designHeight: 200,
            ).build(
                onTap: () {
                  Get.back();
                }),
            Positioned(
              top: position.getY(1690),
              right: position.getX(1932),
              child: Text(
                logic.account.substring(0, 3),
                style: TextStyle(
                    fontSize: 18.sp, // 可选：调整字体大小
                    fontFamily: "MiSans",
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: Color(0xFF333333)),
              ),
            ),
            Positioned(
              top: position.getY(1690),
              left: position.getX(1763),
              child: Text(
                logic.account.substring(logic.account.length - 3),
                style: TextStyle(
                    fontSize: 18.sp, // 可选：调整字体大小
                    fontFamily: "MiSans",
                    fontWeight: FontWeight.w500,
                    height: 1,
                    color: Color(0xFF333333)),
              ),
            ),

            Positioned(
              top: position.getY(2680),
              left: position.getX(160),
              child: Container(
                width: screenWidth - position.getX(180), // 设置容器宽度
                child: CleanTextField.password(
                controller: state.psdTextController,
                  cursorColor: Color(0xff333333),
                  inputFormatters: [
                  PasswordInputFormatter(onTextChanged: (String str) {
                    logic.pwd = str;
                  })
                ],
                obscuringCharacter: "•",
                textStyle: TextStyle(
                    fontSize: 25.sp, // 可选：调整字体大小
                    fontWeight: FontWeight.w400,
                    color: Color(0xff333333),
                    height: 1,
                    letterSpacing: -0.5),
                  hintText: '请输入登录密码',
                  hintStyle: TextStyle(
                      color: Color(0xff999999),
                      // 设置提示文字颜色
                      fontSize: 15.sp,
                      // 可选：调整字体大小
                      fontFamily: "PingFang",
                      fontWeight: FontWeight.w500,
                      height: 1,
                      letterSpacing: 0),
              ),
              ),
            ),

            Positioned(
              top: position.getY(3260),
              left: position.getX(120),
              child: InkWell(
                onTap: () {
                  logic.goLogin();
                },
                child: Container(
                  width: screenWidth - position.getX(240),
                  height: position.getX(359),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
