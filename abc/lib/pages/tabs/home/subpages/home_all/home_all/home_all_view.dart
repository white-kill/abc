import 'package:abc/pages/tabs/home/subpages/bill_page/bill_page_view.dart';
import 'package:abc/pages/tabs/home/subpages/cunkuan_page/cunkuan_page_view.dart';
import 'package:abc/pages/tabs/home/subpages/daikuan_page/dk_widget/dk_widget_view.dart';
import 'package:abc/pages/tabs/home/subpages/lifepay_page/lifepay/lifepay_view.dart';
import 'package:abc/pages/tabs/home/subpages/month_bill/month_widget/month_widget_view.dart';
import 'package:abc/pages/tabs/home/subpages/netpoint_page/netpoint_page/netpoint_page_view.dart';
import 'package:abc/pages/tabs/home/subpages/scan_widget/scan_widget_view.dart';
import 'package:abc/pages/tabs/life/children/cxfw/view.dart';
import 'package:abc/pages/tabs/life/life_jf/life_jf_view.dart';
import 'package:abc/pages/tabs/life/life_ms/life_ms_view.dart';
import 'package:abc/pages/tabs/life/phone/phone_view.dart';
import 'package:abc/pages/tabs/mine/child/aqzx/view.dart';
import 'package:abc/pages/tabs/mine/xiaodou/xiaodou_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/sticky_widget.dart';
import '../../../../mine/card_manage/card_manage_view.dart';
import '../../../../mine/mine_property/mine_property_view.dart';
import '../../../../wealth/wealth_view.dart';
import '../../../placeholder_search_widget.dart';
import '../../details_export/details_export_view.dart';
import '../../details_query/details_query_view.dart';
import '../../transfer_accounts/transfer_accounts_view.dart';
import 'home_all_logic.dart';
import 'home_all_state.dart';

class Home_allPage extends BaseStateless {
  Home_allPage({Key? key}) : super(key: key);

  final Home_allLogic logic = Get.put(Home_allLogic());

  @override
  Widget get titleWidget => PlaceholderSearchWidget(
        width: 265.w,
        contentList: ['请输入'],
        bgColor: Color(0xffEAF2FD).withOpacity(0.4),
        textColor: Colors.grey,
      ).paddingOnly(left: 10.w);

