import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController psdTextController = TextEditingController();

  var protocolPersonal = false.obs;
  var protocolCustom = false.obs;
  LoginState() {
    ///Initialize variables
  }
}
