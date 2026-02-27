import 'package:abc/pages/tabs/home/placeholder_search_widget.dart';
import 'package:abc/pages/tabs/home/subpages/message/message_view.dart';
import 'package:abc/pages/tabs/home/top_banner_widget.dart';
import 'package:abc/pages/tabs/home/two_level/two_level_view.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/app_bar_widget.dart';

import '../../../routes/app_pages.dart';
import '../../index/index_logic.dart';
import '../mine/xiaodou/xiaodou_view.dart';
import 'ad_banner_widget.dart';
import 'bordcast_widget.dart';
import 'children/hui_chong_dian/view.dart';
import 'function_banner_widget.dart';
import 'home_logic.dart';
import 'home_state.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

class HomePage extends BaseStateless {
  HomePage({Key? key}) : super(key: key);
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => Obx(() => PlaceholderSearchWidget(
        width: 200.w,
        contentList: ['账单', '优惠活动', '明细查询'],
        bgColor: Color(0xff000000).withOpacity(0.1),
        textColor: logic.navActionColor.value,
      ).paddingOnly(right: 25.w));

  @override
  Widget? get leftItem => Row(
        children: [
          SizedBox(width: 15.w),
          Obx(() {
            return Column(
              children: [
                SizedBox(height: 12.w),
                Image(
                    width: 22.w,
                    height: 22.w,
                    image: ('icon_prize').png3x,
                    color: logic.navActionColor.value),
                Text('抽奖',
                    style: TextStyle(
                        fontSize: 12.sp, color: logic.navActionColor.value)),
              ],
            ).withOnTap(
              onTap: () {
                Get.to(() => XiaodouPage());
              },
            );
          })
        ],
      );

  @override
  List<Widget>? get rightAction => [
        _customWidget('banben', '版本').withOnTap(onTap: () {
          Get.toNamed(Routes.fixedNavPage, arguments: {
            'title': '版本切换',
            'image': 'bg_banben',
          });
        }),
        _customWidget('kefu', '客服').withOnTap(onTap: () {
          Get.to(() => CustomerPage());
        }),
        _customWidget('xiaoxi', '消息').withOnTap(onTap: (){
          Get.to(() => MessagePage());
        }),
      ];

  Widget _customWidget(String imgName, String title) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: 12.w),
          Image(
            width: 22.w,
            height: 22.w,
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
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  AppBarController? get appBarController => state.appBarController;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 966, designHeight: 4064, deviceWidth: screenWidth);
    return GetBuilder(
      builder: (HomeLogic c) {
        return RefreshConfiguration.copyAncestor(
          context: context,
          enableScrollWhenTwoLevel: true,
          maxOverScrollExtent: 120,
          child: LayoutBuilder(
            builder: (_, __) {
              return SmartRefresher(
                header: TwoLevelHeader(
                  textStyle: TextStyle(color: Colors.transparent),
                  idleIcon: SizedBox.shrink(),
                  displayAlignment: TwoLevelDisplayAlignment.fromBottom,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: 'two_level_transation'.png3x,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter),
                  ),
                  twoLevelWidget: TwoLevelPage(),
                ),
                controller: state.refreshController1,
                enableTwoLevel: true,
                enablePullDown: false,
                enablePullUp: false,
                onTwoLevel: (bool isOpen) {
                  final IndexLogic logic = Get.put(IndexLogic());
                  logic.showTabBar = !isOpen;
                  Future.delayed(
                      Duration(milliseconds: logic.showTabBar ? 600 : 0), () {
                    state.appBarController.changeTabTitle(logic.showTabBar);
                  });
                  logic.update(['updateTabBar']);
                },
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                        height: 305.w,
                        width: 1.sw,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Image(
                            image: 'bg_1'.png3x,
                            fit: BoxFit.fitWidth,
                            width: 1.sw,
                          ).withOnTap(onTap: () {
                            Get.to(NhhcdPage());
                          }),
                          Positioned(
                            top: 187.5.w,
                            child: TopBannerWidget(),
                          )
                        ])),
                    SizedBox(height: 10.w),
                    FunctionBannerWidget(),
                    BordcastWidget(),
                    SizedBox(height: 18.w),
                    AdBannerWidget(),
                    SizedBox(height: 18.w),
                    Stack(
                      children: [
                        Image(
                          image: 'home_file_bg'.png3x,
                          fit: BoxFit.fitWidth,
                        ),
                        StackPositionWidget(stackPosition: position, designX: 0, designY: 0, designWidth: 966, designHeight: 788).build(
                            onTap: () {
                              Get.find<IndexLogic>().selectIndex(1);
                            }
                        ),
                        StackPositionWidget(stackPosition: position, designX: 0, designY: 790, designWidth: 966, designHeight: 621).build(
                            onTap: () {
                              Get.toNamed(Routes.changeNavi, arguments: {
                                'title': '热门活动',
                                'image': 'rmhd',
                                'offset':false,
                                'defTitleColor': Colors.black,
                              });
                            }
                        ),
                        StackPositionWidget(stackPosition: position, designX: 0, designY: 1444, designWidth: 966, designHeight: 1932).build(
                          onTap: () {
                            Get.toNamed(Routes.villageZixun, arguments: {"index":0});
                          }
                        ),
                        StackPositionGridWidget.custom(stackPosition: position, x: 0, y: 3547, bottomMargin: 291, crossCount: 3, itemCount: 3, onItemTap: (index) {
                          if (index == 0) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '消费者权益保护',
                              'image': 'home_bottom_1',
                              'hideRightAction': true,
                            });
                          } else if (index == 1) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '农情消保3D数字化展厅 - 总...',
                              'image': 'home_bottom_2',
                              'hideRightAction': true,
                            });
                          } else if (index == 2) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '投诉与咨询',
                              'image': 'home_bottom_3',
                              'hideRightAction': true,
                            });
                          }
                        }).build()

                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      id: 'updateUI',
    );
  }
}
