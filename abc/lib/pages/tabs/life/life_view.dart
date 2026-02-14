import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/common_banner_widget.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../config/abc_config/abc_logic.dart';
import '../home/placeholder_search_widget.dart';
import '../mine/main_order/main_order_view.dart';
import 'life_logic.dart';
import 'life_state.dart';
import 'life_top_banner.dart';

class LifePage extends BaseStateless {
  LifePage({Key? key}) : super(key: key);

  final LifeLogic logic = Get.put(LifeLogic());
  final LifeState state = Get
      .find<LifeLogic>()
      .state;

  @override
  bool get isChangeNav => true;

  @override
  Function(bool change)? get onNotificationNavChange =>
          (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget? get titleWidget =>
      Row(
        children: [
          Obx(() {
            return Row(
              children: [
                Image(
                    width: 21.w,
                    height: 21.w,
                    image: ('location').png3x,
                    color: logic.navActionColor.value),
                SizedBox(width: 2.w),
                GetBuilder(builder: (AbcLogic c) {
                  return Text(c.memberInfo.city,
                      style: TextStyle(
                          fontSize: 14.sp, color: logic.navActionColor.value));
                }, id: 'updateUI',),
              ],
            );
          }),
          Expanded(
            child: Obx(() =>
                PlaceholderSearchWidget(
                  width: 240.w,
                  bgColor: Color(0xffEAF2FD).withOpacity(0.4),
                  contentList: ['账单'],
                  textColor: logic.navActionColor.value,
                ).paddingOnly(right: 15.w, left: 15.w)),
          ),
        ],
      );

  @override
  // TODO: implement leftItem
  Widget? get leftItem => SizedBox();

  @override
  double? get lefItemWidth => 12.w;

  @override
  List<Widget>? get rightAction =>
      [
        _customWidget('kefu', '订单').withOnTap(onTap: () {
          Get.to(() => Main_orderPage(),
              arguments: {'index': 0, 'titleName': '全部'});
        }),
        _customWidget('icon_coupon', '卡券'),
      ];

  Widget _customWidget(String imgName, String title) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: 12.w),
          Image(
            width: 18.w,
            height: 18.w,
            image: imgName.png3x,
            color: logic.navActionColor.value,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 12.sp, color: logic.navActionColor.value)),
        ],
      ).paddingOnly(right: 10.w);
    });
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition positionActive = StackPosition(
        designWidth: 750, designHeight: 3869, deviceWidth: screenWidth);
    StackPosition positionjingXuan = StackPosition(
        designWidth: 750, designHeight: 5237, deviceWidth: screenWidth);
    // TODO: implement initBody
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(alignment: Alignment.center, children: [
          Image(
            image: 'life_bg_1'.png3x,
            fit: BoxFit.fill,
            width: screenWidth,
          ),
          Positioned(
            top: 187.5.w,
            child: LifeTopBannerWidget(),
          )
        ]),
        // SizedBox(height: 10.w),

        Stack(
          children: [
            // Image(image: 'life_bg_2'.png3x),

            SizedBox(
              height: 1470 / 3174 * screenWidth,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      Container(
                          color: Colors.white,
                          width: screenWidth,
                          child: Image(image: 'life_tag_top'.png3x, width: screenWidth, fit: BoxFit.fitWidth,)),
                      Container(
                        width: 1.sw,
                        height: 142.w,
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: VerticalGridView(
                            widgetBuilder: (context, index) {
                              return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    logic.jumpPage(index);
                                  },
                                  child: Container());
                            },
                            spacing: 5,
                            crossSpacing: 5,
                            crossCount: 5,
                            itemCount: 10),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                          color: Colors.white,
                          child: Image(image: 'life_tag_top2'.png, width: screenWidth, fit: BoxFit.fitWidth,)),
                      Container(
                        width: 1.sw,
                        height: 142.w,

                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: VerticalGridView(
                            widgetBuilder: (context, index) {
                              return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    logic.jumpPage(index + 10);
                                  },
                                  child: Container());
                            },
                            spacing: 5,
                            crossSpacing: 5,
                            crossCount: 5,
                            itemCount: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),

        Obx(() {
          return Stack(
            children: [

              Image(image: logic.bottomImg.value.png3x),
              Container(
                width: 1.sw,
                height: 45.w,
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.w),
                child: VerticalGridView(widgetBuilder: (context, index) {
                  return Container().withOnTap(onTap: () {
                    if (index == 0) {
                      logic.bottomImg.value = 'life_tag_jx';
                    }
                    if (index == 1) {
                      logic.bottomImg.value = 'life_tag_hd';
                    }
                    if (index == 2) {
                      logic.bottomImg.value = 'life_tag_zk';
                    }
                    if (index == 3) {
                      logic.bottomImg.value = 'life_pp';
                    }
                  });
                },
                    spacing: 5,
                    crossSpacing: 5,
                    crossCount: 4,
                    itemCount: 10),
              ),

              /// 点击事件
              if (logic.bottomImg.value == 'life_tag_hd')
                StackPositionWidget(stackPosition: positionActive,
                    designX: 375,
                    designY: 101,
                    designWidth: 338,
                    designHeight: 441).build(
                    onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '逛集市享优惠',
                        'imageList': ["life_active_99_1", "life_active_99_2"],
                        'top': 0,
                        'right': true
                      });
                    }
                ),
              if (logic.bottomImg.value == 'life_tag_hd')
                StackPositionWidget(stackPosition: positionActive,
                    designX: 37,
                    designY: 104,
                    designWidth: 338,
                    designHeight: 441).build(
                    onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '农行万事达——芯双应用卡,多重...',
                        'imageList': ["life_wsd_1", "life_wsd_2"],
                        'top': 0,
                        'right': true
                      });
                    }
                ),
              if (logic.bottomImg.value == 'life_tag_jx')
                StackPositionWidget(stackPosition: positionjingXuan,
                    designX: 380,
                    designY: 106,
                    designWidth: 328,
                    designHeight: 187).build(
                    onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '车票优享',
                        'imageList': ["life_cpyx1", "life_cpyx2"],
                        'top': 0,
                        'right': true
                      });
                    }
                ),
              if (logic.bottomImg.value == 'life_tag_jx')
                StackPositionWidget(stackPosition: positionjingXuan,
                    designX: 40,
                    designY: 106,
                    designWidth: 332,
                    designHeight: 432).build(
                    onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '蜜雪优惠享',
                        'imageList': ["life_mxbc"],
                        'top': 0,
                        'right': true
                      });
                    }
                ),

            ],
          );
        })
      ],
    );
  }
}
