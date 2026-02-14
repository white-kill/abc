import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/analysis_rank_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/analysis_rank_model.g.dart';

@JsonSerializable()
class AnalysisRankModel {
	List<AnalysisRankCategoryList> categoryList = [];
	List<AnalysisRankRankList> rankList = [];
	double totalAmount = 0;

	AnalysisRankModel();

	factory AnalysisRankModel.fromJson(Map<String, dynamic> json) => $AnalysisRankModelFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisRankModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnalysisRankCategoryList {
	String name = '';
	double rate = 0;
	int count = 0;
	double totalAmount = 0;
	String icon = '';
	double diffAmount = 0;

	AnalysisRankCategoryList();

	factory AnalysisRankCategoryList.fromJson(Map<String, dynamic> json) => $AnalysisRankCategoryListFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisRankCategoryListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnalysisRankRankList {
	int idx = 0;
	String bankCard = '';
	String excerpt = '';
	double amount = 0;
	String transactionTime = '';

	AnalysisRankRankList();

	factory AnalysisRankRankList.fromJson(Map<String, dynamic> json) => $AnalysisRankRankListFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisRankRankListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}