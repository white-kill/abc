
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../utils/sp_util.dart';
import '../dio/network.dart';
import '../model/member_info_model.dart';
import '../net_config/apis.dart';


class AbcLogic extends GetxController {
  var showValue = false.obs;

  MemberInfoModel memberInfo = MemberInfoModel();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void onInit() {
    super.onInit();
    // memberInfoData();
  }

  Future memberInfoData() async {

    if (token == '') return;
    await Http.post(Apis.memberInfo).then((value) {
      if (value is Map<String, dynamic>) {
        memberInfo = MemberInfoModel.fromJson(value);
        update(['updateBalance','updateUI','updateCard']);
      }
    });

  }

  void showBalance({
    bool show = false,
  }) {
    showValue.value = show;
    update(['updateBalance', 'updateEyeBalance']);
  }

  String balance() {
    var formatter = NumberFormat();
    var formattedNumber = formatter.format(memberInfo.accountBalance);
    return formattedNumber;
  }

  String openOutlets(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.openOutlets;
    }
    return '--';
  }

  String openTime(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.openTime;
    }
    return '--';
  }

  String bankName(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankName;
    }
    return '--';
  }

  String cardInfo(){
    if(memberInfo.bankList.isNotEmpty){
      return '${memberInfo.bankList.first.bankName}（${memberInfo.bankList.first.bankCard.getLastFourByList()}）';
    }
    return '--';
  }

  String card({String space = ''}){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankCard.maskBankCardNumber(kg: space);
    }
    return '--';
  }

  String card1(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankCard;
    }
    return '--';
  }


  String cardFour(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankCard.getLastFourByList();
    }
    return '--';
  }
}
