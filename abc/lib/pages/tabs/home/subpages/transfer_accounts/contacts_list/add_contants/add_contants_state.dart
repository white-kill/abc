import 'package:flutter/cupertino.dart';

class AddContactsState {

  List titleNames = [
    '帐号类型',
    '',
    '户名',
    '帐号',
    '开户银行',
    '',
    '开户省份',
    '开户城市',
    '开户网点',
    '',
    '标签',
    '备注',
    'bottom'
  ];

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  AddContactsState() {
    ///Initialize variables
  }
}
