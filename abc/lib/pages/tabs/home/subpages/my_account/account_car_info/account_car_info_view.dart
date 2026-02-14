import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/children/fskgl/view.dart';
import 'package:abc/pages/tabs/home/subpages/my_account/children/jjkjj/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/dxtz/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/jjkyc/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/zfmmxg/view.dart';
import 'package:abc/utils/clean_text_field.dart';
import 'package:abc/utils/long_press_five_seconds.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../children/gs/view.dart';
import 'account_car_info_logic.dart';
import 'account_car_info_state.dart';
import 'code_alter_widget.dart';

class Account_car_infoPage extends BaseStateless {
  Account_car_infoPage({Key? key}) : super(key: key, title: '借记卡详情');

  final Account_car_infoLogic logic = Get.put(Account_car_infoLogic());
  final Account_car_infoState state = Get.find<Account_car_infoLogic>().state;

  @override
  // TODO: implement titleWidget
  Widget? get titleWidget => LongPressFiveSeconds(
    child: Text("借记卡详情", style: TextStyle(
      fontSize: 17.sp,
      color: Colors.black,
      fontWeight: FontWeight.normal
    ),),
      onLongPressCompleted: (){
        AlterWidget.alterWidget(clickMaskDismiss: true,builder: (context) {
          // 初始化控制器
          state.registrationController.text = logic.registrationValue.value;
          state.openOutletsController.text = logic.openOutletsValue.value.isEmpty ? AppConfig.config.abcLogic.openOutlets() : logic.openOutletsValue.value;
          state.cardStatusController.text = logic.cardStatusValue.value;
          state.accountStatusController.text = logic.accountStatusValue.value;
          state.defaultAccountController.text = logic.defaultAccountValue.value;

          return Container(
            width: 1.sw * 0.85,
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.w))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.w,),
                BaseText(text: '编辑账户信息',style: TextStyle(
                    fontSize: 16.w,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 16.w,),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // 注册渠道
                        _buildEditRow('注册渠道', state.registrationController),
                        SizedBox(height: 12.w,),
                        // // 开户网点
                        // _buildEditRow('开户网点', state.openOutletsController),
                        // SizedBox(height: 12.w,),
                        // 卡状态
                        _buildEditRow('卡状态', state.cardStatusController),
                        SizedBox(height: 12.w,),
                        // 账户状态
                        _buildEditRow('账户状态', state.accountStatusController),
                        SizedBox(height: 12.w,),
                        // 默认账户
                        _buildEditRow('默认账户', state.defaultAccountController),
                        SizedBox(height: 12.w,),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1.sw * 0.88,
                  height: 0.5.w,
                  color: const Color(0xffbbbbab),
                ),
                SizedBox(
                  height: 46.w,
                  width: 1.sw * 0.85,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: BaseText(
                              text: '取消',
                              fontSize: 16.sp,
                              color: Color(0xFF666666),
                            ),
                          ).withOnTap(onTap: () {
                            SmartDialog.dismiss();
                          })),
                      Container(
                        width: 0.5.w,
                        height: 42.w,
                        color: const Color(0xffbbbbab),
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: BaseText(
                              text: '确定',
                              fontSize: 16.sp,
                              color: Color(0xFF666666),
                            ),
                          ).withOnTap(onTap: () {
                            // 保存注册渠道
                            logic.registrationValue.value = state.registrationController.text;
                            state.registrationController.text.saveBankRegistration;
                            // 保存开户网点
                            logic.openOutletsValue.value = state.openOutletsController.text;
                            state.openOutletsController.text.saveBankOpenOutlets;
                            // 保存卡状态
                            logic.cardStatusValue.value = state.cardStatusController.text;
                            state.cardStatusController.text.saveBankCardStatus;
                            // 保存账户状态
                            logic.accountStatusValue.value = state.accountStatusController.text;
                            state.accountStatusController.text.saveBankAccountStatus;
                            // 保存默认账户
                            logic.defaultAccountValue.value = state.defaultAccountController.text;
                            state.defaultAccountController.text.saveBankDefaultAccount;
                            SmartDialog.dismiss();
                          })),
                    ],
                  ),
                )
              ],
            ),
          );
        });
      }
  );


  // 构建编辑行的辅助方法
  Widget _buildEditRow(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          SizedBox(
            width: 70.w,
            child: BaseText(
              text: label,
              style: TextStyle(fontSize: 15.w),
            ),
          ),
          SizedBox(width: 8.w,),
          Expanded(
            child: TextFieldWidget(
              controller: controller,
            ).withContainer(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffdedede),
                        width: 0.5.w
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.w))
                )
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 3870, designHeight: 7509, deviceWidth: screenWidth);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'jjkxq'.png3x),
            Positioned(
              left: 65.w,
              top: 33.w,
              child: Obx(() => Row(
                    children: [

                      logic.replaceAsterisksWithImages(
                          logic.showCopy.value
                              ? logic.formatCardNumberWithRegex(
                              AppConfig.config.abcLogic.card1())
                              : AppConfig.config.abcLogic.card(space: ' ')
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      (logic.showCopy.value
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: 2.w,
                                      top: 3.w,
                                      bottom: 1.w,
                                      right: 2.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.w)),
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: Colors.orangeAccent)),
                                  child: BaseText(
                                    text: '复制',
                                    style: TextStyle(
                                        height: 1,
                                        fontSize: 10.sp,
                                        color: Colors.orangeAccent),
                                  ),
                                )
                              : Image(
                                  image: 'cxq_kh'.png3x,
                                  width: 16.w,
                                  height: 18.w,
                                ))
                          .withOnTap(onTap: () {
                        if (logic.showCopy.value) {
                          Clipboard.setData(ClipboardData(
                              text: AppConfig.config.abcLogic.card()));
                          '复制成功'.showToast;
                        } else {
                          AlterWidget.alterWidget(builder: (context) {
                            return CodeAlterWidget(
                              sureCallBack: () {
                                logic.showCopy.value = true;
                              },
                            );
                          });
                        }
                      })
                    ],
                  )),
            ),
            // 注册渠道
            Positioned(
              left: 95.w,
              top: 77.w,
              child: Obx(() => BaseText(
                text:  logic.registrationValue.value,
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 13.sp,
                  height: 1
                ),
              )),
            ),
            Positioned(
              left: 95.w,
              top: 103.w,
              child: BaseText(
                text: AppConfig.config.abcLogic.openOutlets(),
                style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 13.sp,
                    height: 1
                ),
              ),
            ),
            if (logic.cardStatusValue.value != "" )
            Positioned(
              left: 90.w,
              top: 124.w,
              child: Obx(() => Container(
                padding: EdgeInsets.only(left: 5.w, top: 5.w),

                width: 200.w,
                height: 20.w,
                color: Colors.white,
                child: BaseText(
                  text: logic.cardStatusValue.value,
                  style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 13.sp,
                      height: 1
                  ),
                ),
              )),
            ),
            if (logic.accountStatusValue.value != "" )
              Positioned(
                left: 90.w,
                top: 150.w,
                child: Obx(() => Container(
                  padding: EdgeInsets.only(left: 5.w, top: 5.w),
                  width: 200.w,
                  height: 20.w,
                  color: Colors.white,
                  child: BaseText(
                    text: logic.accountStatusValue.value,
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 13.sp,
                        height: 1
                    ),
                  ),
                )),
              ),
            if (logic.defaultAccountValue.value != "" )
              Positioned(
                left: 90.w,
                top: 177.w,
                child: Obx(() => Container(
                  padding: EdgeInsets.only(left: 5.w, top: 5.w),
                  width: 200.w,
                  height: 20.w,
                  color: Colors.white,
                  child: BaseText(
                    text: logic.defaultAccountValue.value,
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 13.sp,
                        height: 1
                    ),
                  ),
                )),
              ),

            Positioned(
                right: 15.w,
                top: 290.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 70.w,
                    ),
                    BaseText(
                      text:
                          '¥ ${AppConfig.config.abcLogic.memberInfo.accountBalance.bankBalance}',
                      color: Colors.orange,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    BaseText(
                      text:
                          '¥ ${AppConfig.config.abcLogic.memberInfo.accountBalance.bankBalance}',
                      color: Colors.orange,
                      fontSize: 16.sp,
                    ),
                  ],
                )),
            Positioned(
                right: 15.w,
                top: 492.w,
                child: BaseText(
                  text:  AppConfig.config.abcLogic.openTime().replaceAll('-', '/'),
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 15.sp,
                  ),
                )),
            StackPositionGridWidget.grid4x4(stackPosition: position, x: 318, y: 2283, bottomMargin: 4929, rightMargin: 318, itemCount: 4, onItemTap: (index) {
              if (index == 0) {
                Get.to(() => GsPage());
              }
              else if (index == 1) {
                Get.to(() => ZfmmxgPage());
              }
              else if (index == 2) {
                SmartDialog.show(builder: (context) {
                  return InkWell(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Image(image: 'mmjs'.png),),
                    onTap: () {
                      SmartDialog.dismiss();
                    },
                  );
                });

              }
              else if (index == 3) {
                showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context) {
                  StackPosition position = StackPosition(designWidth: 1290, designHeight: 1394, deviceWidth: screenWidth);
                  return Stack(
                    children: [
                      Container(height: position.getHeight(1394), width: 1.sw, color: Colors.transparent,),
                      Positioned(
                        top:30.w,
                        child: Image(image: 'more_bottom'.png, height: position.getHeight(1394),),),
                      StackPositionGridWidget.custom(stackPosition: position, x: 0, y: 100, bottomMargin: 0, crossCount: 1, itemCount: 8,
                  // childBuilder: (context,index) {
                  //       return Text("$index");
                  // },
                          onItemTap: (index) {
                        if (index == 0) {
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
                        }
                        else if (index == 1) {
                          Get.to(JjkycPage());
                        }
                        else if (index == 2) {
                          Get.to(DxtzPage());
                        }
                        else if (index == 3) {
                          SmartDialog.show(builder: (context) {
                            return InkWell(
                              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Image(image: 'jkhcx'.png),),
                              onTap: () {
                                SmartDialog.dismiss();
                              },
                            );
                          });
                        }
                        else if (index == 4) {
                          Get.to(JjkjjPage());
                        }
                        else if (index == 5) {
                          SmartDialog.show(builder: (context) {
                            return InkWell(
                              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Image(image: 'jkhcx'.png),),
                              onTap: () {
                                SmartDialog.dismiss();
                              },
                            );
                          });
                        }
                        else if (index == 6) {
                          Get.to(FskglPage());
                        }
                        else if (index == 7) {
                          Get.back();
                        }
                      }
                      ).build()
                    ],
                  ) ;
                });

              }
            }).build(),

          ],
        )
      ],
    );
  }
}
