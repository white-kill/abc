import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'setting_logic.dart';
import 'setting_state.dart';

class SettingPage extends BaseStateless {
  SettingPage({Key? key}) : super(key: key,title: '设置');

  final SettingLogic logic = Get.put(SettingLogic());
  final SettingState state = Get.find<SettingLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Image(image: 'bg_setting_gl'.png3x,fit: BoxFit.fitWidth,),
      ],
    );
  }
}
