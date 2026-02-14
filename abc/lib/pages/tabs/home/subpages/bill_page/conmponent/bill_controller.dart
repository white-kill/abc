import 'package:flutter/cupertino.dart';

import '../bill_req.dart';

class BillController extends ChangeNotifier {


  String type = '';
  String orderSort = '';
  changeType(String key){
    orderSort = key;
    type = 'changeType';
    notifyListeners();
  }

  String beginTime = '';
  String endTime = '';
  BillReq? billReq1;
  changeTime({String begin = '',String end = '',required BillReq billReq}){
    beginTime = begin;
    endTime = end;
    billReq1 = billReq;
    type = 'changeTime';
    notifyListeners();
  }

  String keyword = '';
  changeKeyword(String key){
    keyword = key;
    type = 'changeKeyword';
    notifyListeners();
  }
}