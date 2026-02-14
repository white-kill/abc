import 'package:abc/pages/login/login_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();




  void goLogin() {
    if (state.phoneTextController.text == '') {
      '请输入手机号'.showToast;
      return;
    }

    if (state.protocolPersonal.value == false || state.protocolCustom.value == false) {
      '请先勾选同意书'.showToast;
      return;
    }

    Get.toNamed(Routes.login, arguments: {"account":state.phoneTextController.text});

  }
}
