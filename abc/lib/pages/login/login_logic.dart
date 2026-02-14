import 'package:abc/utils/sp_util.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../config/app_config.dart';
import '../../config/dio/network.dart';
import '../../config/net_config/apis.dart';
import '../../routes/app_pages.dart';
import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  String account = "";

  String pwd = "";

  @override
  void onInit() {
    print("account ${Get.arguments}");
    account = Get.arguments?["account"];

    super.onInit();
  }

  void goLogin() {

    if (pwd == '') {
      '请输入密码'.showToast;
      return;
    }

    print(account);
    print(state.psdTextController.text);
    Http.post(Apis.login, data: {
      "username": account.removeAllWhitespace,
      "password": pwd
    }).then((value) {
      if (value != null && value['access_token'] != '') {
        'Bearer ${value['access_token']}'.saveToken;
        Http.setHeaders({'Authorization':token});
        AppConfig.config.abcLogic
            .memberInfoData()
            .then((v) => Get.offAllNamed(Routes.tabs));
      }
    });
  }


}
