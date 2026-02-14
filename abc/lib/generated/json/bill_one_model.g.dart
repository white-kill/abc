import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/bill_one_model.dart';

BillOneModel $BillOneModelFromJson(Map<String, dynamic> json) {
  final BillOneModel billOneModel = BillOneModel();
  final List<BillOneList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BillOneList>(e) as BillOneList).toList();
  if (list != null) {
    billOneModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    billOneModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    billOneModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    billOneModel.expensesTotal = expensesTotal;
  }
  final BillOneCustomizeParam? customizeParam = jsonConvert.convert<
      BillOneCustomizeParam>(json['customizeParam']);
  if (customizeParam != null) {
    billOneModel.customizeParam = customizeParam;
  }
  return billOneModel;
}

Map<String, dynamic> $BillOneModelToJson(BillOneModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam?.toJson();
  return data;
}

extension BillOneModelExtension on BillOneModel {
  BillOneModel copyWith({
    List<BillOneList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    BillOneCustomizeParam? customizeParam,
  }) {
    return BillOneModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

BillOneList $BillOneListFromJson(Map<String, dynamic> json) {
  final BillOneList billOneList = BillOneList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    billOneList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billOneList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    billOneList.amount = amount;
  }
  final String? excerptName = jsonConvert.convert<String>(json['excerptName']);
  if (excerptName != null) {
    billOneList.excerptName = excerptName;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    billOneList.accountBalance = accountBalance;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    billOneList.day = day;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billOneList.type = type;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    billOneList.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billOneList.bankCard = bankCard;
  }
  final BillOneListBillDetail? billDetail = jsonConvert.convert<
      BillOneListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    billOneList.billDetail = billDetail;
  }
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    billOneList.month = month;
  }
  final String? year = jsonConvert.convert<String>(json['year']);
  if (year != null) {
    billOneList.year = year;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    billOneList.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    billOneList.expensesTotal = expensesTotal;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    billOneList.icon = icon;
  }
  return billOneList;
}

Map<String, dynamic> $BillOneListToJson(BillOneList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['excerptName'] = entity.excerptName;
  data['accountBalance'] = entity.accountBalance;
  data['day'] = entity.day;
  data['type'] = entity.type;
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['billDetail'] = entity.billDetail?.toJson();
  data['month'] = entity.month;
  data['year'] = entity.year;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['icon'] = entity.icon;
  return data;
}

extension BillOneListExtension on BillOneList {
  BillOneList copyWith({
    String? id,
    String? excerpt,
    String? amount,
    String? excerptName,
    String? accountBalance,
    String? day,
    String? type,
    String? transactionTime,
    String? bankCard,
    BillOneListBillDetail? billDetail,
    String? month,
    String? year,
    String? incomeTotal,
    String? expensesTotal,
    String? icon,
  }) {
    return BillOneList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..excerptName = excerptName ?? this.excerptName
      ..accountBalance = accountBalance ?? this.accountBalance
      ..day = day ?? this.day
      ..type = type ?? this.type
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..billDetail = billDetail ?? this.billDetail
      ..month = month ?? this.month
      ..year = year ?? this.year
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..icon = icon ?? this.icon;
  }
}

BillOneListBillDetail $BillOneListBillDetailFromJson(
    Map<String, dynamic> json) {
  final BillOneListBillDetail billOneListBillDetail = BillOneListBillDetail();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    billOneListBillDetail.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    billOneListBillDetail.bankName = bankName;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billOneListBillDetail.bankCard = bankCard;
  }
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    billOneListBillDetail.account = account;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billOneListBillDetail.excerpt = excerpt;
  }
  final String? excerpt2 = jsonConvert.convert<String>(json['excerpt2']);
  if (excerpt2 != null) {
    billOneListBillDetail.excerpt2 = excerpt2;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    billOneListBillDetail.amount = amount;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    billOneListBillDetail.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    billOneListBillDetail.transactionTime = transactionTime;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    billOneListBillDetail.oppositeAccount = oppositeAccount;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    billOneListBillDetail.oppositeBankName = oppositeBankName;
  }
  final String? accountsTime = jsonConvert.convert<String>(
      json['accountsTime']);
  if (accountsTime != null) {
    billOneListBillDetail.accountsTime = accountsTime;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    billOneListBillDetail.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    billOneListBillDetail.oppositeName = oppositeName;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billOneListBillDetail.type = type;
  }
  final String? excerptName = jsonConvert.convert<String>(json['excerptName']);
  if (excerptName != null) {
    billOneListBillDetail.excerptName = excerptName;
  }
  final String? transactionType = jsonConvert.convert<String>(
      json['transactionType']);
  if (transactionType != null) {
    billOneListBillDetail.transactionType = transactionType;
  }
  final String? categoryIcon = jsonConvert.convert<String>(
      json['categoryIcon']);
  if (categoryIcon != null) {
    billOneListBillDetail.categoryIcon = categoryIcon;
  }
  final String? transactionCategory = jsonConvert.convert<String>(
      json['transactionCategory']);
  if (transactionCategory != null) {
    billOneListBillDetail.transactionCategory = transactionCategory;
  }
  return billOneListBillDetail;
}

