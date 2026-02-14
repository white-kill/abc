import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/categiry_query_model.dart';
import 'package:abc/config/model/bill_one_model.dart';


CategiryQueryModel $CategiryQueryModelFromJson(Map<String, dynamic> json) {
  final CategiryQueryModel categiryQueryModel = CategiryQueryModel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    categiryQueryModel.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    categiryQueryModel.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    categiryQueryModel.amount = amount;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    categiryQueryModel.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    categiryQueryModel.bankCard = bankCard;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    categiryQueryModel.icon = icon;
  }
  final BillOneListBillDetail? billDetail = jsonConvert.convert<
      BillOneListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    categiryQueryModel.billDetail = billDetail;
  }
  return categiryQueryModel;
}

Map<String, dynamic> $CategiryQueryModelToJson(CategiryQueryModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['icon'] = entity.icon;
  data['billDetail'] = entity.billDetail?.toJson();
  return data;
}

extension CategiryQueryModelExtension on CategiryQueryModel {
  CategiryQueryModel copyWith({
    int? id,
    String? excerpt,
    double? amount,
    String? transactionTime,
    String? bankCard,
    String? icon,
    BillOneListBillDetail? billDetail,
  }) {
    return CategiryQueryModel()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..icon = icon ?? this.icon
      ..billDetail = billDetail ?? this.billDetail;
  }
}