  // 创建 TabBar
  Widget _buildTabBar() {
    return Container(
      height: 35.h,
      child: TabBar(
        controller: logic.tabController,
        // 使用我们的 TabController
        isScrollable: true,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.w, color: Color(0xff0FB2A3)),
          insets: EdgeInsets.only(bottom: 0, left: 2, right: 2),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Color(0xFF0FB2A3),
        unselectedLabelColor: Color(0xFF333333),
        labelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'PingFang',
            height: 1.0),
        unselectedLabelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'PingFang',
            height: 1.0),
        onTap: (index) => logic.scrollToAnchor(index),
        tabs: [
          Tab(text: '查询'),
          Tab(text: '转账支付'),
          Tab(text: '财富'),
          Tab(text: '存款'),
          Tab(text: '贷款'),
          Tab(text: '信用卡'),
          Tab(text: '私人银行'),
          Tab(text: '生活'),
          Tab(text: '助手'),
          Tab(text: '网点/特色'),
        ],
      ),
    );
  }

  // 创建 Tab 组件
  Widget _buildTabSection() {
    return Container(
      key: logic.tabKey,
      // color: Colors.white,
      child: _buildTabBar(),
    );
  }

  // 创建锚点内容
  Widget _buildAnchorContent(int index, String title,
      {double scrollViewHeight = 0}) {
    // 如果是最后一个内容（索引9），让它占满 ScrollView 的高度
    if (index == 9) {
      return Container(
        key: logic.anchorKeys[index],
        color: Colors.white,
        constraints: BoxConstraints(
          minHeight: scrollViewHeight, // 使用 ScrollView 的可用高度
        ),
        child: Image(
          fit: BoxFit.fitWidth,
          image: 'home_more_${index + 2}'.png,
          alignment: Alignment.topCenter, // 图片顶部对齐
        ),
      );
    }

    return Container(
      key: logic.anchorKeys[index],
      child: Image(
        fit: BoxFit.fitWidth,
        image: 'home_more_${index + 2}'.png,
      ),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition stackPosition = StackPosition(
        designWidth: 1080, designHeight: 575, deviceWidth: screenWidth);

    StackPosition cxPosition = StackPosition(
        designWidth: 1080, designHeight: 642, deviceWidth: screenWidth);

    StackPosition zzzfPosition = StackPosition(
        designWidth: 1080, designHeight: 567, deviceWidth: screenWidth);

    StackPosition cfPosition = StackPosition(
        designWidth: 1080, designHeight: 1404, deviceWidth: screenWidth);

    StackPosition ckPosition = StackPosition(
        designWidth: 1080, designHeight: 780, deviceWidth: screenWidth);

    StackPosition dkPosition = StackPosition(
        designWidth: 1080, designHeight: 579, deviceWidth: screenWidth);

    StackPosition xykPosition = StackPosition(
        designWidth: 1080, designHeight: 777, deviceWidth: screenWidth);

    StackPosition shPosition = StackPosition(
        designWidth: 1080, designHeight: 985, deviceWidth: screenWidth);

    StackPosition zsPosition = StackPosition(
        designWidth: 1080, designHeight: 988, deviceWidth: screenWidth);

    StackPosition wdPosition = StackPosition(
        designWidth: 1080, designHeight: 988, deviceWidth: screenWidth);

    return Stack(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            controller: logic.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image(
                      fit: BoxFit.fitWidth,
                      image: 'home_more_1'.png,
                    ),
                    StackPositionWidget(
                            stackPosition: stackPosition,
                            designX: 0,
                            designY: 314,
                            designWidth: 245,
                            designHeight: 186)
                        .build(onTap: () {
                      // 我的账户
                      Get.toNamed(Routes.myAccountPage);
                    }),
                    StackPositionWidget(
                            stackPosition: stackPosition,
                            designX: 298,
                            designY: 314,
                            designWidth: 245,
                            designHeight: 186)
                        .build(onTap: () {
                      // 存款
                      Get.to(() => Cunkuan_pagePage());
                    }),
                    StackPositionWidget(
                            stackPosition: stackPosition,
                            designX: 545,
                            designY: 310,
                            designWidth: 245,
                            designHeight: 186)
                        .build(onTap: () {
                      // 信用卡
                      Get.toNamed(Routes.changeNavi, arguments: {
                        'title': '信用卡',
                        'image': 'xyk',
                        'offset': false,
                        'defTitleColor': Colors.black,
                      });
                    }),
                    StackPositionWidget(
                            stackPosition: stackPosition,
                            designX: 855,
                            designY: 297,
                            designWidth: 245,
                            designHeight: 186)
                        .build(onTap: () {
                      // 转账
                      Get.to(() => TransferAccountsPage());
                    })
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                // 锚点内容区域
                //
                Stack(
                  children: [
                    _buildAnchorContent(0, '查询'),
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 59,
                            designY: 207,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.toNamed(Routes.myAccountPage);
                    }),
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 316,
                            designY: 207,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.toNamed(Routes.detailsQueryPage);
                    }),
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 593,
                            designY: 207,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.toNamed(
                        Routes.billPagePage,
                      );
                    }),
                    //       Get.to(() => MinePropertyPage());
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 59,
                            designY: 413,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.to(() => MinePropertyPage());
                    }),
                    //
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 340,
                            designY: 413,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.to(() => Month_widgetPage());
                    }),
                    StackPositionWidget(
                            stackPosition: cxPosition,
                            designX: 560,
                            designY: 413,
                            designWidth: 146,
                            designHeight: 177)
                        .build(onTap: () {
                      Get.toNamed(Routes.cardManagePage);
                    }),
                  ],
                ),
                Stack(
                  children: [
                    _buildAnchorContent(1, '转账支付'),
                    StackPositionWidget(
                            stackPosition: zzzfPosition,
                            designX: 80,
                            designY: 124,
                            designWidth: 81,
                            designHeight: 162)
                        .build(onTap: () {
                      Get.toNamed(
                        Routes.transferAccountsPage,
                      );
                    }),
                    StackPositionWidget(
                            stackPosition: zzzfPosition,
                            designX: 591,
                            designY: 334,
                            designWidth: 154,
                            designHeight: 148)
                        .build(onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '快捷支付',
                        'imageList': ["yjbk_1", 'yjbk_2'],
                        'top': 0,
                        'background': Colors.white,
                        'right': true
                      });
                    }),
                    StackPositionWidget(
                            stackPosition: zzzfPosition,
                            designX: 850,
                            designY: 334,
                            designWidth: 154,
                            designHeight: 148)
                        .build(onTap: () {
                      Get.toNamed(Routes.taHangZhuanRu);
                    }),
                    StackPositionWidget(
                            stackPosition: zzzfPosition,
                            designX: 324,
                            designY: 334,
                            designWidth: 154,
                            designHeight: 148)
                        .build(onTap: () {
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '绑他行卡',
                        'imageList': ["bthk"],
                        'top': 0,
                        'background': Colors.white,
                        'right': true
                      });
                    }),
                  ],
                ),

                Stack(
                  children: [
                    _buildAnchorContent(2, '财富'),
                    StackPositionGridWidget.grid4x4(
                      stackPosition: cfPosition,
                      x: 0,
                      y: 120,
                      bottomMargin: 0, // 距离底部0，即到底部
                      itemCount: 22,
                      // childBuilder: (context, index) {
                      //   return Text(index.toString());
                      // },
                      onItemTap: (index) {
                        if (index == 0) {
                          // 理财产品
                          Get.toNamed(Routes.lccsPage);
                        } else if (index == 3) {
                          // 基金
                          Get.toNamed(Routes.cfjj);
                        } else if (index == 5) {
                          // 保险
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '保险',
                            'image': 'cf_bx',
                            'offset': false,
                            'defTitleColor': Colors.black,
                          });
                        } else if (index == 6) {
                          Get.toNamed(Routes.cfgjs);
                        } else if (index == 10) {
                          Get.toNamed(Routes.cfzq);
                        } else if (index == 14) {
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '个人养老金',
                            'image': 'grylj',
                            'offset': false,
                            'defTitleColor': Colors.black,
                          });
                        }
                      },
                    ).build()
                  ],
                ),
                Stack(
                  children: [
                    _buildAnchorContent(3, '存款'),
                    StackPositionGridWidget.grid4x4(
                      stackPosition: ckPosition,
                      x: 0,
                      y: 120,
                      bottomMargin: 0, // 距离底部0，即到底部
                      itemCount: 12,
                      onItemTap: (index) {
                        if (index == 0) {
                          Get.to(() => Cunkuan_pagePage());
                        }
                      },
                    ).build()
                  ],
                ),
                Stack(
                  children: [
                    _buildAnchorContent(4, '贷款'),
                    StackPositionGridWidget.grid4x4(
                      stackPosition: dkPosition,
                      x: 0,
                      y: 120,
                      bottomMargin: 0, // 距离底部0，即到底部
                      itemCount: 5,
                      onItemTap: (index) {
                        if (index == 0) {
                          Get.to(() => Dk_widgetPage());
                        }
                      },
                    ).build()
                  ],
                ),
                Stack(
                  children: [
                    _buildAnchorContent(5, '信用卡'),
                    StackPositionGridWidget.grid4x4(
                      stackPosition: xykPosition,
                      x: 0,
                      y: 120,
                      bottomMargin: 0, // 距离底部0，即到底部
                      itemCount: 11,
                      onItemTap: (index) {
                        if (index == 0) {
                          // 信用卡
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '信用卡',
                            'image': 'xyk',
                            'offset': false,
                            'defTitleColor': Colors.black,
                          });
                        } else if (index == 1) {
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '信用卡还款',
                            'image': 'xykhk',
                            'offset': true,
                            'defTitleColor': Colors.black,
                          });
                        } else if (index == 8) {
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '信用卡申请',
                            'image': 'xykshenqing',
                            'offset': true,
                            'defTitleColor': Colors.black,
                          });
                        }
                      },
                    ).build()
                  ],
                ),
                _buildAnchorContent(6, '私人银行'),

                Stack(
                  children: [
                    _buildAnchorContent(7, '生活'),
                    StackPositionGridWidget.grid4x4(
                        stackPosition: shPosition,
                        x: 0,
                        y: 120,
                        bottomMargin: 0, // 距离底部0，即到底部
                        itemCount: 13,
                        onItemTap: (index) {
                          if (index == 0) {
                            Get.to(() => Life_jfPage());
                          } else if (index == 1) {
                            Get.to(PhonePage());
                          } else if (index == 2) {
                            Get.to(() => Life_msPage());
                          } else if (index == 3) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '社保医保',
                              'image': 'sbyb',
                              'top': 0,
                            });
                          } else if (index == 4) {
                            Get.to(() => XiaodouPage());
                          } else if (index == 5) {
                            Get.toNamed(Routes.changeNavi, arguments: {
                              'title': '热门活动',
                              'image': 'rmhd',
                              'offset': false,
                              'defTitleColor': Colors.black,
                            });
                          } else if (index == 6) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '校园',
                              'image': 'xy',
                              'top': 0,
                              'right': true
                            });
                          } else if (index == 7) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '食堂',
                              'image': 'ct',
                              'top': 0,
                              'right': true
                            });
                          } else if (index == 10) {
                            Get.to(CxfwPage());
                          } else if (index == 11) {
                            Get.toNamed(Routes.changeNavi, arguments: {
                              'title': '公益捐款',
                              'image': 'gyjkuan',
                              'offset': true,
                              'defTitleColor': Colors.black,
                            });
                          }
                        }).build()
                  ],
                ),

                Stack(
                  children: [
                    _buildAnchorContent(8, '助手'),
                    StackPositionGridWidget.grid4x4(
                        stackPosition: zsPosition,
                        x: 0,
                        y: 120,
                        bottomMargin: 0, // 距离底部0，即到底部
                        itemCount: 14,
                        onItemTap: (index) {
                          if (index == 0) {
                            Get.to(() => Scan_widgetPage());
                          } else if (index == 3) {
                            Get.toNamed(Routes.detailsExportPage);
                          } else if (index == 10) {
                            Get.toNamed(Routes.aqzxPage);
                          } else if (index == 13) {
                            Get.toNamed(Routes.villageZixun);
                          }
                        }).build()
                  ],
                ),
                Stack(
                  children: [
                    _buildAnchorContent(9, '网点/特色',
                        scrollViewHeight: constraints.maxHeight - 35.h),
                    StackPositionGridWidget.grid4x4(
                        stackPosition: StackPosition(
                            designWidth: screenWidth,
                            designHeight: constraints.maxHeight - 35.h,
                            deviceWidth: screenWidth),
                        x: 0,
                        y: 30,
                        bottomMargin: 0, // 距离底部0，即到底部
                        itemCount: 28,

                        onItemTap: (index) {
                          if (index == 0) {
                            Get.to(() => Netpoint_pagePage());
                          } else if (index == 4) {
                            Get.toNamed(Routes.fixedNavPage, arguments: {
                              'title': '城市专区',
                              'image': 'life_cszq',
                              'top': 0,
                              'right': true
                            });
                          }
                        }).build()
                  ],
                )
              ],
            ),
          );
        }),
        // 使用 StickyWidget 组件
        StickyWidget(
          child: Container(
            color: Colors.white,
            child: _buildTabSection(),
          ),
          initialOffset: (575 / 1080 * screenWidth), // 手动设置的初始位置
          stickyOffset: 0.0,
          controller: logic.stickyController,
        ),
      ],
    );
  }
}
