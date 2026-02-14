import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../home_logic.dart';
import 'two_level_logic.dart';
import 'two_level_state.dart';

class TwoLevelPage extends StatelessWidget {
  TwoLevelPage({Key? key}) : super(key: key);

  final TwoLevelLogic logic = Get.put(TwoLevelLogic());
  final TwoLevelState state = Get.find<TwoLevelLogic>().state;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image:'two_level'.png3x,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70.w,
        width: 1.sw,
      ).withOnTap(onTap: () {
        // 关闭二楼，回到首页
        final homeLogic = Get.find<HomeLogic>();
        homeLogic.state.refreshController1.twoLevelComplete();
      }),
    );
  }
}
