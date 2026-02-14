import 'package:abc/config/model/record_detail_model.dart';
import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/details_query_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/details_query_model.g.dart';

@JsonSerializable()
class DetailsQueryModel {
	List<DetailsQueryList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	DetailsQueryModel();

	factory DetailsQueryModel.fromJson(Map<String, dynamic> json) => $DetailsQueryModelFromJson(json);

	Map<String, dynamic> toJson() => $DetailsQueryModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DetailsQueryList {
	String id = '';
	String excerpt = '';
	String type = '';
	String amount = '';
	String accountBalance = '';
	String merchantBranch = '';
	String day = '';
	RecordDetailModel? billDetail;

	DetailsQueryList();

	factory DetailsQueryList.fromJson(Map<String, dynamic> json) => $DetailsQueryListFromJson(json);

	Map<String, dynamic> toJson() => $DetailsQueryListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}