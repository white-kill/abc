import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/app_config.dart';
import '../../../../utils/abc_button.dart';
import 'mine_info_logic.dart';
import 'mine_info_state.dart';

class MineInfoPage extends BaseStateless {
  MineInfoPage({Key? key}) : super(key: key, title: '客户信息');

  final MineInfoLogic logic = Get.put(MineInfoLogic());
  final MineInfoState state = Get.find<MineInfoLogic>().state;



  String value1(int index) {
    if (index == 0) {
      return AppConfig.config.abcLogic.memberInfo.realName.removeFirstChar1();
    }
    if (index == 1) {
      return AppConfig.config.abcLogic.memberInfo.sex == "1" ? '男' : '女';
    }
    if (index == 2) {
      return '中国';
    }
    if (index == 3) {
      return '居民身份证';
    }
    if (index == 4) {
      return AppConfig.config.abcLogic.memberInfo.idCard.maskBankCardNumber1();
    }
    if (index == 5) {
      print(AppConfig.config.abcLogic.memberInfo.certificateBeginTime);
      return AppConfig.config.abcLogic.memberInfo.certificateBeginTime;
    }
    if (index == 6) {
      if (AppConfig.config.abcLogic.memberInfo.certificateEndTime ==
          '2099-12-31') {
        return '长期';
      } else {
        return AppConfig.config.abcLogic.memberInfo.certificateEndTime;
      }
    }
    if (index == 7) {
      return AppConfig.config.abcLogic.memberInfo.phone.desensitize1();
    }
    if (index == 8) {
      return '';
    }
    if (index == 9) {
      return '区号';
    }
    return '';
  }


