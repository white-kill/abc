import 'package:abc/config/dio/network.dart';
import 'package:abc/config/model/month_data_model.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:abc/pages/tabs/home/subpages/month_bill/month_widget/month_widget_view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'month_widget_state.dart';

class Month_widgetLogic extends GetxController {
  final Month_widgetState state = Month_widgetState();


  MonthDataModel dataModel = MonthDataModel();

  var switchValue = true.obs;
  @override
  void onInit() {
    super.onInit();

    String time = DateUtil.formatDate(DateTime(DateTime.now().year, DateTime.now().month - 1), format:DateFormats.y_mo);

    Http.get(Apis.monthBill,queryParameters: {
      'dateTime':time,
    }).then((v){
      dataModel = MonthDataModel.fromJson(v);
      changeIndex(0);
      update(['UpdateUI']);
    });
  }

  String totalAmount = '';
  String totalAmountDiff = '';
  void changeIndex(int index){
    state.data1.clear();
   if(index == 0){
     dataModel.expenses?.list.forEach((e){
       int idx = dataModel.expenses!.list.indexOf(e);
       List cList = [1,3,5,7,9.11,13.15,17];
       bool one = cList.contains(idx);
       state.data1.add(SalesData(e.excerpt, e.amount, one?Color(0xff52B595):Color(0xff459B7F)));
     });
     totalAmount =  dataModel.expenses?.totalAmount??'';
     totalAmountDiff =  (dataModel.expenses?.totalAmountDiff??'') == ''?'0':(dataModel.income?.totalAmountDiff??'');
   }
   if(index == 1){
     dataModel.income?.list.forEach((e){
       int idx = dataModel.income!.list.indexOf(e);
       List cList = [1,3,5,7,9.11,13.15,17];
       bool one = cList.contains(idx);
       state.data1.add(SalesData(e.excerpt, e.amount,one?Color(0xffF3AD3C):Color(0xffC28B2E)));
     });
     totalAmount =  dataModel.income?.totalAmount??'';
     totalAmountDiff =  (dataModel.income?.totalAmountDiff??'') == ''?'0':(dataModel.income?.totalAmountDiff??'');
   }
    update(['updateChat']);
  }

  bool isFuck(String diff){

    return diff == '持平';
  }
}
