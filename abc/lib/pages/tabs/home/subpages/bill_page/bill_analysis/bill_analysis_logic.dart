import 'dart:ui';

import 'package:abc/config/dio/network.dart';
import 'package:abc/config/model/analysis_chat_model.dart';
import 'package:abc/config/model/analysis_rank_model.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:get/get.dart';

import 'bill_analysis_state.dart';

class BillAnalysisLogic extends GetxController {
  final BillAnalysisState state = BillAnalysisState();

  var isZc = true.obs;

  Color chatColor = Color(0xff03B696);

  AnalysisRankModel analysisRankModel = AnalysisRankModel();

  int selectedIndex = 11;

  var switchValue = true.obs;

  double totalAmount = 0;

  var showMore = false;

  @override
  void onInit() {
    super.onInit();
    state.time = Get.arguments?['m'] ?? '';

    incomeAnalysis();
    incomeAnalysisRank();
  }

  void incomeAnalysis() {
    Http.get(Apis.incomeAnalysis,
        queryParameters: {'type': isZc.value ? '2' : '1'}).then((v) {
      state.chartData1.clear();
      if (v is List) {
        state.dataList = v.map((e) => AnalysisChatModel.fromJson(e)).toList();
        for (var e in state.dataList) {
          state.chartData1.add(ChartData(e.day, e.amount.abs()),);
        }
      }
      update(['updateChat']);
    });
  }

  int listCount(){
    if(analysisRankModel.categoryList.length<5){
      return analysisRankModel.categoryList.length;
    }else{
      if(showMore) return analysisRankModel.categoryList.length;
      return 4;
    }
  }

  void incomeAnalysisRank() {
    Http.get(Apis.incomeAnalysisRank, queryParameters: {
      'dateTime': state.time,
      'type': isZc.value ? '2' : '1'
    }).then((v) {
      totalAmount = 0;
      analysisRankModel = AnalysisRankModel.fromJson(v);
      analysisRankModel.categoryList.forEach((e){
        totalAmount = totalAmount+e.totalAmount;
      });
      update(['updateList']);
    });
  }
}
