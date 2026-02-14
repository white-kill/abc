import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/search_bill_model.dart';
import 'package:abc/config/model/bill_one_model.dart';


SearchBillModel $SearchBillModelFromJson(Map<String, dynamic> json) {
  final SearchBillModel searchBillModel = SearchBillModel();
  final List<SearchBillList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SearchBillList>(e) as SearchBillList)
      .toList();
  if (list != null) {
    searchBillModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    searchBillModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    searchBillModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    searchBillModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    searchBillModel.customizeParam = customizeParam;
  }
  return searchBillModel;
}

Map<String, dynamic> $SearchBillModelToJson(SearchBillModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension SearchBillModelExtension on SearchBillModel {
  SearchBillModel copyWith({
    List<SearchBillList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return SearchBillModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

SearchBillList $SearchBillListFromJson(Map<String, dynamic> json) {
  final SearchBillList searchBillList = SearchBillList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    searchBillList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    searchBillList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    searchBillList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    searchBillList.accountBalance = accountBalance;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    searchBillList.type = type;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    searchBillList.day = day;
  }
  final BillOneListBillDetail? billDetail = jsonConvert.convert<
      BillOneListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    searchBillList.billDetail = billDetail;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    searchBillList.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    searchBillList.bankCard = bankCard;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    searchBillList.icon = icon;
  }
  return searchBillList;
}

Map<String, dynamic> $SearchBillListToJson(SearchBillList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['type'] = entity.type;
  data['day'] = entity.day;
  data['billDetail'] = entity.billDetail?.toJson();
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['icon'] = entity.icon;
  return data;
}

extension SearchBillListExtension on SearchBillList {
  SearchBillList copyWith({
    String? id,
    String? excerpt,
    String? amount,
    String? accountBalance,
    String? type,
    String? day,
    BillOneListBillDetail? billDetail,
    String? transactionTime,
    String? bankCard,
    String? icon,
  }) {
    return SearchBillList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..type = type ?? this.type
      ..day = day ?? this.day
      ..billDetail = billDetail ?? this.billDetail
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..icon = icon ?? this.icon;
  }
}