  @override
  Widget initBody(BuildContext context) {
    StackPosition position1 = StackPosition(
        designWidth: 3870, designHeight: 4938, deviceWidth: screenWidth);
    StackPosition position2 = StackPosition(
        designWidth: 1290, designHeight: 1659, deviceWidth: screenWidth);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image(image: 'mine_info_1'.png, width: screenWidth,),
              Positioned(
                top: position1.getY(265),
                left: position1.getX(580),
                child: replaceRangeWithImages(value1(0),
                    fontSize: position1.getX(150),
                    startIndex: 0, length: 1, color: Color(0xff333333)),
              ),
              Positioned(
                top: position1.getY(730),
                left: position1.getX(580),
                child: replaceRangeWithImages(value1(1),
                    fontSize: position1.getX(150),

                    startIndex: 0, length: 0, color: Color(0xff51B297)),
              ),
              Positioned(
                top: position1.getY(2120),
                left: position1.getX(900),
                child: replaceRangeWithImages(value1(4),
                    fontSize: position1.getX(150),
                    startIndex: 5,
                    length: 11,
                    color: Color(0xff333333),
                    bottomPadding: 7.w),
              ),
              Positioned(
                top: position1.getY(2588),
                left: position1.getX(1198),
                child:
                replaceRangeWithImages(value1(5),
                    fontSize: position1.getX(150),

                    startIndex: 5,
                    length: 2,
                    color: Color(0xff333333),
                    bottomPadding: 7.w),
              ),
              Positioned(
                top: position1.getY(3055),
                left: position1.getX(1198),
                child: value1(6) == "长期"
                    ? replaceRangeWithImages("长期",
                    fontSize: position1.getX(150),

                    startIndex: 0,
                    length: 0,
                    color: Color(0xff333333),
                    bottomPadding: 7.w)
                    : replaceRangeWithImages(value1(6),
                    fontSize: position1.getX(150),

                    startIndex: 5,
                    length: 2,
                    color: Color(0xff333333),
                    bottomPadding: 7.w),
              ),
              Positioned(
                top: position1.getY(3517),
                left: position1.getX(900),
                child: replaceRangeWithImages(value1(7),
                    fontSize: position1.getX(150),

                    startIndex: 3,
                    length: 5,
                    color: Color(0xff333333),
                    bottomPadding: 7.w),
              ),
              Positioned(
                top: position1.getY(3837),
                left: position1.getX(612),
                child: Container(
                  width: 200,
                  height: position1.getX(460),
                  child: CleanTextField.email(controller: logic.emailCtrl, textStyle: TextStyle(
                    fontSize: position1.getX(150),

                  ),),
                ),
              ),
              Positioned(
                top: position1.getY(4304),
                left: position1.getX(1100),
                child: Container(
                  width: position1.getX(700),
                  height: position1.getX(460),
                  child: CleanTextField.number(controller: logic.areCodeCtrl, maxLength: 4, textStyle: TextStyle(
                    fontSize: position1.getX(150),

                  ),),
                ),
              ),
              Positioned(
                top: position1.getY(4304),
                left: position1.getX(2051),
                child: Container(
                  width: position1.getX(700),
                  height: position1.getX(460),
                  child: CleanTextField.number(controller: logic.callCodeCtrl, maxLength: 8,  textStyle: TextStyle(
                    fontSize: position1.getX(150),

                  ),),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Image(image: 'mine_info_2'.png, width: screenWidth,),
              Positioned(
                top: position2.getY(109),
                left: position2.getX(58),
                child: Container(
                  width: position2.getX(280),
                  height: position2.getX(156),
                  child: CleanTextField.text(controller: logic.provinceCtrl, textAlign: TextAlign.center, textStyle: TextStyle(color: Colors.grey),),
                ),
              ),
              Positioned(
                top: position2.getY(109),
                left: position2.getX(432),
                child: Container(
                  width: position2.getX(280),
                  height: position2.getX(156),
                  child: CleanTextField.text(controller: logic.cityCtrl, textAlign: TextAlign.center, textStyle: TextStyle(color: Colors.grey),),
                ),
              ),
              Positioned(
                top: position2.getY(109),
                left: position2.getX(848),
                child: Container(
                  width: position2.getX(280),
                  height: position2.getX(156),
                  child: CleanTextField.text(controller: logic.countryCtrl, textAlign: TextAlign.center, textStyle: TextStyle(color: Colors.grey),),
                ),
              ),
              // Positioned(
              //   top: position2.getY(273),
              //   left: position2.getX(70),
              //   child: Container(
              //     child: Text("自行编辑", style: TextStyle(
              //       fontSize: 12.sp,
              //       color: Color(0xff51B297),
              //       fontFamily: "PingFang",
              //       fontWeight: FontWeight.w500
              //     ),)
              //   ),
              // ),
              Positioned(
                top: position2.getY(273),
                left: position2.getX(70),
                child: Container(
                  width: screenWidth - 50,
                  height: position2.getX(156),
                  child: CleanTextField.text(controller: logic.detailPlaceCtrl, maxLines: 2, textAlign: TextAlign.start, textStyle: TextStyle(color:Color(0xff51B297), fontSize: 12.sp), ),
                ),
              ),
              Positioned(
                top: position2.getY(421),
                left: position2.getX(343),
                child: Container(
                  width: screenWidth - 100,
                  height: position2.getX(156),
                  child: CleanTextField.number(controller: logic.posCodeCtrl, textAlign: TextAlign.start, maxLength: 6, textStyle: TextStyle(color:Color(0xff51B297),),),
                ),
              ),
              Positioned(
                top: position2.getY(1347),
                left: 0,
                child: Container(
                  width: screenWidth,
                  height: position2.getX(153),
                ).withOnTap(onTap: () {
                  logic.saveValue();
                }),
              ),

            ],
          )
        ],
      ),
    );

  }

  /// 将字符串指定范围的字符替换为图片
  /// [text] 原始字符串
  /// [startIndex] 开始替换的位置（从0开始）
  /// [length] 要替换的字符数量
  /// [color] 文字和图片颜色
  /// [fontSize] 文字大小
  /// [textAlign] 文本对齐方式
  /// [maxLines] 最大行数
  Widget replaceRangeWithImages(
    String text, {
    required int startIndex,
    required int length,
    double? bottomPadding,
    Color color = Colors.black,
    double? fontSize,
    TextAlign textAlign = TextAlign.left,
    double? height,
  }) {
    // 安全判断
    if (text.isEmpty ||
        startIndex < 0 ||
        length <= 0 ||
        startIndex >= text.length) {
      return Text(
        text,
        style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            color: color,
            height: height ?? 1.0,
            fontFamily: "PingFang"),
        strutStyle: StrutStyle(forceStrutHeight: true),
        textAlign: textAlign,
      );
    }

    // 计算实际结束位置，确保不超过字符串长度
    int endIndex = startIndex + length - 1;
    if (endIndex >= text.length) {
      endIndex = text.length - 1;
    }

    final widgets = <Widget>[];

    // 前面不需要替换的部分
    if (startIndex > 0) {
      widgets.add(Text(
        text.substring(0, startIndex),

        style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            color: color,
            height: height ?? 1.0,
            fontFamily: "PingFang"),
        strutStyle: StrutStyle(forceStrutHeight: true),
      ));
    }

    // 中间需要替换为图片的部分
    for (int i = startIndex; i <= endIndex; i++) {
      widgets.add(Container(
        margin: EdgeInsets.only(
            left: 0.5.w, right: 0.5.w, bottom: bottomPadding ?? 0),
        child: Image(
          image: 'mine_info_dot'.png,
          width: 4.w,
          height: 4.w,
          color: color,
        ),
      ));
    }

    // 后面不需要替换的部分
    if (endIndex < text.length - 1) {
      widgets.add(Text(
        text.substring(endIndex + 1),
        style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            color: color,
            height: height ?? 1.0,
            fontFamily: "PingFang",
        ),
        strutStyle: StrutStyle(forceStrutHeight: true),

      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: textAlign == TextAlign.center
          ? MainAxisAlignment.center
          : textAlign == TextAlign.right
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widgets,
    );
  }
}
