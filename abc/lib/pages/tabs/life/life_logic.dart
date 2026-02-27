import 'package:abc/pages/tabs/life/children/mydy/view.dart';
import 'package:abc/pages/tabs/life/life_jf/life_jf_view.dart';
import 'package:abc/pages/tabs/life/life_ms/life_ms_view.dart';
import 'package:abc/pages/tabs/life/phone/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../mine/xiaodou/xiaodou_view.dart';
import 'children/cxfw/view.dart';
import 'life_state.dart';

class LifeLogic extends GetxController {
  var navActionColor = Colors.black.obs;
  final LifeState state = LifeState();

  var bottomImg = 'life_tag_jx'.obs;

  void jumpPage(index){
    print(index);
    // 0生活缴费 1手机充值 2政务民生 3社保医保 4小豆乐园 5校园 6食堂 7党费 8车主服务 9农银商城 10美团优惠 11低碳生活 12萌宠服务 13京东特惠 14城市专区 15优惠卡卷 16影票 17出行 18公益捐款 19名酒惠
    if(index == 0){
      Get.to(() => Life_jfPage());
    }
    if(index == 1){
      Get.to(() => PhonePage());
    }
    if(index == 2){
      Get.to(() => Life_msPage());
    }
    if(index == 3){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '社保医保',
        'image': 'sbyb',
        'top': 0,
      });
    }
    if(index == 4){
      Get.to(() => XiaodouPage());
    }
    if(index == 5){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '校园',
        'image': 'xy',
        'top': 0,
        'right': true
      });
    }
    if(index == 6){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '食堂',
        'image': 'ct',
        'top': 0,
        'right': true
      });
    }
    // if(index == 7){ 党费 - 暂无
    // }
    // if(index == 8){ 车主服务 - 暂无
    // }
    if(index == 9){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '农银商城',
        'image': 'bg_nysc',
      });
    }
    // if(index == 10){ 美团优惠 - 暂无
    // }
    if(index == 11){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '低碳生活',
        'image': 'dtkj',
        'top': 0,
        'right': true
      });
    }
    // if(index == 12){ 萌宠服务 - 暂无
    // }
    if(index == 13){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '京东特惠',
        'image': 'life_jdth',
        'top': 0,
        'right': true
      });
    }
    if(index == 14){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '城市专区',
        'image': 'life_cszq',
        'top': 0,
        'right': true
      });
    }
    if(index == 15){
      Get.toNamed(Routes.couponPage);
    }
    if(index == 16){
      Get.to(() => MydyPage());
    }
    if(index == 17){
      Get.to(() => CxfwPage());
    }
    if(index == 18){
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '公益捐款',
        'image': 'gyjkuan',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    }
    if(index == 19){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '名酒惠',
        'image': 'life_mjh',
        'top': 0,
        'right': true
      });
    }
    // if(index == 0){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '校园',
    //     'image': 'xy',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 1){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '食堂',
    //     'image': 'ct',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 2){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '服务授权',
    //     'image': 'fwsq',
    //     'top':0,
    //     'background':Colors.white,
    //     'right':true
    //   });
    // }
    // if(index == 3){}
    // if(index == 4){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '社保医保',
    //     'image': 'sbyb',
    //     'top':0,
    //   });
    // }
    // if(index == 5){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '低碳空间',
    //     'image': 'dtkj',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 6){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '优惠卡券',
    //     'image': 'yhkq',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 7){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '京东特惠',
    //     'image': 'life_jdth',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 8){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '城市专区',
    //     'image': 'life_cszq',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 9){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '热门活动',
    //     'image': 'life_rmhd',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 10){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '公益捐款',
    //     'image': 'life_gyjk',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 11){
    //   Get.toNamed(Routes.lifeMssh);
    // }
    //
    // if(index == 13){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '乡村集市',
    //     'image': 'xcjs',
    //   });
    // }
    // if(index == 14){
    //   Get.toNamed(Routes.fixedNavPage, arguments: {
    //     'title': '名酒会',
    //     'image': 'life_mjh',
    //     'top':0,
    //     'right':true
    //   });
    // }
    // if(index == 12){
    //   Get.to(MydyPage());
    // }
    // if(index == 15){
    //   Get.to(CxfwPage());
    // }
  }
}
