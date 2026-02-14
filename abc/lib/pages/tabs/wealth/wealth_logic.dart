import 'package:abc/pages/tabs/wealth/children/bx/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../home/subpages/cunkuan_page/cunkuan_page_view.dart';
import '../home/subpages/home_all/home_all/home_all_view.dart';
import 'wealth_state.dart';

class WealthLogic extends GetxController {
  final WealthState state = WealthState();

  @override
  bool get wantKeepAlive => true; // 关键：返回true表示保持状态

  ScrollController scrollController = ScrollController();



  void changeShowMony() {
    state.showMony.value = !state.showMony.value;
  }

  void jumpPage(index){
    if(index == 0){
      Get.to(() => Cunkuan_pagePage());
    }
    if(index == 1){
      Get.toNamed(Routes.cflccp);
    }
    if(index == 2){
      Get.toNamed(Routes.cfjj);
    }
    if(index == 3){
      Get.toNamed(Routes.cfgjs);
    }
    if(index == 4){
      Get.toNamed(Routes.cfzq);
    }
    if(index == 5){
      Get.to(CfbxPage());
    }
    if(index == 6){
      Get.toNamed(Routes.cfzqqh);
    }
    if(index == 7){
      Get.toNamed(Routes.cfwh);
    }
    if(index == 8){
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '个人养老金',
        'image': 'grylj',
        'offset':false,
        'defTitleColor': Colors.black,
      });
    }
    if(index == 9){
      Get.to(() => Home_allPage());
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}