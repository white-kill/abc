import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/details_query_model.dart';
import 'package:abc/config/model/record_detail_model.dart';


DetailsQueryModel $DetailsQueryModelFromJson(Map<String, dynamic> json) {
  final DetailsQueryModel detailsQueryModel = DetailsQueryModel();
  final List<DetailsQueryList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<DetailsQueryList>(e) as DetailsQueryList)
      .toList();
  if (list != null) {
    detailsQueryModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    detailsQueryModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    detailsQueryModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    detailsQueryModel.expensesTotal = expensesTotal;
  }
  return detailsQueryModel;
}

Map<String, dynamic> $DetailsQueryModelToJson(DetailsQueryModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension DetailsQueryModelExtension on DetailsQueryModel {
  DetailsQueryModel copyWith({
    List<DetailsQueryList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return DetailsQueryModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

DetailsQueryList $DetailsQueryListFromJson(Map<String, dynamic> json) {
  final DetailsQueryList detailsQueryList = DetailsQueryList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    detailsQueryList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    detailsQueryList.excerpt = excerpt;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    detailsQueryList.type = type;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    detailsQueryList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    detailsQueryList.accountBalance = accountBalance;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    detailsQueryList.merchantBranch = merchantBranch;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    detailsQueryList.day = day;
  }
  final RecordDetailModel? billDetail = jsonConvert.convert<RecordDetailModel>(
      json['billDetail']);
  if (billDetail != null) {
    detailsQueryList.billDetail = billDetail;
  }
  return detailsQueryList;
}

Map<String, dynamic> $DetailsQueryListToJson(DetailsQueryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['type'] = entity.type;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['merchantBranch'] = entity.merchantBranch;
  data['day'] = entity.day;
  data['billDetail'] = entity.billDetail?.toJson();
  return data;
}

extension DetailsQueryListExtension on DetailsQueryList {
  DetailsQueryList copyWith({
    String? id,
    String? excerpt,
    String? type,
    String? amount,
    String? accountBalance,
    String? merchantBranch,
    String? day,
    RecordDetailModel? billDetail,
  }) {
    return DetailsQueryList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..type = type ?? this.type
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..day = day ?? this.day
      ..billDetail = billDetail ?? this.billDetail;
  }
}