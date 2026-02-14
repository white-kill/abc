import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../dialog/custom_dialog.dart';
import 'netpoint_page_logic.dart';
import 'netpoint_page_state.dart';

class Netpoint_pagePage extends BaseStateless {
  Netpoint_pagePage({Key? key}) : super(key: key);

  final Netpoint_pageLogic logic = Get.put(Netpoint_pageLogic());
  final Netpoint_pageState state = Get.find<Netpoint_pageLogic>().state;

  @override
  Widget? get titleWidget => Text('网点服务',style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),);
  bool hasDialogShown = false;
  void _showCustomDialog(BuildContext context) {
    CustomDialog.show(
      context: context,
      title: '温馨提示',
      content: '开启定位服务，获取精准网点推荐',
      // 可选的自定义参数
      cancelText: '暂时不了',
      confirmText: '立即开启',
      iconColor: Colors.orange,
      confirmButtonColor: Colors.orange,
      barrierDismissible: false,
      width: 330.w,
      height: 170.h,
    );
  }
  @override
  Widget initBody(BuildContext context) {
    // 在页面构建完成后延迟显示弹窗
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (!hasDialogShown) {
          hasDialogShown = true;
          _showCustomDialog(context);
        }
      });
    });
    return ListView(
      children: [
        Image(
          fit: BoxFit.fitWidth,
          image: ('netp_big_image').png3x,
        )
      ]
    );
  }
}
