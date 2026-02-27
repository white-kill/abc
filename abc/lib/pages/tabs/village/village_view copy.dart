import 'package:abc/pages/tabs/village/component/village_top_widget.dart';
import 'package:abc/pages/tabs/village/village_fxzl/village_fxzl_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../home/placeholder_search_widget.dart';
import '../home/subpages/message/message_view.dart';
import '../home/subpages/scan_widget/scan_widget_view.dart';
import 'village_logic.dart';
import 'village_state.dart';

class VillagePage extends BaseStateless {
  VillagePage({Key? key}) : super(key: key);

  final VillageLogic logic = Get.put(VillageLogic());
  final VillageState state = Get.find<VillageLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => Obx(() => NavActionWidget(
        left: 16.w,
        color: logic.navActionColor.value,
        title: '扫一扫',
        image: 'icon_sys',
        onTap: () {
          Get.to(() => Scan_widgetPage());
        },
      ));

  @override
  double? get lefItemWidth => 80.w;

  @override
  List<Widget>? get rightAction => [
        Obx(() => NavActionWidget(
              left: 16.w,
              color: logic.navActionColor.value,
              title: '版本',
              image: 'banben',
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '版本切换',
                  'image': 'bg_banben',
                });
              },
            )),
        Obx(() => NavActionWidget(
              color: logic.navActionColor.value,
              title: '消息',
              image: 'xiaoxi',
              onTap: () {
                Get.to(() => MessagePage());
              },
            )),
      ];

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget? get titleWidget => Obx(() => PlaceholderSearchWidget(
        width: 230.w,
        contentList: ['账单', '优惠活动', '明细查询'],
        bgColor: Color(0xffEAF2FD).withOpacity(0.4),
        textColor: logic.navActionColor.value,
      ));

  @override
  Widget initBody(BuildContext context) {
    // 根据设计稿尺寸创建StackPosition实例
    // 设计稿尺寸：1125 x 3141
    StackPosition positionTop = StackPosition(
        designWidth: 1076, designHeight: 2675, deviceWidth: screenWidth);

    StackPosition positionBottom = StackPosition(
        designWidth: 1080, designHeight: 1716, deviceWidth: screenWidth);

    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // VillageTopWidget(),
          Stack(
            children: [
              Image(
                image: 'bg_xc_top'.png3x,
                fit: BoxFit.fitWidth,
              ),

              // 乡村味道
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 0, // 设计稿中乡村好店的X坐标
                y: 237, // 设计稿中乡村好店的Y坐标
                width: 1076, // 设计稿中乡村好店的宽度
                height: 300, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '乡村味道',
                    'image': 'bg_xcwd',
                  });
                },
              ),

              // 农银商城
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 135, // 设计稿中乡村好店的X坐标
                y: 577, // 设计稿中乡村好店的Y坐标
                width: 120, // 设计稿中乡村好店的宽度
                height: 120, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '农银商城',
                    'image': 'bg_nysc',
                  });
                },
              ),

              // 发县之旅
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 360, // 设计稿中乡村好店的X坐标
                y: 577, // 设计稿中乡村好店的Y坐标
                width: 120, // 设计稿中乡村好店的宽度
                height: 120, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.to(() => Village_fxzlPage());
                },
              ),

              // 西藏
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 0, // 设计稿中乡村好店的X坐标
                y: 1643, // 设计稿中乡村好店的Y坐标
                width: 533, // 设计稿中乡村好店的宽度
                height: 310, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.to(() => Village_fxzlPage());
                },
              ),

              // 公益助农
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 573, // 设计稿中乡村好店的X坐标
                y: 577, // 设计稿中乡村好店的Y坐标
                width: 120, // 设计稿中乡村好店的宽度
                height: 120, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '公益助农',
                    'image': 'bg_gyzn',
                  });
                },
              ),
              // 乡村好店
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 812, // 设计稿中乡村好店的X坐标
                y: 577, // 设计稿中乡村好店的Y坐标
                width: 120, // 设计稿中乡村好店的宽度
                height: 120, // 设计稿中乡村好店的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.xchdPage);
                },
              ),

              // 惠农大讲堂 - 根据设计稿坐标定位
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 554, // 设计稿中惠农大讲堂的X坐标
                y: 1051, // 设计稿中惠农大讲堂的Y坐标
                width: 467, // 设计稿中惠农大讲堂的宽度
                height: 256, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '惠农大讲堂',
                    'image': 'bg_hndjt',
                  });
                },
              ),

              // 家电换新
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 50, // 设计稿中惠农大讲堂的X坐标
                y: 2000, // 设计稿中惠农大讲堂的Y坐标
                width: 304, // 设计稿中惠农大讲堂的宽度
                height: 266, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.jdhxPage);
                },
              ),

              // 乡村集市
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 50, // 设计稿中惠农大讲堂的X坐标
                y: 1060, // 设计稿中惠农大讲堂的Y坐标
                width: 470, // 设计稿中惠农大讲堂的宽度
                height: 540, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '乡村集市',
                    'image': 'xcjs',
                  });
                },
              ),

              // 农夫山泉
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 723, // 设计稿中惠农大讲堂的X坐标
                y: 2000, // 设计稿中惠农大讲堂的Y坐标
                width: 304, // 设计稿中惠农大讲堂的宽度
                height: 266, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '农夫山泉',
                    'image': 'nfsq',
                  });
                },
              ),

              // 乐游神州
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 551, // 设计稿中乡村好店的X坐标
                y: 1330, // 设计稿中乡村好店的Y坐标
                width: 466, // 设计稿中惠农大讲堂的宽度
                height: 261, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '乐游神州',
                    'image': 'lysz',
                  });
                },
              ),

              // 绿色专区
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 558, // 设计稿中乡村好店的X坐标
                y: 1672, // 设计稿中乡村好店的Y坐标
                width: 466, // 设计稿中惠农大讲堂的宽度
                height: 261, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '绿色专区',
                    'image': 'lszq',
                  });
                },
              ),

              // 优惠卡券
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 378, // 设计稿中惠农大讲堂的X坐标
                y: 2000, // 设计稿中惠农大讲堂的Y坐标
                width: 304, // 设计稿中惠农大讲堂的宽度
                height: 266, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '优惠卡券',
                    'image': 'yhkq',
                  });
                },
              ),

              // 指数
              StackPositionWidget.fromDesign(
                sp: positionTop,
                x: 0, // 设计稿中惠农大讲堂的X坐标
                y: 2336, // 设计稿中惠农大讲堂的Y坐标
                width: 1076, // 设计稿中惠农大讲堂的宽度
                height: 315, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '债券指数',
                    'imageList': ["zqzs_top", "zqzs_bottom"],
                  });
                },
              ),
            ],
          ),




          Stack(
            children: [
              Image(
                image: 'bg_xc_bottom'.png3x,
                fit: BoxFit.fitWidth,
              ),
              // 指数
              StackPositionWidget.fromDesign(
                sp: positionBottom,
                x: 0, // 设计稿中惠农大讲堂的X坐标
                y: 190, // 设计稿中惠农大讲堂的Y坐标
                width: 1080, // 设计稿中惠农大讲堂的宽度
                height: 288, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.villageZixun, arguments: {"index":0});
                },
              ),
              // 指数
              StackPositionWidget.fromDesign(
                sp: positionBottom,
                x: 0, // 设计稿中惠农大讲堂的X坐标
                y: 496, // 设计稿中惠农大讲堂的Y坐标
                width: 1080, // 设计稿中惠农大讲堂的宽度
                height: 358, // 设计稿中惠农大讲堂的高度
              ).build(

                onTap: () {
                  Get.toNamed(Routes.villageZixun, arguments: {"index":1});

                },
              ),
              // 指数
              StackPositionWidget.fromDesign(
                sp: positionBottom,
                x: 0, // 设计稿中惠农大讲堂的X坐标
                y: 862, // 设计稿中惠农大讲堂的Y坐标
                width: 1076, // 设计稿中惠农大讲堂的宽度
                height: 358, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.villageZixun, arguments: {"index":2});
                },
              ),
              // 指数
              StackPositionWidget.fromDesign(
                sp: positionBottom,
                x: 0, // 设计稿中惠农大讲堂的X坐标
                y: 1225, // 设计稿中惠农大讲堂的Y坐标
                width: 1076, // 设计稿中惠农大讲堂的宽度
                height: 358, // 设计稿中惠农大讲堂的高度
              ).build(
                onTap: () {
                  Get.toNamed(Routes.villageZixun, arguments: {"index":3});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
