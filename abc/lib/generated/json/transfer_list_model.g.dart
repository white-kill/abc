import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/transfer_list_model.dart';

TransferListModel $TransferListModelFromJson(Map<String, dynamic> json) {
  final TransferListModel transferListModel = TransferListModel();
  final List<TransferListList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TransferListList>(e) as TransferListList)
      .toList();
  if (list != null) {
    transferListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    transferListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    transferListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    transferListModel.expensesTotal = expensesTotal;
  }
  return transferListModel;
}

Map<String, dynamic> $TransferListModelToJson(TransferListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension TransferListModelExtension on TransferListModel {
  TransferListModel copyWith({
    List<TransferListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return TransferListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

TransferListList $TransferListListFromJson(Map<String, dynamic> json) {
  final TransferListList transferListList = TransferListList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    transferListList.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    transferListList.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    transferListList.transactionTime = transactionTime;
  }
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    transferListList.dateTime = dateTime;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    transferListList.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    transferListList.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    transferListList.icon = icon;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    transferListList.currency = currency;
  }
  return transferListList;
}

Map<String, dynamic> $TransferListListToJson(TransferListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  data['dateTime'] = entity.dateTime;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['currency'] = entity.currency;
  return data;
}

extension TransferListListExtension on TransferListList {
  TransferListList copyWith({
    String? id,
    double? amount,
    String? transactionTime,
    String? dateTime,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? currency,
  }) {
    return TransferListList()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime
      ..dateTime = dateTime ?? this.dateTime
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..currency = currency ?? this.currency;
  }
}