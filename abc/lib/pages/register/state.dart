import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterState {
  TextEditingController phoneTextController = TextEditingController();

  var protocolPersonal = false.obs;
  var protocolCustom = false.obs;
  RegisterState() {
    ///Initialize variables
  }
}
