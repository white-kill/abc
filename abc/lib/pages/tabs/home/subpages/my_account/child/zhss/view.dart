import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/dxtz/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/jjkjb/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/jjkyc/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/yhkgl_detail/children/szmrzh/view.dart';
import 'package:abc/pages/tabs/other/customer/customer_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class ZhssPage extends BaseStateless {
  ZhssPage({Key? key}) : super(key: key, title: '帐户设置');

  final ZhssLogic logic = Get.put(ZhssLogic());
  final ZhssState state = Get.find<ZhssLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  List<Widget>? get rightAction => [
        Image(
          image: 'ic_home_customer'.png3x,
          width: 22.w,
          height: 22.w,
          color: Colors.black,
        )
            .withPadding(
          left: 0.w,
          right: 15.w,
        )
            .withOnTap(onTap: () {
          Get.to(() => CustomerPage());
        }),
      ];

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2503, deviceWidth: screenWidth);
    return Stack(
      children: [
        Container(width: screenWidth, child: Image(image: 'zhss'.png)),
        StackPositionGridWidget.custom(
          stackPosition: position,
          x: 0,
          y: 134,
          crossCount: 1,
          itemCount: 5,
          bottomMargin: 1575,
          onItemTap: (index) {
            if (index == 0) {
              Get.toNamed(Routes.cardManagePage);
            }
            else if (index == 1) {
              Get.to(SzmrzhPage());
            }
            else if (index == 2) {
              Get.to(DxtzPage());
            }
            else if (index == 3) {
              Get.to(JjkycPage());
            }
            else if (index == 4) {
              Get.to(JjkjbPage());
            }
          }

        ).build()
      ],
    );
  }
}
