import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class YiJianBangKaPage extends StatelessWidget {
  YiJianBangKaPage({Key? key}) : super(key: key);

  final YiJianBangKaLogic logic = Get.put(YiJianBangKaLogic());
  final YiJianBangKaState state = Get.find<YiJianBangKaLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
