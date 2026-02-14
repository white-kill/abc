import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/change_password/change_password_view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/pos/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/zfmmxg/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/state.dart';
import 'package:abc/pages/tabs/mine/pay_setting/pay_setting_view.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../../../utils/widget_util.dart';
import '../../../../home/subpages/my_account/code_widget.dart';
import 'children/dkzzxe/view.dart';
import 'children/dxtz/view.dart';
import 'children/jjkgs/view.dart';
import 'children/jjkjb/view.dart';
import 'children/jjkyc/view.dart';
import 'children/kjzfjy/view.dart';
import 'children/qkxe/view.dart';
import 'children/szmrzh/view.dart';
import 'children/wkzfxe/view.dart';
import 'children/xemmzf/view.dart';
import 'logic.dart';

class YhkglDetailPage extends BaseStateless {
  YhkglDetailPage({Key? key}) : super(key: key, title: "银行卡管理");

  final YhkglDetailLogic logic = Get.put(YhkglDetailLogic());
  final YhkglDetailState state = Get
      .find<YhkglDetailLogic>()
      .state;

  @override
  Widget? get leftItem =>
      Row(
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
  List<Widget>? get rightAction =>
      [
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
        designWidth: 3240, designHeight: 2538, deviceWidth: screenWidth);
    StackPosition position2 = StackPosition(
        designWidth: 3240, designHeight: 4707, deviceWidth: screenWidth);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        GetBuilder<YhkglDetailLogic>(builder: (logic) {
          return Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: position.getY(2538),
                child: Image(
                  image: 'yhkgl_detail_1'.png,
                  width: screenWidth,
                  fit: BoxFit.fitWidth,
                ),
              ),


              Positioned(
                  left: position.getX(646),
                  top: position.getY(750),
                  child: logic.showCard
                      ? Row(
                    children: [
                      BaseText(
                        text: AppConfig.config.abcLogic.card1(),
                        color: Color(0xff333333),
                        fontSize: 20.sp,
                        style: TextStyle(
                            fontSize: 19.w,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang',
                            height: 1),
                      ),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: AppConfig.config.abcLogic
                            .card()
                            .substring(0, 4),
                        color: Color(0xff333333),
                        fontSize: 20.sp,
                        style: TextStyle(
                            fontSize: 19.w,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang',
                            height: 1),
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Image(
                              image: 'my_account_dot'.png,
                              width: position.getX(362),
                              fit: BoxFit.fitWidth,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                          ],
                        ),
                      ),
                      BaseText(
                        text: AppConfig.config.abcLogic.card().substring(
                            AppConfig.config.abcLogic
                                .card()
                                .length - 4),
                        color: Color(0xff333333),
                        fontSize: 20.sp,
                        style: TextStyle(
                            fontSize: 19.w,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang',
                            height: 1),
                      ),
                    ],
                  )),
              logic.showCard == false
                  ? Positioned(
                  left: position.getX(2000),
                  top: position.getY(800),
                  child: Image(
                    image: 'yhkgl_eye'.png,
                    width: position.getY(150),
                  ).withOnTap(onTap: () {
                    // logic.showCard = true;
                    // logic.update();
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
                  }))
                  : const SizedBox.shrink(),
              logic.showCard == true
                  ? Positioned(
                  left: position.getX(2580),
                  top: position.getY(580),
                  child: Image(
                    image: 'yhk_copy'.png,
                    width: position.getY(550),
                    fit: BoxFit.fitWidth,
                  ).withOnTap(onTap: () {
                    Clipboard.setData(ClipboardData(
                        text: AppConfig.config.abcLogic.card1()));
                  }))
                  : const SizedBox.shrink(),
              StackPositionGridWidget.custom(
                  stackPosition: position2,
                  x: 133,
                  y: 1573,
                  crossCount: 4,
                  itemCount: 4,
                  onItemTap: (int index) {
                    if (index == 0) {
                      Get.to(DxtzPage());
                    } else if (index == 1) {
                      Get.to(JjkgsPage());
                    } else if (index == 2) {
                      Get.to(XemmzfPage());
                    } else if (index == 3) {
                      AlterWidget.alterWidget(builder: (context) {
                        return Image(
                          image: 'mmjs'.png,
                          width: screenWidth - 50,
                        ).withOnTap(onTap: () {
                          SmartDialog.dismiss();
                        });
                      });
                    }
                  }).build(),
              Positioned(
                  top: position.getY(315),
                  right: position.getX(225),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          logic.alias.value,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontFamily: 'PingFang'),
                        );
                      }),
                      SizedBox(
                        width: position.getX(200),
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
                  })),

              /// 支付密码修改
              StackPositionWidget(stackPosition: position, designX: 1619, designY: 1117, designWidth: 1479, designHeight: 311).build(onTap: () {
                Get.to(ZfmmxgPage());
              }),
              

              Positioned(top: 130.w,left: 20.w,child: Container(
                height: 40.w,
                width: 1.sw/2 ,
              ).withOnTap(onTap: (){
                // Get.toNamed(Routes.myAccountPage);
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '快捷支付',
                  'imageList': ["yjbk_1", 'yjbk_2'],
                  'top': 0,
                  'background': Colors.white,
                  'right': true
                });
              })),

            ],
          );
        }),
        Stack(
          children: [
            Image(image: 'yhkgl_detail_2'.png),
            StackPositionGridWidget.custom(
                stackPosition: position2,
                x: 0,
                y: 100,
                crossCount: 1,
                itemCount: 12,
                onItemTap: (int index) {
                  if (index == 4) {
                    Get.to(() => Pay_settingPage());
                  } else if (index == 9) {
                    Get.to(PosxfxePage());
                  } else if (index == 8) {
                    Get.to(DkzzxePage());
                  } else if (index == 7) {
                    Get.to(WkzfxePage());
                  } else if (index == 3) {
                    Get.to(JjkjbPage());
                  } else if (index == 2) {
                    Get.to(SzmrzhPage());
                  } else if (index == 1) {
                    Get.to(JjkycPage());
                  } else if (index == 10) {
                    Get.to(QkxePage());
                  } else if (index == 5) {
                    Get.to(KjzfjyPage());
                  }
                }).build()
          ],
        )
      ],
    );
  }
}
