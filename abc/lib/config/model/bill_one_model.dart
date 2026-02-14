import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/bill_one_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/bill_one_model.g.dart';

@JsonSerializable()
class BillOneModel {
	List<BillOneList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	BillOneCustomizeParam? customizeParam;

	BillOneModel();

	factory BillOneModel.fromJson(Map<String, dynamic> json) => $BillOneModelFromJson(json);

	Map<String, dynamic> toJson() => $BillOneModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillOneList {
	String id = '';
	String excerpt = '';
	String amount = '';
	String excerptName = '';
	String accountBalance = '';
	String day = '';
	String type ='';
	String transactionTime = '';
	String bankCard = '';
	BillOneListBillDetail? billDetail;
	String month = '';
	String year = '';
	String incomeTotal = '';
	String expensesTotal = '';
	String icon = '';

	BillOneList();

	factory BillOneList.fromJson(Map<String, dynamic> json) => $BillOneListFromJson(json);

	Map<String, dynamic> toJson() => $BillOneListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillOneListBillDetail {
	String id = '';
	String bankName = '';
	String bankCard = '';
	String account = '';
	String excerpt = '';
	String excerpt2 = '';
	double amount = 0;
	double accountBalance = 0;
	String transactionTime = '';
	String oppositeAccount = '';
	String oppositeBankName = '';
	String accountsTime = '';
	String merchantBranch = '';
	String oppositeName = '';
	String type = '';
	String excerptName = '';
	String transactionType = '';
	String categoryIcon = '';
	String transactionCategory = '';

	BillOneListBillDetail();

	factory BillOneListBillDetail.fromJson(Map<String, dynamic> json) => $BillOneListBillDetailFromJson(json);

	Map<String, dynamic> toJson() => $BillOneListBillDetailToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillOneCustomizeParam {
	String queryTime = '';
	int pageNum = 0;
	String totalKeyList = '';

	BillOneCustomizeParam();

	factory BillOneCustomizeParam.fromJson(Map<String, dynamic> json) => $BillOneCustomizeParamFromJson(json);

	Map<String, dynamic> toJson() => $BillOneCustomizeParamToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}