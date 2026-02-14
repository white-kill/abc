import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/record_detail_model.dart';

RecordDetailModel $RecordDetailModelFromJson(Map<String, dynamic> json) {
  final RecordDetailModel recordDetailModel = RecordDetailModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    recordDetailModel.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    recordDetailModel.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    recordDetailModel.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    recordDetailModel.bankCard = bankCard;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    recordDetailModel.bankName = bankName;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    recordDetailModel.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    recordDetailModel.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    recordDetailModel.icon = icon;
  }
  final String? transactionType = jsonConvert.convert<String>(
      json['transactionType']);
  if (transactionType != null) {
    recordDetailModel.transactionType = transactionType;
  }
  final String? transactionChannel = jsonConvert.convert<String>(
      json['transactionChannel']);
  if (transactionChannel != null) {
    recordDetailModel.transactionChannel = transactionChannel;
  }
  final String? oppositeBankCard = jsonConvert.convert<String>(
      json['oppositeBankCard']);
  if (oppositeBankCard != null) {
    recordDetailModel.oppositeBankCard = oppositeBankCard;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    recordDetailModel.oppositeBankName = oppositeBankName;
  }
  final String? certificateNo = jsonConvert.convert<String>(
      json['certificateNo']);
  if (certificateNo != null) {
    recordDetailModel.certificateNo = certificateNo;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    recordDetailModel.excerpt = excerpt;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    recordDetailModel.accountBalance = accountBalance;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    recordDetailModel.merchantBranch = merchantBranch;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    recordDetailModel.type = type;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    recordDetailModel.category = category;
  }
  return recordDetailModel;
}

Map<String, dynamic> $RecordDetailModelToJson(RecordDetailModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['bankName'] = entity.bankName;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['transactionType'] = entity.transactionType;
  data['transactionChannel'] = entity.transactionChannel;
  data['oppositeBankCard'] = entity.oppositeBankCard;
  data['oppositeBankName'] = entity.oppositeBankName;
  data['certificateNo'] = entity.certificateNo;
  data['excerpt'] = entity.excerpt;
  data['accountBalance'] = entity.accountBalance;
  data['merchantBranch'] = entity.merchantBranch;
  data['type'] = entity.type;
  data['category'] = entity.category;
  return data;
}

extension RecordDetailModelExtension on RecordDetailModel {
  RecordDetailModel copyWith({
    String? id,
    double? amount,
    String? transactionTime,
    String? bankCard,
    String? bankName,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? transactionType,
    String? transactionChannel,
    String? oppositeBankCard,
    String? oppositeBankName,
    String? certificateNo,
    String? excerpt,
    double? accountBalance,
    String? merchantBranch,
    String? type,
    String? category,
  }) {
    return RecordDetailModel()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..bankName = bankName ?? this.bankName
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..transactionType = transactionType ?? this.transactionType
      ..transactionChannel = transactionChannel ?? this.transactionChannel
      ..oppositeBankCard = oppositeBankCard ?? this.oppositeBankCard
      ..oppositeBankName = oppositeBankName ?? this.oppositeBankName
      ..certificateNo = certificateNo ?? this.certificateNo
      ..excerpt = excerpt ?? this.excerpt
      ..accountBalance = accountBalance ?? this.accountBalance
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..type = type ?? this.type
      ..category = category ?? this.category;
  }
}