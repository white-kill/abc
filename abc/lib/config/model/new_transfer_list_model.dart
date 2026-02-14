import 'package:abc/config/model/record_detail_model.dart';
import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/new_transfer_list_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/new_transfer_list_model.g.dart';

@JsonSerializable()
class NewTransferListModel {
	List<NewTransferListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	NewTransferListModel();

	factory NewTransferListModel.fromJson(Map<String, dynamic> json) => $NewTransferListModelFromJson(json);

	Map<String, dynamic> toJson() => $NewTransferListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewTransferListList {
	String id = '';
	String excerpt = '';
	String amount = '';
	String type = '';
	String transactionTime = '';
	String oppositeAccount = '';
	String oppositeName = '';
	String icon = '';
	String day = '';
	RecordDetailModel? billDetail;

	NewTransferListList();

	factory NewTransferListList.fromJson(Map<String, dynamic> json) => $NewTransferListListFromJson(json);

	Map<String, dynamic> toJson() => $NewTransferListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}