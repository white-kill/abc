import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/export_record_model.dart';

ExportRecordModel $ExportRecordModelFromJson(Map<String, dynamic> json) {
  final ExportRecordModel exportRecordModel = ExportRecordModel();
  final List<ExportRecordList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ExportRecordList>(e) as ExportRecordList)
      .toList();
  if (list != null) {
    exportRecordModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    exportRecordModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    exportRecordModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    exportRecordModel.expensesTotal = expensesTotal;
  }
  return exportRecordModel;
}

Map<String, dynamic> $ExportRecordModelToJson(ExportRecordModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension ExportRecordModelExtension on ExportRecordModel {
  ExportRecordModel copyWith({
    List<ExportRecordList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return ExportRecordModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

ExportRecordList $ExportRecordListFromJson(Map<String, dynamic> json) {
  final ExportRecordList exportRecordList = ExportRecordList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    exportRecordList.id = id;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    exportRecordList.bankCard = bankCard;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    exportRecordList.email = email;
  }
  final String? dateTimeRange = jsonConvert.convert<String>(
      json['dateTimeRange']);
  if (dateTimeRange != null) {
    exportRecordList.dateTimeRange = dateTimeRange;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    exportRecordList.status = status;
  }
  final String? detailType = jsonConvert.convert<String>(json['detailType']);
  if (detailType != null) {
    exportRecordList.detailType = detailType;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    exportRecordList.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    exportRecordList.createTime = createTime;
  }
  return exportRecordList;
}

Map<String, dynamic> $ExportRecordListToJson(ExportRecordList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCard'] = entity.bankCard;
  data['email'] = entity.email;
  data['dateTimeRange'] = entity.dateTimeRange;
  data['status'] = entity.status;
  data['detailType'] = entity.detailType;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  return data;
}

extension ExportRecordListExtension on ExportRecordList {
  ExportRecordList copyWith({
    String? id,
    String? bankCard,
    String? email,
    String? dateTimeRange,
    String? status,
    String? detailType,
    String? code,
    String? createTime,
  }) {
    return ExportRecordList()
      ..id = id ?? this.id
      ..bankCard = bankCard ?? this.bankCard
      ..email = email ?? this.email
      ..dateTimeRange = dateTimeRange ?? this.dateTimeRange
      ..status = status ?? this.status
      ..detailType = detailType ?? this.detailType
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime;
  }
}