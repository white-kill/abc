import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';


class JfChildrenPage extends BaseStateless {
  String? imageName;
  JfChildrenPage({Key? key, int? index}) : super(key: key, title: '生活缴费') {

    if (index == 0) {
      imageName = "sf";
    }
    else if (index == 1) {
      imageName = "df";
    }
    else if (index == 2) {
      imageName = "rqf";
    }
    else if (index == 3) {
      imageName = "gnf";
    }
    else if (index == 4) {
      imageName = "kdwlf";
    }
    else if (index == 5) {
      imageName = "wyf";
    }
    else if (index == 6) {
      imageName = "dhf";
    }
    else if (index == 7) {
      imageName = "dangf";
    }
    else if (index == 8) {

    }
  }

  final JfChildrenLogic logic = Get.put(JfChildrenLogic());
  final JfChildrenState state = Get
      .find<JfChildrenLogic>()
      .state;


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(
        designWidth: 1290, designHeight: 2503, deviceWidth: screenWidth);
    return GetBuilder<JfChildrenLogic>(builder: (logic) {
      return Container(
        width: 1.sw,
        child: Stack(
          children: [
            Image(
              image: imageName!.png, width: 1.sw, fit: BoxFit.fitWidth,),
            Positioned(
              top: 25.w,
              right: 320.w,
              child: GetBuilder(
                builder: (AbcLogic c) {
                  return Text(
                    c.memberInfo.city,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      height: 1.0
                    ),
                  );
                },
                id: 'updateUI',
              ),)
          ],
        ),
      );
    });
  }
}
