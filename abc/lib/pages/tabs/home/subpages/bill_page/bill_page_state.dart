import 'package:abc/pages/tabs/other/sheet_widget/picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../config/model/bill_one_model.dart';
import 'bill_req.dart';
import 'conmponent/bill_controller.dart';

class BillPageState {

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  DateTimePickerNotifier pickerNotifier = DateTimePickerNotifier();

  BillReq reqData = BillReq();

  BillOneModel oneModel = BillOneModel();
  List<BillOneList> oneList = [];


  String beginTime = '';
  String temBeginTime = '';
  String endTime = '';
  String temEndTime = '';

  bool isDay = true;
  bool isTemDay = true;


  BillController billController =  BillController();


  String queryTime = '';
  String temQueryTime = '';


  String incomeTotal = '';
  String expensesTotal = '';


  List incomeTypeList = [];
  List temIncomeTypeList = [];

  List expensesTypeList = [];
  List temExpensesTypeList = [];

  List financialTransactionsList = [];
  List temFinancialTransactionsList = [];

  TextEditingController amountController1 = TextEditingController();
  TextEditingController amountController2 = TextEditingController();

  // incomeType
  // string
  // 可选
  // 收入类型（多个逗号分割）
  // expensesType
  // string
  // 可选
  // 支出类型（多个逗号分割）
  // financialTransactions
  // string
  // 可选
  // 资金往来（多个逗号分割）

  BillPageState() {
    ///Initialize variables
    // 获取当前日期
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM');
    String formattedDate = formatter.format(now); // "2024-12-31"
    queryTime = formattedDate;
    temQueryTime = queryTime;
    reqData.queryTime = formattedDate;

    var formatter2 = DateFormat('yyyy-MM-dd');
    beginTime = '2021-01-01';
    temBeginTime = '2021-01-01';
    endTime = formatter2.format(now);
    temEndTime = formatter2.format(now);
  }
}
