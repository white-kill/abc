import 'package:abc/pages/register/view.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../routes/app_pages.dart';
import '../../utils/sp_util.dart';
import '../index/index_view.dart';
import '../login/login_view.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 1),(){
      // Get.to(() => IndexPage(),transition: Transition.noTransition);
      Get.offAll(() => token.isNullOrEmpty ? RegisterPage() : IndexPage(),transition: Transition.noTransition);
    });
  }
}
