import 'package:abc/pages/tabs/life/children/mydy/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'children/cxfw/view.dart';
import 'life_state.dart';

class LifeLogic extends GetxController {
  var navActionColor = Colors.white.obs;
  final LifeState state = LifeState();

  var bottomImg = 'life_tag_jx'.obs;

  void jumpPage(index){
    print(index);
    if(index == 0){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '校园',
        'image': 'xy',
        'top':0,
        'right':true
      });
    }
    if(index == 1){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '食堂',
        'image': 'ct',
        'top':0,
        'right':true
      });
    }
    if(index == 2){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '服务授权',
        'image': 'fwsq',
        'top':0,
        'background':Colors.white,
        'right':true
      });
    }
    if(index == 3){}
    if(index == 4){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '社保医保',
        'image': 'sbyb',
        'top':0,
      });
    }
    if(index == 5){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '低碳空间',
        'image': 'dtkj',
        'top':0,
        'right':true
      });
    }
    if(index == 6){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '优惠卡券',
        'image': 'yhkq',
        'top':0,
        'right':true
      });
    }
    if(index == 7){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '京东特惠',
        'image': 'life_jdth',
        'top':0,
        'right':true
      });
    }
    if(index == 8){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '城市专区',
        'image': 'life_cszq',
        'top':0,
        'right':true
      });
    }
    if(index == 9){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '热门活动',
        'image': 'life_rmhd',
        'top':0,
        'right':true
      });
    }
    if(index == 10){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '公益捐款',
        'image': 'life_gyjk',
        'top':0,
        'right':true
      });
    }
    if(index == 11){
      Get.toNamed(Routes.lifeMssh);
    }

    if(index == 13){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '乡村集市',
        'image': 'xcjs',
      });
    }
    if(index == 14){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '名酒会',
        'image': 'life_mjh',
        'top':0,
        'right':true
      });
    }
    if(index == 12){
      Get.to(MydyPage());
    }
    if(index == 15){
      Get.to(CxfwPage());
    }
  }
}
