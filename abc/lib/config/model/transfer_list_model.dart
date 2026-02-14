import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/transfer_list_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/transfer_list_model.g.dart';

@JsonSerializable()
class TransferListModel {
	List<TransferListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	TransferListModel();

	factory TransferListModel.fromJson(Map<String, dynamic> json) => $TransferListModelFromJson(json);

	Map<String, dynamic> toJson() => $TransferListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TransferListList {
	String id = '';
	double amount = 0;
	String transactionTime = '';
	String dateTime = '';
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String currency = '';

	TransferListList();

	factory TransferListList.fromJson(Map<String, dynamic> json) => $TransferListListFromJson(json);

	Map<String, dynamic> toJson() => $TransferListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}