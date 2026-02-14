import 'dart:convert';

import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/bill_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/dio/network.dart';
import '../../../../../config/model/bill_one_model.dart';
import '../../../../../config/net_config/apis.dart';
import '../../../../../utils/sp_util.dart';
import 'bill_page_state.dart';

class BillPageLogic extends GetxController {
  final BillPageState state = BillPageState();

  bool showFirst = true;
  bool pageNumOne = true;
  bool isLoad = false;

  @override
  void onInit() {
    super.onInit();
    state.controller.addListener(_scrollListener);
    
    // 1. 先读取本地缓存数据
    _loadLocalData();
    
    // 2. 同时请求网络数据
    getData();
  }
  
  /// 读取本地缓存数据
  void _loadLocalData() {
    String cachedData = spBillData;
    if (cachedData.isNotEmpty) {
      try {
        Map<String, dynamic> jsonData = jsonDecode(cachedData);
        state.oneModel = BillOneModel.fromJson(jsonData);
        state.incomeTotal = state.oneModel.incomeTotal;
        state.expensesTotal = state.oneModel.expensesTotal;
        state.oneList = state.oneModel.list;
        showFirst = false;
        update(['updateUI']);
      } catch (e) {
        // 解析失败，忽略缓存
      }
    }
  }

  void _scrollListener() async{
    if (state.controller.position.pixels >
        state.controller.position.maxScrollExtent - 300) {
      // if (isLoad) return;
      // isLoad = true;
      // state.reqData.pageNum++;
      pageNumOne = false;
     await getData();
    }
  }

  @override
  void onClose() {
    state.controller.removeListener(_scrollListener);
    state.controller.dispose();
    super.onClose();
  }

  Future getData() async {
    if (isLoad) return;
    isLoad = true;
    if ( state.reqData.pageNum == 1) {
      "".showLoading;
      Future.delayed(Duration(milliseconds: 500), () {
        SmartDialog.dismiss(status: SmartStatus.loading);
      });
    }
    await Http.get(
      Apis.billPagePayment,
      isLoading: false,
      queryParameters: state.reqData.toJson(),
    )
        .then((value) {
      print('开始打印了啊');
          print(value);
      state.oneModel = BillOneModel.fromJson(value);
      if (pageNumOne) {
        state.incomeTotal = state.oneModel.incomeTotal;
        state.expensesTotal = state.oneModel.expensesTotal;
      }
      if (pageNumOne) {
        state.oneList = state.oneModel.list;
        
        // 3. 第一页数据更新本地缓存
        jsonEncode(value).saveBillData;
      } else {
        state.oneList = state.oneList + state.oneModel.list;
      }
      state.refreshController.loadComplete();
      if (!state.oneModel.list.isNotEmpty) {
        state.refreshController.loadNoData();
      }else {
        state.reqData.queryTime = state.oneModel.customizeParam?.queryTime ?? '';
        state.reqData.endPageTime = state.oneModel.list.last.transactionTime;
        state.reqData.totalKeyList = state.oneModel.customizeParam?.totalKeyList ?? '';
        state.reqData.pageNum = state.oneModel.customizeParam?.pageNum ?? 1;
      }
      isLoad = false;
      showFirst = false;
      update(['updateUI']);
    });
  }

  void openPermanentDialog() {
    // 先关闭已存在的弹窗，避免叠加
    SmartDialog.dismiss(tag: 'billFilter');
    SmartDialog.show(
      tag: 'billFilter',
      alignment: Alignment.bottomCenter,
      animationType: SmartAnimationType.fade,
      maskColor: Colors.transparent,
      builder: (_) {
        return BillFilterWidget();
      },
    );
  }

  void sureTime() {
    state.isDay = state.isTemDay;
    if (state.isDay) {
      state.queryTime = state.temQueryTime;
      state.reqData.queryTime = state.queryTime;
      state.reqData.pageNum = 1;
      state.reqData.endPageTime = '';
      state.reqData.totalKeyList = '';
      state.reqData.maxAmount = state.amountController2.text;
      state.reqData.minAmount = state.amountController1.text;
      pageNumOne = true;
      getData().then((e) {
        state.controller.jumpTo(0);
      });
    } else {
      state.queryTime = '';
      state.reqData.queryTime ='';
      state.reqData.pageNum = 1;
      state.reqData.endPageTime = '';
      state.reqData.totalKeyList = '';
      state.beginTime = state.temBeginTime;
      state.endTime = state.temEndTime;
      state.reqData.maxAmount = state.amountController2.text;
      state.reqData.minAmount = state.amountController1.text;
      state.billController.changeTime(
        begin: state.beginTime,
        end: state.endTime,
        billReq: state.reqData
      );
    }
    update(['updateUI', 'upDateTopWidget']);
  }

  void sureFilter() {
    state.expensesTypeList.clear();
    state.expensesTypeList.addAll(state.temExpensesTypeList);
    state.incomeTypeList.clear();
    state.incomeTypeList.addAll(state.temIncomeTypeList);
    state.financialTransactionsList.clear();
    state.financialTransactionsList.addAll(state.temFinancialTransactionsList);
    state.reqData.pageNum = 1;
    state.reqData.endPageTime = '';
    state.reqData.totalKeyList = '';
    state.reqData.expensesType = state.expensesTypeList.join(',');
    state.reqData.incomeType = state.incomeTypeList.join(',');
    state.reqData.financialTransactions =
        state.financialTransactionsList.join(',');
    state.reqData.maxAmount = state.amountController2.text;
    state.reqData.minAmount = state.amountController1.text;
    state.reqData.queryTime = state.temQueryTime;
    pageNumOne = true;
    if (state.isDay) {
      print(state.reqData.toJson());
      getData().then((e) {
        state.controller.jumpTo(0);
      });
    }else {
      print(state.reqData.toJson());
      state.billController.changeTime(
          begin: state.beginTime,
          end: state.endTime,
          billReq: state.reqData
      );
    }

  }
}
