import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/analysis_rank_model.dart';

AnalysisRankModel $AnalysisRankModelFromJson(Map<String, dynamic> json) {
  final AnalysisRankModel analysisRankModel = AnalysisRankModel();
  final List<
      AnalysisRankCategoryList>? categoryList = (json['categoryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AnalysisRankCategoryList>(
          e) as AnalysisRankCategoryList).toList();
  if (categoryList != null) {
    analysisRankModel.categoryList = categoryList;
  }
  final List<AnalysisRankRankList>? rankList = (json['rankList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AnalysisRankRankList>(e) as AnalysisRankRankList)
      .toList();
  if (rankList != null) {
    analysisRankModel.rankList = rankList;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    analysisRankModel.totalAmount = totalAmount;
  }
  return analysisRankModel;
}

Map<String, dynamic> $AnalysisRankModelToJson(AnalysisRankModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['categoryList'] = entity.categoryList.map((v) => v.toJson()).toList();
  data['rankList'] = entity.rankList.map((v) => v.toJson()).toList();
  data['totalAmount'] = entity.totalAmount;
  return data;
}

extension AnalysisRankModelExtension on AnalysisRankModel {
  AnalysisRankModel copyWith({
    List<AnalysisRankCategoryList>? categoryList,
    List<AnalysisRankRankList>? rankList,
    double? totalAmount,
  }) {
    return AnalysisRankModel()
      ..categoryList = categoryList ?? this.categoryList
      ..rankList = rankList ?? this.rankList
      ..totalAmount = totalAmount ?? this.totalAmount;
  }
}

AnalysisRankCategoryList $AnalysisRankCategoryListFromJson(
    Map<String, dynamic> json) {
  final AnalysisRankCategoryList analysisRankCategoryList = AnalysisRankCategoryList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    analysisRankCategoryList.name = name;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    analysisRankCategoryList.rate = rate;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    analysisRankCategoryList.count = count;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    analysisRankCategoryList.totalAmount = totalAmount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    analysisRankCategoryList.icon = icon;
  }
  final double? diffAmount = jsonConvert.convert<double>(json['diffAmount']);
  if (diffAmount != null) {
    analysisRankCategoryList.diffAmount = diffAmount;
  }
  return analysisRankCategoryList;
}

Map<String, dynamic> $AnalysisRankCategoryListToJson(
    AnalysisRankCategoryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['count'] = entity.count;
  data['totalAmount'] = entity.totalAmount;
  data['icon'] = entity.icon;
  data['diffAmount'] = entity.diffAmount;
  return data;
}

extension AnalysisRankCategoryListExtension on AnalysisRankCategoryList {
  AnalysisRankCategoryList copyWith({
    String? name,
    double? rate,
    int? count,
    double? totalAmount,
    String? icon,
    double? diffAmount,
  }) {
    return AnalysisRankCategoryList()
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..count = count ?? this.count
      ..totalAmount = totalAmount ?? this.totalAmount
      ..icon = icon ?? this.icon
      ..diffAmount = diffAmount ?? this.diffAmount;
  }
}

AnalysisRankRankList $AnalysisRankRankListFromJson(Map<String, dynamic> json) {
  final AnalysisRankRankList analysisRankRankList = AnalysisRankRankList();
  final int? idx = jsonConvert.convert<int>(json['idx']);
  if (idx != null) {
    analysisRankRankList.idx = idx;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    analysisRankRankList.bankCard = bankCard;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    analysisRankRankList.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    analysisRankRankList.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    analysisRankRankList.transactionTime = transactionTime;
  }
  return analysisRankRankList;
}

Map<String, dynamic> $AnalysisRankRankListToJson(AnalysisRankRankList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['idx'] = entity.idx;
  data['bankCard'] = entity.bankCard;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  return data;
}

extension AnalysisRankRankListExtension on AnalysisRankRankList {
  AnalysisRankRankList copyWith({
    int? idx,
    String? bankCard,
    String? excerpt,
    double? amount,
    String? transactionTime,
  }) {
    return AnalysisRankRankList()
      ..idx = idx ?? this.idx
      ..bankCard = bankCard ?? this.bankCard
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime;
  }
}