import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../../config/model/analysis_rank_model.dart';
import '../../../../../../../config/model/categiry_query_model.dart';
import 'category_detail_state.dart';

class Category_detailLogic extends GetxController {
  final Category_detailState state = Category_detailState();


  AnalysisRankCategoryList categoryModel = AnalysisRankCategoryList();


  List<CategiryQueryModel> list = [];

  bool isZc = true;

  @override
  void onInit() {
    super.onInit();
    categoryModel = Get.arguments?['model'];


    Http.get(Apis.incomeAnalysisCategoryQuery,queryParameters: {
      'dateTime': Get.arguments?['time']??'',
      'name':categoryModel.name
    }).then((v){
      if(v is List){
        list = v.map((e) => CategiryQueryModel.fromJson(e)).toList();
      }
      update(['updateUI']);
    });

  }

  String convertToChineseYearMonth() {
    try {
      // 1. 解析输入字符串为 DateTime 对象
      DateTime date = DateFormat("yyyy-MM").parse( Get.arguments?['time']??'');

      // 2. 使用 DateFormat 格式化为中文年月
      return DateFormat("yyyy年M月").format(date);
    } catch (e) {
      return "日期格式错误"; // 错误处理
    }
  }
}
