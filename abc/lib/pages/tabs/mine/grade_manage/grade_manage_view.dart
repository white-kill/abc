import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'grade_manage_logic.dart';
import 'grade_manage_state.dart';

class GradeManagePage extends BaseStateless {
  GradeManagePage({Key? key}) : super(key: key,title: '星级专区');

  final GradeManageLogic logic = Get.put(GradeManageLogic());
  final GradeManageState state = Get.find<GradeManageLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Image(image: 'bg_grade_gl1'.png3x,fit: BoxFit.fitWidth,),
      ],
    );
  }
}
