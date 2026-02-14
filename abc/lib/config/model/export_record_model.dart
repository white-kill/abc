import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/export_record_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/export_record_model.g.dart';

@JsonSerializable()
class ExportRecordModel {
	List<ExportRecordList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	ExportRecordModel();

	factory ExportRecordModel.fromJson(Map<String, dynamic> json) => $ExportRecordModelFromJson(json);

	Map<String, dynamic> toJson() => $ExportRecordModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ExportRecordList {
	String id = '';
	String bankCard = '';
	String email = '';
	String dateTimeRange = '';
	String status = '';
	String detailType = '';
	String code = '';
	String createTime = '';

	ExportRecordList();

	factory ExportRecordList.fromJson(Map<String, dynamic> json) => $ExportRecordListFromJson(json);

	Map<String, dynamic> toJson() => $ExportRecordListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}