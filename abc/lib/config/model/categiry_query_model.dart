import 'package:abc/config/model/bill_one_model.dart';
import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/categiry_query_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/categiry_query_model.g.dart';

@JsonSerializable()
class CategiryQueryModel {
	int id = 0;
	String excerpt = '';
	double amount = 0;
	String transactionTime = '';
	String bankCard = '';
	String icon = '';
	BillOneListBillDetail? billDetail;

	CategiryQueryModel();

	factory CategiryQueryModel.fromJson(Map<String, dynamic> json) => $CategiryQueryModelFromJson(json);

	Map<String, dynamic> toJson() => $CategiryQueryModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}