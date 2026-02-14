import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/record_detail_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/record_detail_model.g.dart';

@JsonSerializable()
class RecordDetailModel {
	String id ='';
	double amount = 0;
	String transactionTime = '';
	String bankCard = '';
	String bankName = '';
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String transactionType = '';
	String transactionChannel = '';
	String oppositeBankCard = '';
	String oppositeBankName = '';
	String certificateNo = '';
	String excerpt = '';
	double accountBalance = 0;
	String merchantBranch = '';
	String type = '';
	String category = '';

	RecordDetailModel();

	factory RecordDetailModel.fromJson(Map<String, dynamic> json) => $RecordDetailModelFromJson(json);

	Map<String, dynamic> toJson() => $RecordDetailModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}