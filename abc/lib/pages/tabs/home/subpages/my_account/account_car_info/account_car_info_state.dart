import 'package:flutter/cupertino.dart';

class Account_car_infoState {

  TextEditingController registrationController = TextEditingController();
  TextEditingController openOutletsController = TextEditingController();
  TextEditingController cardStatusController = TextEditingController();
  TextEditingController accountStatusController = TextEditingController();
  TextEditingController defaultAccountController = TextEditingController();

  List tagTitle = [
    '挂失',
    '改密',
    '密码解锁',
    '更多',
  ];
  Account_car_infoState() {
    ///Initialize variables
  }
}
