import 'package:abc/pages/register/state.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../utils/long_press_five_seconds.dart';
import '../tabs/other/sheet_widget/sheet_bottom.dart';
import 'alternative_routes_widget.dart';
import 'logic.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final RegisterLogic logic = Get.put(RegisterLogic());
  final RegisterState state = Get.find<RegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: registerWidget(),
    );
  }


  /// 注册
  registerWidget() {
    double realDesignHeight = 3240/screenWidth * screenHeight;

    StackPosition position = StackPosition(
        designWidth: 3240, designHeight: realDesignHeight, deviceWidth: screenWidth);

    return Container(
      width: screenWidth,
      height: screenHeight,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image(
              image: "register".png3x, fit: BoxFit.fitWidth, width: screenWidth,),
            Positioned(
              top: position.getY(1380),
              left: position.getX(120),
              child: Container(
                width: screenWidth - position.getX(180), // 设置容器宽度
                child: TextField(
                  controller: state.phoneTextController,
                  cursorColor: Color(0xff333333),
                  style: TextStyle(
                    fontSize: 18.sp, // 可选：调整字体大小
                    fontFamily: "MiSans",
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none, // 隐藏边框
                    hintText: '请输入手机号',
                    hintStyle: TextStyle(
                        color: Color(0xff999999),
                        // 设置提示文字颜色
                        fontSize: 18.sp,
                        // 可选：调整字体大小
                        fontFamily: "PingFang",
                        fontWeight: FontWeight.w500,
                        height: 1
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Positioned(
              top: position.getY(2200),
              left: position.getX(120),
              child: Obx(() {
                return InkWell(
                  onTap: () {
                    state.protocolPersonal.value = !state.protocolPersonal.value;
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    child: Image(
                      image:
                      state.protocolPersonal.value == false ? 'login_unsel'.png : 'login_sel'.png
                      , width: position.getY(120),),
                  ),
                );
              }),
            ),
            Positioned(
              top: position.getY(2580),
              left: position.getX(120),
              child: Obx(() {
                return InkWell(
                  onTap: () {
                    state.protocolCustom.value = !state.protocolCustom.value;
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    child: Image(
                        image:
                        state.protocolCustom.value == false ? 'login_unsel'.png : 'login_sel'.png
                        ,
                        width: position.getY(120)),
                  ),
                );
              }),
            ),

            Positioned(
              top: position.getY(3086),
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

            ),

            LongPressFiveSeconds(duration: const Duration(seconds: 3),child: Container(
              width: 1.sw,
              height: 100.w,
            ), onLongPressCompleted: (){
              SheetBottom.show(
                  title: '选择路线',
                  child: AlternativeRoutesWidget(),
              );
            }),


          ],
        ),
      ),
    );
  }
}
