import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cunkuan_page_state.dart';

class Cunkuan_pageLogic extends GetxController {
  var navActionColor = Colors.white.obs;
  final Cunkuan_pageState state = Cunkuan_pageState();

  void changeShowMony() {
    state.showMony.value = !state.showMony.value;
  }
}
