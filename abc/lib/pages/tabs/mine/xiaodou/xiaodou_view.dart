import 'package:abc/config/app_config.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../other/customer/customer_view.dart';
import 'xiaodou_logic.dart';
import 'xiaodou_state.dart';

class XiaodouPage extends BaseStateless {
  XiaodouPage({Key? key}) : super(key: key, title: '小豆乐园');

  final XiaodouLogic logic = Get.put(XiaodouLogic());
  final XiaodouState state = Get.find<XiaodouLogic>().state;

  @override
  List<Widget>? get rightAction => [
        Image(
          image: 'ic_home_customer'.png3x,
          width: 25.w,
          height: 25.w,
          color: Colors.black,
        ).withPadding(
          left: 0.w,
          right: 12.w,
        ).withOnTap(onTap: (){
          Get.to(() => CustomerPage());
        }),
      ];

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 750, designHeight: 6889, deviceWidth: screenWidth);
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        //
        Stack(
          children: [
            Image(
              image: 'bg_xiaodou'.png3x,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                top: position.getY(264),
                left: position.getX(75),
                child: Text(AppConfig.config.abcLogic.memberInfo.peas.toString(),
                style: TextStyle(
                  fontSize: position.getY(55),
                  color: Color(0xFFFDA806)
                ),
                ))
          ],
        )
      ],
    );
  }
}
