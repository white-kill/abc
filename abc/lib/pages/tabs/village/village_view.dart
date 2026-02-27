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
  // Function(bool change)? get onNotificationNavChange => (v) {
  //       logic.navActionColor.value = v ? Colors.black : Colors.white;
  //     };

  @override
  Widget? get titleWidget => Obx(() => PlaceholderSearchWidget(
        width: 230.w,
        contentList: ['话题广场'],
        bgColor: Color(0xffEAF2FD).withOpacity(0.4),
        textColor: logic.navActionColor.value,
      ));

  @override
  Widget initBody(BuildContext context) {
    StackPosition positionTop = StackPosition(
        designWidth: 1080, designHeight: 115, deviceWidth: screenWidth);

    return Container(
        color: Colors.white,
        child: Column(children: [
          Obx(() {
            return Stack(
              children: [
                Image(
                  image: 'village_top_${logic.showIndex.value}'.png3x,
                  width: 1.sw,
                  fit: BoxFit.fitWidth,
                ),
                StackPositionWidget.fromDesign(
                  sp: positionTop,
                  x: 0,
                  y: 0,
                  width: 200,
                  height: 115,
                ).build(
                  onTap: () {
                    logic.showIndex.value = 0;
                  },
                ),
                StackPositionWidget.fromDesign(
                  sp: positionTop,
                  x: 200,
                  y: 0,
                  width: 200,
                  height: 115,
                ).build(
                  onTap: () {
                    logic.showIndex.value = 1;
                  },
                ),
              ],
            );
          }),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Obx(() {
                  return Image(
                    image: 'village_content_${logic.showIndex.value}'.png3x,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  );
                }),
              ],
            ),
          )
        ]));
  }
}
