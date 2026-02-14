import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/analysis_chat_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/analysis_chat_model.g.dart';

@JsonSerializable()
class AnalysisChatModel {
	String day = '';
	double amount = 0;

	AnalysisChatModel();

	factory AnalysisChatModel.fromJson(Map<String, dynamic> json) => $AnalysisChatModelFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisChatModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}