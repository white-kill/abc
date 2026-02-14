import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/new_transfer_list_model.dart';
import 'package:abc/config/model/record_detail_model.dart';


NewTransferListModel $NewTransferListModelFromJson(Map<String, dynamic> json) {
  final NewTransferListModel newTransferListModel = NewTransferListModel();
  final List<NewTransferListList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<NewTransferListList>(e) as NewTransferListList)
      .toList();
  if (list != null) {
    newTransferListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    newTransferListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    newTransferListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    newTransferListModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    newTransferListModel.customizeParam = customizeParam;
  }
  return newTransferListModel;
}

Map<String, dynamic> $NewTransferListModelToJson(NewTransferListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension NewTransferListModelExtension on NewTransferListModel {
  NewTransferListModel copyWith({
    List<NewTransferListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return NewTransferListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

NewTransferListList $NewTransferListListFromJson(Map<String, dynamic> json) {
  final NewTransferListList newTransferListList = NewTransferListList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    newTransferListList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    newTransferListList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    newTransferListList.amount = amount;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    newTransferListList.type = type;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    newTransferListList.transactionTime = transactionTime;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    newTransferListList.oppositeAccount = oppositeAccount;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    newTransferListList.oppositeName = oppositeName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    newTransferListList.icon = icon;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    newTransferListList.day = day;
  }
  final RecordDetailModel? billDetail = jsonConvert.convert<RecordDetailModel>(
      json['billDetail']);
  if (billDetail != null) {
    newTransferListList.billDetail = billDetail;
  }
  return newTransferListList;
}

Map<String, dynamic> $NewTransferListListToJson(NewTransferListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['type'] = entity.type;
  data['transactionTime'] = entity.transactionTime;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['oppositeName'] = entity.oppositeName;
  data['icon'] = entity.icon;
  data['day'] = entity.day;
  data['billDetail'] = entity.billDetail?.toJson();
  return data;
}

extension NewTransferListListExtension on NewTransferListList {
  NewTransferListList copyWith({
    String? id,
    String? excerpt,
    String? amount,
    String? type,
    String? transactionTime,
    String? oppositeAccount,
    String? oppositeName,
    String? icon,
    String? day,
    RecordDetailModel? billDetail,
  }) {
    return NewTransferListList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..type = type ?? this.type
      ..transactionTime = transactionTime ?? this.transactionTime
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..oppositeName = oppositeName ?? this.oppositeName
      ..icon = icon ?? this.icon
      ..day = day ?? this.day
      ..billDetail = billDetail ?? this.billDetail;
  }
}