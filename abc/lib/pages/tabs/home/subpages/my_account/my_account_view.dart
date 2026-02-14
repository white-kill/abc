import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/account_car_info/account_car_info_view.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/code_widget.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/right_widget.dart';
import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'my_account_logic.dart';
import 'my_account_state.dart';

class MyAccountPage extends BaseStateless {
  MyAccountPage({Key? key}) : super(key: key, title: '我的账户');

  final MyAccountLogic logic = Get.put(MyAccountLogic());
  final MyAccountState state = Get.find<MyAccountLogic>().state;

  @override
  Widget? get titleWidget => Text(
        '我的账户',
        style: TextStyle(color: Colors.black, fontSize: 17.sp),
      );

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
  double? get lefItemWidth => 80.w;

  @override
  List<Widget>? get rightAction => [
        RightWidget(),
      ];


  @override
  Color? get background => Color(0xFFF7F7F7);
  @override
  Widget initBody(BuildContext context) {
    StackPosition position2 = StackPosition(
        designWidth: 3870, designHeight: 2406, deviceWidth: screenWidth);

    return ListView(
      // color: Color(0xFFF7F7F7),
      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '快捷支付',
                  'imageList': ["yjbk_1", 'yjbk_2'],
                  'top': 0,
                  'background': Colors.white,
                  'right': true
                });
              },
              child: Image(
                image: 'my_account_1'.png,
                width: screenWidth,
              ),
            ),
            Stack(
              children: [
                Image(
                  image: 'my_account_2'.png,
                  width: screenWidth,
                ),
                Positioned(
                  left: position2.getX(680),
                  top: position2.getY(745),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: AppConfig.config.abcLogic.card().substring(0,4),
                        color: Color(0xff333333),
                        fontSize: 20.sp,
                        style: TextStyle(
                            fontSize: 19.w,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang',
                            height: 1),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image(image: 'my_account_dot'.png, width: position2.getX(320), fit: BoxFit.fitWidth,),
                            SizedBox(width: 3,),
                          ],
                        ),
                      ),


                      BaseText(
                        text: AppConfig.config.abcLogic.card().substring(AppConfig.config.abcLogic.card().length - 4),
                        color: Color(0xff333333),
                        fontSize: 20.sp,
                        style: TextStyle(
                            fontSize: 19.w,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang',
                            height: 1),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: position2.getX(1580),
                  top: position2.getY(1240),
                  child: BaseText(
                    text: AppConfig.config.abcLogic.balance(),
                    style: TextStyle(
                        fontSize: 21.w,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'MiSans',
                        height: 1),
                  ),
                ),
                StackPositionWidget(
                    stackPosition: position2,
                    designX: 2062,
                    designY: 735,
                    designWidth: 326,
                    designHeight: 154)
                    .build(onTap: () {
                  showModalBottomSheet(
                    context: context ?? Get.context!,
                    builder: (context) {
                      return Container(
                        width: 1.sw,
                        height: 200.w,
                        decoration: decorationImage('ic_ckkh'),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container().withOnTap(onTap: () {
                                            Get.back();
                                            AlterWidget.alterWidget(builder: (context) {
                                              return CodeWidget();
                                            });
                                          })),
                                      Expanded(
                                          child: Container().withOnTap(onTap: () {
                                            Get.back();
                                          })),
                                    ],
                                  ),
                                )),
                            Container(
                              height: 60.w,
                            ).withOnTap(onTap: () {
                              Get.back();
                            })
                          ],
                        ),
                      );
                    },
                  );
                }),
                StackPositionWidget(
                    stackPosition: position2,
                    designX: 3096,
                    designY: 1484,
                    designWidth: 682,
                    designHeight: 270)
                    .build(onTap: () {
                  Get.to(() => Account_car_infoPage());
                }),
                StackPositionWidget(
                    stackPosition: position2,
                    designX: 140,
                    designY: 1835,
                    designWidth: 1180,
                    designHeight: 430)
                    .build(onTap: () {
                  logic.jumpPage('查询明细');
                }),
                StackPositionWidget(
                    stackPosition: position2,
                    designX: 1320,
                    designY: 1835,
                    designWidth: 1180,
                    designHeight: 430)
                    .build(onTap: () {
                  logic.jumpPage('我要转账');
                }),
                StackPositionWidget(
                    stackPosition: position2,
                    designX: 2500,
                    designY: 1835,
                    designWidth: 1180,
                    designHeight: 430)
                    .build(onTap: () {
                  logic.jumpPage('我要理财');
                }),

                Positioned(
                    top: position2.getY(740),
                    right: position2.getX(320),
                    child: Row(
                      children: [
                        Obx(() {
                          return Text(
                            logic.alias.value,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black,
                                fontFamily: 'PingFang'),
                          );
                        }),
                        SizedBox(
                          width: position2.getX(180),
                          height: 20,
                        ),
                      ],
                    ).withOnTap(onTap: () {
                      StackPosition alterPosition = StackPosition(
                          designWidth: 3554,
                          designHeight: 2305,
                          deviceWidth: screenWidth - 50);
                      AlterWidget.alterWidget(builder: (context) {
                        TextEditingController textCtrl = TextEditingController(text: logic.alias.value == "设置别名"? "":logic.alias.value);
                        return Stack(
                          children: [
                            Image(
                              image: 'alias_name'.png,
                              width: screenWidth - 50,
                              fit: BoxFit.fitWidth,
                            ),
                            StackPositionGridWidget.grid4x4(
                                stackPosition: alterPosition,
                                itemCount: 4,
                                x: 0,
                                y: 1300,
                                bottomMargin: 687,
                                onItemTap: (index) {
                                  if (index == 0) {
                                    textCtrl.text = "工资卡";
                                  }
                                  else if (index == 1) {
                                    textCtrl.text = "日常生活";
                                  }
                                  else if (index == 2) {
                                    textCtrl.text = "房租卡";
                                  }
                                  else if (index == 3) {
                                    textCtrl.text = "消费卡";
                                  }
                                }
                            ).build(),

                            Positioned(
                                left: 15,
                                top: alterPosition.getY(700),
                                child: Container(
                                  width: screenWidth - 60,
                                  height: alterPosition.getY(472),
                                  child: CleanTextField.text(
                                    controller: textCtrl,),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: Container(
                                  width: alterPosition.getX(1763),
                                  height: alterPosition.getY(465),
                                ).withOnTap(onTap: () {
                                  SmartDialog.dismiss();
                                })),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: alterPosition.getX(1763),
                                  height: alterPosition.getY(465),
                                ).withOnTap(onTap: () {
                                  if (textCtrl.text.isNotEmpty) {
                                    textCtrl.text.saveBankAlias;
                                    logic.alias.value = textCtrl.text;
                                  }
                                  else {
                                    "设置别名".saveBankAlias;
                                    logic.alias.value = "设置别名";
                                  }
                                  SmartDialog.dismiss();
                                })),
                          ],
                        );
                      });
                    }))



              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.changeNavi, arguments: {
                  'title': '信用卡申请',
                  'image': 'xykshenqing',
                  'offset': true,
                  'defTitleColor': Colors.black,
                });
              },
              child: Image(
                image: 'my_account_3'.png,
                width: screenWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.sp),
              padding: EdgeInsets.only(
                  left: position2.getX(125), right: position2.getX(125)),
              child: Image(
                image: 'my_account_btn'.png,
              ).withOnTap(onTap: () {
                Get.toNamed(Routes.changeNavi, arguments: {
                  'title': '电子账户申请',
                  'image': 'dianzi_account',
                  'offset': true,
                  'defTitleColor': Colors.black,
                });
              }),
            )
          ],
        )
      ],
    );
  }
}
