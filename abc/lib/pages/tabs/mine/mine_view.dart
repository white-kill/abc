import 'package:abc/pages/tabs/home/subpages/message/message_view.dart';
import 'package:abc/pages/tabs/mine/component/mine_info_widget.dart';
import 'package:abc/pages/tabs/mine/component/mine_item3.dart';
import 'package:abc/pages/tabs/mine/component/mine_item4.dart';
import 'package:abc/pages/tabs/mine/component/mine_item5.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../home/subpages/netpoint_page/netpoint_page/netpoint_page_view.dart';
import '../other/customer/customer_view.dart';
import 'component/mine_item1.dart';
import 'component/mine_item2.dart';
import 'main_order/main_order_view.dart';
import 'mine_logic.dart';
import 'mine_state.dart';

class MinePage extends BaseStateless {
  MinePage({Key? key}) : super(key: key);

  final MineLogic logic = Get.put(MineLogic());
  final MineState state = Get.find<MineLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem =>  Obx(() => NavActionWidget(
    left: 16.w,
    color: logic.navActionColor.value,
    title: '退出',
    image: 'icon_exit',
    onTap: (){
      '您确认退出登录?'.dialog1(title: '提示',onBack: (v){
        if(v){
          ''.saveToken;
          Get.offAllNamed(Routes.register);
        }
      });
    },
  ));

  @override
  double? get lefItemWidth => 80.w;

  @override
  List<Widget>? get rightAction => [
    Obx(() => NavActionWidget(
      left: 16.w,
      color: logic.navActionColor.value,
      title: '搜索',
      image: 'icon_search',
      routesName: Routes.search,
    )),
    Obx(() => NavActionWidget(
      color: logic.navActionColor.value,
      title: '设置',
      image: 'icon_setting',
      routesName: Routes.settingPage,
    )),
    Obx(() => NavActionWidget(
      color: logic.navActionColor.value,
      title: '更多',
      image: 'icon_more',
      onTapItem: (String name){
        if(name == '消息'){
          Get.to(() => MessagePage());
        }
        if(name == '版本'){
          Get.toNamed(Routes.fixedNavPage, arguments: {
            'title': '版本切换',
            'image': 'bg_banben',
          });
        }
        if(name == '客服'){
          Get.to(() => CustomerPage());
        }
      },
    )),
  ];


  @override
  Function(bool change)? get onNotificationNavChange => (v) {
    logic.navActionColor.value = v ? Colors.black : Colors.black;
  };

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 1290, designHeight: 1295, deviceWidth: 1.sw);
    return ListView(
      controller: logic.scrollController,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        MineInfoWidget(),
        MineItem1(),
        MineItem2(),
        // MineItem3(),
        // MineItem4(),
        // MineItem5(),
        Column(
          children: [
            Stack(
              children: [
                Image(image: "mine_bottom".png3x,width: 1.sw, gaplessPlayback: true,),
                // 我的网点
                Positioned(
                  top: 0,
                  child: Container(
                    width: 1.sw,
                    height: 50.w,
                    color: Colors.transparent,
                  ).withOnTap(onTap: () {
                    Get.to(() => Netpoint_pagePage());
                  }),
                ),
                // 安全中心
                Positioned(
                  top: 150.w,
                  child: Container(
                    width: 1.sw,
                    height: 50.w,
                  ).withOnTap(onTap: () {
                    Get.toNamed(Routes.aqzxPage);
                  }),
                ),
                // 我的订单
                Positioned(
                  top: 300.w,
                  child: Container(
                    width: 1.sw,
                    height: 50.w,
                  ).withOnTap(onTap: () {
                    Get.to(() => Main_orderPage(),arguments: {
                      'index':0,
                      'titleName':"全部订单"
                    });
                  }),
                ),

                // 我的网点 四个
                StackPositionGridWidget.custom(
                  stackPosition: position,
                  x: 70,
                  y: 195,
                  rightMargin: 70,
                  bottomMargin: 856,
                  crossCount: 4,
                  itemCount: 4,
                  onItemTap: (index) {
                    if (index == 0) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '我要开卡',
                        'image': 'wykk',
                        'rightWidget': Text(
                          '历史申请',
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ).withPadding(right: 16.w),
                      });
                    } else if (index == 1) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '纪念币预约',
                        'image': 'jnbyy',
                      });
                    } else if (index == 2) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '同号换卡',
                        'image': 'thhk',
                        'bodyWidget': ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Stack(
                              children: [
                                Image(image: 'thhk'.png3x, fit: BoxFit.fitWidth, width: 1.sw),
                                Positioned(
                                  top: 23.w,
                                  right: 33.w,
                                  child: Text(
                                    '622848 **** 1373',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      });
                    } else if (index == 3) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '网点查询',
                        'image': 'wdcx',
                      });
                    }
                  },
                ).build(),
                StackPositionGridWidget.custom(
                  stackPosition: position,
                  x: 70,
                  y: 700,
                  rightMargin: 70,
                  bottomMargin: 335,
                  crossCount: 4,
                  itemCount: 4,
                  onItemTap: (index) {
                    if (index == 0) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '登录设置',
                        'image': 'dlsz',
                      });
                    } else if (index == 1) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '转账设置',
                        'image': 'zzsz',
                      });
                    } else if (index == 2) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '支付设置',
                        'image': 'zfsz',
                      });
                    } else if (index == 3) {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '常用设备管理',
                        'image': 'cysbgl',
                      });
                    }
                  },
                ).build(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