Map<String, dynamic> $BillOneListBillDetailToJson(
    BillOneListBillDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankName'] = entity.bankName;
  data['bankCard'] = entity.bankCard;
  data['account'] = entity.account;
  data['excerpt'] = entity.excerpt;
  data['excerpt2'] = entity.excerpt2;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['transactionTime'] = entity.transactionTime;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['oppositeBankName'] = entity.oppositeBankName;
  data['accountsTime'] = entity.accountsTime;
  data['merchantBranch'] = entity.merchantBranch;
  data['oppositeName'] = entity.oppositeName;
  data['type'] = entity.type;
  data['excerptName'] = entity.excerptName;
  data['transactionType'] = entity.transactionType;
  data['categoryIcon'] = entity.categoryIcon;
  data['transactionCategory'] = entity.transactionCategory;
  return data;
}

extension BillOneListBillDetailExtension on BillOneListBillDetail {
  BillOneListBillDetail copyWith({
    String? id,
    String? bankName,
    String? bankCard,
    String? account,
    String? excerpt,
    String? excerpt2,
    double? amount,
    double? accountBalance,
    String? transactionTime,
    String? oppositeAccount,
    String? oppositeBankName,
    String? accountsTime,
    String? merchantBranch,
    String? oppositeName,
    String? type,
    String? excerptName,
    String? transactionType,
    String? categoryIcon,
    String? transactionCategory,
  }) {
    return BillOneListBillDetail()
      ..id = id ?? this.id
      ..bankName = bankName ?? this.bankName
      ..bankCard = bankCard ?? this.bankCard
      ..account = account ?? this.account
      ..excerpt = excerpt ?? this.excerpt
      ..excerpt2 = excerpt2 ?? this.excerpt2
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..transactionTime = transactionTime ?? this.transactionTime
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..oppositeBankName = oppositeBankName ?? this.oppositeBankName
      ..accountsTime = accountsTime ?? this.accountsTime
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..oppositeName = oppositeName ?? this.oppositeName
      ..type = type ?? this.type
      ..excerptName = excerptName ?? this.excerptName
      ..transactionType = transactionType ?? this.transactionType
      ..categoryIcon = categoryIcon ?? this.categoryIcon
      ..transactionCategory = transactionCategory ?? this.transactionCategory;
  }
}

BillOneCustomizeParam $BillOneCustomizeParamFromJson(
    Map<String, dynamic> json) {
  final BillOneCustomizeParam billOneCustomizeParam = BillOneCustomizeParam();
  final String? queryTime = jsonConvert.convert<String>(json['queryTime']);
  if (queryTime != null) {
    billOneCustomizeParam.queryTime = queryTime;
  }
  final int? pageNum = jsonConvert.convert<int>(json['pageNum']);
  if (pageNum != null) {
    billOneCustomizeParam.pageNum = pageNum;
  }
  final String? totalKeyList = jsonConvert.convert<String>(
      json['totalKeyList']);
  if (totalKeyList != null) {
    billOneCustomizeParam.totalKeyList = totalKeyList;
  }
  return billOneCustomizeParam;
}

Map<String, dynamic> $BillOneCustomizeParamToJson(
    BillOneCustomizeParam entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['queryTime'] = entity.queryTime;
  data['pageNum'] = entity.pageNum;
  data['totalKeyList'] = entity.totalKeyList;
  return data;
}

extension BillOneCustomizeParamExtension on BillOneCustomizeParam {
  BillOneCustomizeParam copyWith({
    String? queryTime,
    int? pageNum,
    String? totalKeyList,
  }) {
    return BillOneCustomizeParam()
      ..queryTime = queryTime ?? this.queryTime
      ..pageNum = pageNum ?? this.pageNum
      ..totalKeyList = totalKeyList ?? this.totalKeyList;
  }
}