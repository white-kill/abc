import 'package:abc/config/model/month_bill_model.dart';
import 'package:flutter/material.dart';

import 'month_widget_view.dart';
class Month_widgetState {
  Month_widgetState() {
    ///Initialize variables
  }

  MonthBillModel billModel = MonthBillModel();
  List<SalesData> data1 = [
    //  SalesData('其他支出', 70, Color(0xff459B7F)),
    // SalesData('三方转出', 30, Color(0xff52B595)),
  ];
}
