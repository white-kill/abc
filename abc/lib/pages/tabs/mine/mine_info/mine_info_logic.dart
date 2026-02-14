import 'dart:convert';

import 'package:abc/utils/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'mine_info_state.dart';

class MineInfoLogic extends GetxController {
  final MineInfoState state = MineInfoState();


  TextEditingController emailCtrl = TextEditingController();

  TextEditingController areCodeCtrl = TextEditingController();
  TextEditingController callCodeCtrl = TextEditingController();

  TextEditingController provinceCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();

  TextEditingController detailPlaceCtrl = TextEditingController();

  TextEditingController posCodeCtrl = TextEditingController();



  @override
  void onInit() {
    super.onInit();
    _loadUserInfo();
  }

  // 加载用户信息并设置初始值
  void _loadUserInfo() {
    try {
      String? json = userInfo;
      
      if (json != null && json.isNotEmpty) {
        Map<String, dynamic> userData = jsonDecode(json);
        
        // 为 TextField 控制器设置初始值
        emailCtrl.text = userData['email'] ?? '';
        areCodeCtrl.text = userData['areaCode'] ?? '';
        callCodeCtrl.text = userData['phoneNumber'] ?? '';
        provinceCtrl.text = userData['province'] ?? '';
        cityCtrl.text = userData['city'] ?? '';
        countryCtrl.text = userData['district'] ?? '';
        detailPlaceCtrl.text = userData['detailAddress'] ?? '';
        posCodeCtrl.text = userData['postalCode'] ?? '';
        
        print('已加载用户信息: $json');
      } else {
        print('未找到保存的用户信息，使用默认值');
        _setDefaultValues();
      }
    } catch (e) {
      print('解析用户信息失败: $e');
      _setDefaultValues();
    }
  }

  // 设置默认值
  void _setDefaultValues() {
    emailCtrl.text = '';
    areCodeCtrl.text = '';
    callCodeCtrl.text = '';
    provinceCtrl.text = '';
    cityCtrl.text = '';
    countryCtrl.text = '';
    detailPlaceCtrl.text = '';
    posCodeCtrl.text = '';
  }



  saveValue() {
    // 收集所有 TextField 的内容
    Map<String, dynamic> formData = {
      'email': emailCtrl.text,
      'areaCode': areCodeCtrl.text,
      'phoneNumber': callCodeCtrl.text,
      'province': provinceCtrl.text,
      'city': cityCtrl.text,
      'district': countryCtrl.text,
      'detailAddress': detailPlaceCtrl.text,
      'postalCode': posCodeCtrl.text,
    };

    // 转换为 JSON 字符串
    String jsonString = jsonEncode(formData);
    
    print('收集的表单数据: $jsonString');

    jsonString.saveUserInfo;


  }


}
