import 'package:get/get.dart';

import '../../../../config/app_config.dart';
import 'phone_state.dart';

class PhoneLogic extends GetxController {
  final PhoneState state = PhoneState();

  String formatPhoneNumber(String phone) {
    if (phone.length >= 3 && phone.length <= 7) {
      return '${phone.substring(0, 3)} ${phone.substring(3)}';
    } else if (phone.length > 7) {
      return '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7)}';
    }
    return phone;
  }

  String phone(){
    return formatPhoneNumber(AppConfig.config.abcLogic.memberInfo.phone);
  }
}
