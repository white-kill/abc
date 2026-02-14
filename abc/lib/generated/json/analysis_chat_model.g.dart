import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/analysis_chat_model.dart';

AnalysisChatModel $AnalysisChatModelFromJson(Map<String, dynamic> json) {
  final AnalysisChatModel analysisChatModel = AnalysisChatModel();
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    analysisChatModel.day = day;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    analysisChatModel.amount = amount;
  }
  return analysisChatModel;
}

Map<String, dynamic> $AnalysisChatModelToJson(AnalysisChatModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['amount'] = entity.amount;
  return data;
}

extension AnalysisChatModelExtension on AnalysisChatModel {
  AnalysisChatModel copyWith({
    String? day,
    double? amount,
  }) {
    return AnalysisChatModel()
      ..day = day ?? this.day
      ..amount = amount ?? this.amount;
  }
}