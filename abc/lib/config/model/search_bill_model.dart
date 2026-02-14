import 'package:abc/config/model/bill_one_model.dart';
import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/search_bill_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/search_bill_model.g.dart';

@JsonSerializable()
class SearchBillModel {
	List<SearchBillList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	SearchBillModel();

	factory SearchBillModel.fromJson(Map<String, dynamic> json) => $SearchBillModelFromJson(json);

	Map<String, dynamic> toJson() => $SearchBillModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchBillList {
	String id = '';
	String excerpt = '';
	String amount = '';
	String accountBalance = '';
	String type = '';
	String day = '';
	BillOneListBillDetail? billDetail;
	String transactionTime = '';
	String bankCard = '';
	String icon = '';

	SearchBillList();

	factory SearchBillList.fromJson(Map<String, dynamic> json) => $SearchBillListFromJson(json);

	Map<String, dynamic> toJson() => $SearchBillListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}