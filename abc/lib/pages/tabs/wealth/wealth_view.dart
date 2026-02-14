import 'package:abc/pages/tabs/wealth/children/keepAlive/keep_alive_widget.dart';
import 'package:abc/pages/tabs/wealth/selective_widgegt.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../home/subpages/message/message_view.dart';
import '../home/subpages/scan_widget/scan_widget_view.dart';
import '../other/customer/customer_view.dart';
import 'wealth_logic.dart';
import 'wealth_state.dart';

class WealthPage extends BaseStateless {
  WealthPage({Key? key}) : super(key: key);

  final WealthLogic logic = Get.put(WealthLogic());
  final WealthState state = Get.find<WealthLogic>().state;

  @override
  // TODO: implement isWantKeepAlive
  bool get isWantKeepAlive => true;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => const PlaceholderSearchWidget(contentList: ['账单']);

  @override
  Widget? get leftItem => NavActionWidget(
        left: 16.w,
        color: Colors.black,
        title: '扫一扫',
        image: 'icon_sys',
        onTap: () {
          Get.to(() => Scan_widgetPage());
        },
      );

  @override
  double? get lefItemWidth => 80.w;

  @override
  List<Widget>? get rightAction => [
        NavActionWidget(
          left: 16.w,
          color: Colors.black,
          title: '客服',
          image: 'ic_home_customer',
          onTap: () {
            Get.to(() => CustomerPage());
          },
        ),
        NavActionWidget(
          color: const Color.fromARGB(255, 39, 24, 24),
          title: '消息',
          image: 'ic_home_message',
          onTap: () {
            Get.to(() => MessagePage());
          },
        ),
      ];

  StackPosition position = StackPosition(designWidth: 1125, designHeight: 4175, deviceWidth: screenWidth);



  @override
  Widget initBody(BuildContext context) {

    ;


    return ListView(
      cacheExtent: 8000,
      padding: EdgeInsets.only(top: 10.w +
          MediaQuery.of(context).padding.top +
          AppBar().preferredSize.height),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [

        Stack(children: [
          Padding(
            padding: EdgeInsets.only(left: 19.w, right: 19.w),
            child: Image(image: 'ck_banner_bg'.png3x),
          ),
          Positioned(
              top: 20.w,
              left: 40.w,
              right: 20.w,
              child: Row(
                children: [
                  Text(
                    '持仓总金额',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF8F5C1F),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 2.w),
                  Obx(() {
                    return Image(
                      image: state.showMony.value
                          ? 'eye_open'.png3x
                          : 'eye_close'.png3x,
                      width: 17.w,
                      height: 17.w,
                    ).withOnTap(onTap: () {
                      logic.changeShowMony();
                    });
                  }),
                  Spacer(),
                  Text(
                    '昨日收益',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF8F5C1F),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20.w),
                ],
              )),
          Positioned(
              top: 40.w,
              left: 40.w,
              right: 20.w,
              child: Row(
                children: [
                  Obx(() {
                    return Text(
                      state.showMony.value ? '0.00' : '****',
                      style: TextStyle(
                          fontSize: 27.sp,
                          color: Color(0xFF8F5C1F),
                          fontWeight: FontWeight.w600),
                    );
                  }),
                  SizedBox(width: 2.w),
                  Spacer(),
                  Obx(() {
                    return Text(
                      state.showMony.value ? '0.00' : '****',
                      style: TextStyle(
                          fontSize: 27.sp,
                          color: Color(0xFF8F5C1F),
                          fontWeight: FontWeight.w600),
                    );
                  }),
                  SizedBox(width: 20.w),
                ],
              )),
          Positioned(
              top: 75.5.w,
              left: 40.w,
              right: 20.w,
              child: Row(
                children: [
                  Text(
                    '数据截至 ${DateUtil.formatDate(DateTime.now(), format:DateFormats.full)}',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF8F5C1F),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 2.w),
                  Spacer(),
                  Text(
                    '查看更多',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF8F5C1F),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 2.w),
                  Image(
                    image: 'right_arrow_yellow'.png3x,
                    width: 18.w,
                    height: 18.w,
                  ),
                  SizedBox(width: 20.w),
                ],
              ))
        ]),
        Stack(
          children: [
            Column(
              children: [
                Image(image: 'ck_middle_bg'.png3x),
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: Image(image: 'yxhp_title'.png, height: 28,fit: BoxFit.fitHeight),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Stack(
                      children: [
                        Image(image: 'yxhp'.png, height: screenHeight * 0.25, fit: BoxFit.fitHeight,),
                        Positioned(
                            top: 0,
                            left: 0,
                            child:
                        Container(
                          width: (2178 /795) * (screenHeight * 0.25)/2.0,
                          height: screenHeight * 0.25,
                        ).withOnTap(onTap: () {
                          Get.toNamed(Routes.changeNavi, arguments: {
                            'title': '优选好品',
                            'image': 'yxhp_1',
                            'offset':false,
                            'defTitleColor': Colors.black,
                          });
                        })),
                        Positioned(
                            top: 0,
                            right: 0,
                            child:
                            Container(
                              width: (2178 /795) * (screenHeight * 0.25)/2.0,
                              height: screenHeight * 0.25,
                            ).withOnTap(onTap: () {
                              Get.toNamed(Routes.changeNavi, arguments: {
                                'title': '优选好品',
                                'image': 'yxhp_2',
                                'offset':false,
                                'defTitleColor': Colors.black,
                              });
                            }))
                      ],
                    ),
                  ),
                ),
              ],
            ),


            Container(
              margin: EdgeInsets.only(top: 10.w,left: 5.w,right: 5.w),
              width: 1.sw,
              height: 160.w,
              child: VerticalGridView(widgetBuilder: (context,index){
                return Container().withOnTap(onTap: (){
                  logic.jumpPage(index);
                });
              },spacing: 5,crossSpacing: 5 ,crossCount: 5,itemCount: 10),
            )
          ],
        ),
        Container(
          child: SelectiveWidget(),
        ),
        Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Image(image: 'wealth_file_bottom'.png3x, width: screenWidth, fit: BoxFit.fitWidth,),
                ],
              ),
            ),

            StackPositionWidget(stackPosition: position, designX: 0, designY: 3058, designWidth: 1125, designHeight: 1106).build(onTap: () async {

              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '财富研习所',
                'imageList': ["cfyjy1", "cfyjy2", "cfyjy3"],
                'top':0,
                'right':true
              });

            }),
            StackPositionWidget(stackPosition: position, designX: 0, designY: 2286, designWidth: 1125, designHeight: 745).build(onTap: () {

              Get.toNamed(Routes.reMenCunKuan);
            }),
            StackPositionWidget(stackPosition: position, designX: 0, designY: 1459, designWidth: 1125, designHeight: 745).build(onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '优选基金',
                'imageList': ["yxjj_1", "yxjj_2"],
                'top':0,
                'right':true
              });
            }),
            StackPositionWidget(stackPosition: position, designX: 0, designY: 0, designWidth: 1125, designHeight: 441).build(onTap: () async {
              Get.toNamed(Routes.lccsPage);
            }),
            StackPositionWidget(stackPosition: position, designX: 0, designY: 520, designWidth: 1125, designHeight: 862).build(onTap: () async {
              Get.toNamed(Routes.lccsPage, arguments: {"index":1});
            }),
          ],
        ),
      ],
    );
  }
}
