import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fixed_nav_state.dart';

class FixedNavLogic extends GetxController {
  final FixedNavState state = FixedNavState();

  Widget? bottomNav;

  late bool rightShare;

  @override
  void onInit() {
    super.onInit();
    state.assetsImagePath = Get.arguments?['image']??'';
    state.fullImagePath = Get.arguments?['fullImagePath']??'';
    state.assetsImagePathList = Get.arguments?["imageList"];
    bottomNav = Get.arguments?["bottomWidget"];
    rightShare = Get.arguments?["rightShare"] ?? false;
  }
}
