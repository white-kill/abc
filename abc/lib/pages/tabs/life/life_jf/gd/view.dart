import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/pages/tabs/life/life_jf/gd/state.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class JFMorePage extends BaseStateless {
  String? imageName;
  JFMorePage({Key? key, int? index}) : super(key: key, title: '生活缴费');


  final Jf_moreLogic logic = Get.put(Jf_moreLogic());
  final Jf_moreState state = Get
      .find<Jf_moreLogic>()
      .state;


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {

    return GetBuilder<Jf_moreLogic>(builder: (logic) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(image: 'jf_more_top'.png, fit: BoxFit.fitWidth,),
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
            Image(image: 'jf_more_1'.png3x),
            Image(image: 'jf_more_2'.png3x),
            Image(image: 'jf_more_3'.png3x),
            Image(image: 'jf_more_4'.png3x),
            Image(image: 'jf_more_5'.png3x),
          ],
        ),
      );
    });
  }
}
