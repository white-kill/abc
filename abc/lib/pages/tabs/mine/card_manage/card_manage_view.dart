import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/view.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'card_manage_logic.dart';
import 'card_manage_state.dart';
import 'children/scan_bank/view.dart';
import 'children/xyk/view.dart';

class CardManagePage extends BaseStateless {
  CardManagePage({Key? key}) : super(key: key,title: '银行卡管理');

  final CardManageLogic logic = Get.put(CardManageLogic());
  final CardManageState state = Get.find<CardManageLogic>().state;

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
      Image(
          width: 22.w,
          height: 22.w,
          image: ('go_back').png3x, color: Colors.black
      ).withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );
  @override
  List<Widget>? get rightAction => [
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
    StackPosition position = StackPosition(designWidth: 3240, designHeight: 1494, deviceWidth: screenWidth);
    StackPosition position3 = StackPosition(designWidth: 3240, designHeight: 3969, deviceWidth: screenWidth);

    return ListView(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Stack(
          children: [
            Image(image: 'yhkgl_1'.png).withOnTap(onTap: () {
              Get.to(YhkglDetailPage());
            }), // 658 1035
            Positioned(
                left: position.getX(658),
                top: position.getY(1035),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: AppConfig.config.abcLogic.card().substring(0,4),
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
                          SizedBox(width: 5,),
                          Image(image: 'my_account_dot'.png, width: position.getX(362), fit: BoxFit.fitWidth, color: Colors.white,),
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
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang',
                          height: 1),
                    ),
                  ],
                ))
          ],
        ),
        Image(image: 'yhkgl_2'.png).withOnTap(onTap: () {
          Get.toNamed(Routes.fixedNavPage, arguments: {
            'title': '绑他行卡',
            'imageList': ["bthk"],
            'top': 0,
            'background': Colors.white,
            'right': true
          });
        }),
        Stack(
          children: [
            Image(image: 'yhkgl_3'.png),
            StackPositionWidget(stackPosition: position3, designX: 0, designY: 0, designWidth: 1615, designHeight: 812).build(
              onTap: () {
                Get.to(YhkglXYKPage());
              }
            ),
            StackPositionWidget(stackPosition: position3, designX: 1615, designY: 0, designWidth: 1615, designHeight: 812).build(
                onTap: () {
                  Get.toNamed(Routes.changeNavi, arguments: {
                    'title': '电子账户申请',
                    'image': 'dianzi_account',
                    'offset': true,
                    'defTitleColor': Colors.black,
                  });
                }
            )
          ],
        )
      ],
    );
  }
}
