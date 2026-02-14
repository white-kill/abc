import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/dio/network.dart';
import '../../../../../config/model/contacts_model.dart';
import '../../../../../config/net_config/apis.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/sp_util.dart';
import '../phone_recive/phone_widget/phone_widget_view.dart';
import 'transfer_accounts_state.dart';

class TransferAccountsLogic extends GetxController {
  var showAll = false.obs;
  var isContactsExpanded = false.obs; // 联系人列表展开状态，默认向下（false）
  final TransferAccountsState state = TransferAccountsState();

  @override
  void onInit() {
    super.onInit();

    // 1. 先读取本地缓存数据
    _loadLocalData();
    
    // 2. 同时请求网络数据
    _fetchNetworkData();
  }
  
  /// 读取本地缓存数据
  void _loadLocalData() {
    String cachedData = spContactList;
    if (cachedData.isNotEmpty) {
      try {
        List<dynamic> jsonList = jsonDecode(cachedData);
        state.contactsModelList = jsonList.map((e) => ContactsModel.fromJson(e)).toList();
        update(['updateBanList']);
      } catch (e) {
        // 解析失败，忽略缓存
      }
    }
  }
  
  /// 请求网络数据
  void _fetchNetworkData() {
    Http.get(Apis.contactsList).then((v) {
      if (v is List) {
        state.contactsModelList = v.map((e) => ContactsModel.fromJson(e)).toList();
        
        // 3. 更新本地缓存
        jsonEncode(v).saveContactList;
        
        // 4. 更新展示
        update(['updateBanList']);
      }
    });
  }
  jumpPage(String name) {
    print(name);
    if (name == '预约转账') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '我的预约转账',
        'image': 'yyuezhuanzhang',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    } else if (name == '转账撤销') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '转账撤销',
        'image': 'zhanzchexiao',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    }
    else if (name == '信用卡还款') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '信用卡还款',
        'image': 'xykhk',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    } else if (name == '公益捐款') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '公益捐款',
        'image': 'gyjkuan',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    }
    else if (name == '跨境服务') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '跨境还款',
        'image': 'kjhkuan',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    } else if (name == '向多人转账') {
      Get.toNamed(Routes.changeNavi, arguments: {
        'title': '向多人转账',
        'image': 'drzzhang',
        'offset': true,
        'defTitleColor': Colors.black,
      });
    }
    else if (name == '他行卡转入') {
      Get.toNamed(Routes.taHangZhuanRu);
    }
    else if (name == '手机号收款') {
      Get.to(() => Phone_widgetPage());
    }
  }

}
