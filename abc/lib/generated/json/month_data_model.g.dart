import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/month_data_model.dart';

MonthDataModel $MonthDataModelFromJson(Map<String, dynamic> json) {
  final MonthDataModel monthDataModel = MonthDataModel();
  final MonthDataCustom? custom = jsonConvert.convert<MonthDataCustom>(
      json['custom']);
  if (custom != null) {
    monthDataModel.custom = custom;
  }
  final MonthDataExpenses? expenses = jsonConvert.convert<MonthDataExpenses>(
      json['expenses']);
  if (expenses != null) {
    monthDataModel.expenses = expenses;
  }
  final MonthDataIncome? income = jsonConvert.convert<MonthDataIncome>(
      json['income']);
  if (income != null) {
    monthDataModel.income = income;
  }
  final MonthDataThreePayment? threePayment = jsonConvert.convert<
      MonthDataThreePayment>(json['threePayment']);
  if (threePayment != null) {
    monthDataModel.threePayment = threePayment;
  }
  final String? peas = jsonConvert.convert<String>(json['peas']);
  if (peas != null) {
    monthDataModel.peas = peas;
  }
  final String? loginTIme = jsonConvert.convert<String>(json['loginTIme']);
  if (loginTIme != null) {
    monthDataModel.loginTIme = loginTIme;
  }
  final String? loginCount = jsonConvert.convert<String>(json['loginCount']);
  if (loginCount != null) {
    monthDataModel.loginCount = loginCount;
  }
  return monthDataModel;
}

Map<String, dynamic> $MonthDataModelToJson(MonthDataModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['custom'] = entity.custom?.toJson();
  data['expenses'] = entity.expenses?.toJson();
  data['income'] = entity.income?.toJson();
  data['threePayment'] = entity.threePayment?.toJson();
  data['peas'] = entity.peas;
  data['loginTIme'] = entity.loginTIme;
  data['loginCount'] = entity.loginCount;
  return data;
}

extension MonthDataModelExtension on MonthDataModel {
  MonthDataModel copyWith({
    MonthDataCustom? custom,
    MonthDataExpenses? expenses,
    MonthDataIncome? income,
    MonthDataThreePayment? threePayment,
    String? peas,
    String? loginTIme,
    String? loginCount,
  }) {
    return MonthDataModel()
      ..custom = custom ?? this.custom
      ..expenses = expenses ?? this.expenses
      ..income = income ?? this.income
      ..threePayment = threePayment ?? this.threePayment
      ..peas = peas ?? this.peas
      ..loginTIme = loginTIme ?? this.loginTIme
      ..loginCount = loginCount ?? this.loginCount;
  }
}

MonthDataCustom $MonthDataCustomFromJson(Map<String, dynamic> json) {
  final MonthDataCustom monthDataCustom = MonthDataCustom();
  final MonthDataCustomCapitalAmount? capitalAmount = jsonConvert.convert<
      MonthDataCustomCapitalAmount>(json['capitalAmount']);
  if (capitalAmount != null) {
    monthDataCustom.capitalAmount = capitalAmount;
  }
  final MonthDataCustomCurrentAmount? currentAmount = jsonConvert.convert<
      MonthDataCustomCurrentAmount>(json['currentAmount']);
  if (currentAmount != null) {
    monthDataCustom.currentAmount = currentAmount;
  }
  final MonthDataCustomDepositAmount? depositAmount = jsonConvert.convert<
      MonthDataCustomDepositAmount>(json['depositAmount']);
  if (depositAmount != null) {
    monthDataCustom.depositAmount = depositAmount;
  }
  final MonthDataCustomManagementAmount? managementAmount = jsonConvert.convert<
      MonthDataCustomManagementAmount>(json['managementAmount']);
  if (managementAmount != null) {
    monthDataCustom.managementAmount = managementAmount;
  }
  final MonthDataCustomFundAmount? fundAmount = jsonConvert.convert<
      MonthDataCustomFundAmount>(json['fundAmount']);
  if (fundAmount != null) {
    monthDataCustom.fundAmount = fundAmount;
  }
  return monthDataCustom;
}

Map<String, dynamic> $MonthDataCustomToJson(MonthDataCustom entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['capitalAmount'] = entity.capitalAmount?.toJson();
  data['currentAmount'] = entity.currentAmount?.toJson();
  data['depositAmount'] = entity.depositAmount?.toJson();
  data['managementAmount'] = entity.managementAmount?.toJson();
  data['fundAmount'] = entity.fundAmount?.toJson();
  return data;
}

extension MonthDataCustomExtension on MonthDataCustom {
  MonthDataCustom copyWith({
    MonthDataCustomCapitalAmount? capitalAmount,
    MonthDataCustomCurrentAmount? currentAmount,
    MonthDataCustomDepositAmount? depositAmount,
    MonthDataCustomManagementAmount? managementAmount,
    MonthDataCustomFundAmount? fundAmount,
  }) {
    return MonthDataCustom()
      ..capitalAmount = capitalAmount ?? this.capitalAmount
      ..currentAmount = currentAmount ?? this.currentAmount
      ..depositAmount = depositAmount ?? this.depositAmount
      ..managementAmount = managementAmount ?? this.managementAmount
      ..fundAmount = fundAmount ?? this.fundAmount;
  }
}

MonthDataCustomCapitalAmount $MonthDataCustomCapitalAmountFromJson(
    Map<String, dynamic> json) {
  final MonthDataCustomCapitalAmount monthDataCustomCapitalAmount = MonthDataCustomCapitalAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataCustomCapitalAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataCustomCapitalAmount.amountDiff = amountDiff;
  }
  return monthDataCustomCapitalAmount;
}

Map<String, dynamic> $MonthDataCustomCapitalAmountToJson(
    MonthDataCustomCapitalAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataCustomCapitalAmountExtension on MonthDataCustomCapitalAmount {
  MonthDataCustomCapitalAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataCustomCapitalAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthDataCustomCurrentAmount $MonthDataCustomCurrentAmountFromJson(
    Map<String, dynamic> json) {
  final MonthDataCustomCurrentAmount monthDataCustomCurrentAmount = MonthDataCustomCurrentAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataCustomCurrentAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataCustomCurrentAmount.amountDiff = amountDiff;
  }
  return monthDataCustomCurrentAmount;
}

Map<String, dynamic> $MonthDataCustomCurrentAmountToJson(
    MonthDataCustomCurrentAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataCustomCurrentAmountExtension on MonthDataCustomCurrentAmount {
  MonthDataCustomCurrentAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataCustomCurrentAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthDataCustomDepositAmount $MonthDataCustomDepositAmountFromJson(
    Map<String, dynamic> json) {
  final MonthDataCustomDepositAmount monthDataCustomDepositAmount = MonthDataCustomDepositAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataCustomDepositAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataCustomDepositAmount.amountDiff = amountDiff;
  }
  return monthDataCustomDepositAmount;
}

Map<String, dynamic> $MonthDataCustomDepositAmountToJson(
    MonthDataCustomDepositAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataCustomDepositAmountExtension on MonthDataCustomDepositAmount {
  MonthDataCustomDepositAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataCustomDepositAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthDataCustomManagementAmount $MonthDataCustomManagementAmountFromJson(
    Map<String, dynamic> json) {
  final MonthDataCustomManagementAmount monthDataCustomManagementAmount = MonthDataCustomManagementAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataCustomManagementAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataCustomManagementAmount.amountDiff = amountDiff;
  }
  return monthDataCustomManagementAmount;
}

Map<String, dynamic> $MonthDataCustomManagementAmountToJson(
    MonthDataCustomManagementAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataCustomManagementAmountExtension on MonthDataCustomManagementAmount {
  MonthDataCustomManagementAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataCustomManagementAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthDataCustomFundAmount $MonthDataCustomFundAmountFromJson(
    Map<String, dynamic> json) {
  final MonthDataCustomFundAmount monthDataCustomFundAmount = MonthDataCustomFundAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataCustomFundAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataCustomFundAmount.amountDiff = amountDiff;
  }
  return monthDataCustomFundAmount;
}

Map<String, dynamic> $MonthDataCustomFundAmountToJson(
    MonthDataCustomFundAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataCustomFundAmountExtension on MonthDataCustomFundAmount {
  MonthDataCustomFundAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataCustomFundAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthDataExpenses $MonthDataExpensesFromJson(Map<String, dynamic> json) {
  final MonthDataExpenses monthDataExpenses = MonthDataExpenses();
  final String? totalAmount = jsonConvert.convert<String>(json['totalAmount']);
  if (totalAmount != null) {
    monthDataExpenses.totalAmount = totalAmount;
  }
  final String? totalAmountDiff = jsonConvert.convert<String>(
      json['totalAmountDiff']);
  if (totalAmountDiff != null) {
    monthDataExpenses.totalAmountDiff = totalAmountDiff;
  }
  final List<MonthDataExpensesList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthDataExpensesList>(e) as MonthDataExpensesList)
      .toList();
  if (list != null) {
    monthDataExpenses.list = list;
  }
  return monthDataExpenses;
}

Map<String, dynamic> $MonthDataExpensesToJson(MonthDataExpenses entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['totalAmountDiff'] = entity.totalAmountDiff;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  return data;
}

extension MonthDataExpensesExtension on MonthDataExpenses {
  MonthDataExpenses copyWith({
    String? totalAmount,
    String? totalAmountDiff,
    List<MonthDataExpensesList>? list,
  }) {
    return MonthDataExpenses()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..totalAmountDiff = totalAmountDiff ?? this.totalAmountDiff
      ..list = list ?? this.list;
  }
}

MonthDataExpensesList $MonthDataExpensesListFromJson(
    Map<String, dynamic> json) {
  final MonthDataExpensesList monthDataExpensesList = MonthDataExpensesList();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthDataExpensesList.amount = amount;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    monthDataExpensesList.excerpt = excerpt;
  }
  return monthDataExpensesList;
}

Map<String, dynamic> $MonthDataExpensesListToJson(
    MonthDataExpensesList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['excerpt'] = entity.excerpt;
  return data;
}

extension MonthDataExpensesListExtension on MonthDataExpensesList {
  MonthDataExpensesList copyWith({
    double? amount,
    String? excerpt,
  }) {
    return MonthDataExpensesList()
      ..amount = amount ?? this.amount
      ..excerpt = excerpt ?? this.excerpt;
  }
}

MonthDataIncome $MonthDataIncomeFromJson(Map<String, dynamic> json) {
  final MonthDataIncome monthDataIncome = MonthDataIncome();
  final String? totalAmount = jsonConvert.convert<String>(json['totalAmount']);
  if (totalAmount != null) {
    monthDataIncome.totalAmount = totalAmount;
  }
  final String? totalAmountDiff = jsonConvert.convert<String>(
      json['totalAmountDiff']);
  if (totalAmountDiff != null) {
    monthDataIncome.totalAmountDiff = totalAmountDiff;
  }
  final List<MonthDataIncomeList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthDataIncomeList>(e) as MonthDataIncomeList)
      .toList();
  if (list != null) {
    monthDataIncome.list = list;
  }
  return monthDataIncome;
}

Map<String, dynamic> $MonthDataIncomeToJson(MonthDataIncome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['totalAmountDiff'] = entity.totalAmountDiff;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  return data;
}

extension MonthDataIncomeExtension on MonthDataIncome {
  MonthDataIncome copyWith({
    String? totalAmount,
    String? totalAmountDiff,
    List<MonthDataIncomeList>? list,
  }) {
    return MonthDataIncome()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..totalAmountDiff = totalAmountDiff ?? this.totalAmountDiff
      ..list = list ?? this.list;
  }
}

MonthDataIncomeList $MonthDataIncomeListFromJson(Map<String, dynamic> json) {
  final MonthDataIncomeList monthDataIncomeList = MonthDataIncomeList();
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthDataIncomeList.amount = amount;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    monthDataIncomeList.excerpt = excerpt;
  }
  return monthDataIncomeList;
}

Map<String, dynamic> $MonthDataIncomeListToJson(MonthDataIncomeList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['excerpt'] = entity.excerpt;
  return data;
}

extension MonthDataIncomeListExtension on MonthDataIncomeList {
  MonthDataIncomeList copyWith({
    double? amount,
    String? excerpt,
  }) {
    return MonthDataIncomeList()
      ..amount = amount ?? this.amount
      ..excerpt = excerpt ?? this.excerpt;
  }
}

MonthDataThreePayment $MonthDataThreePaymentFromJson(
    Map<String, dynamic> json) {
  final MonthDataThreePayment monthDataThreePayment = MonthDataThreePayment();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthDataThreePayment.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthDataThreePayment.amountDiff = amountDiff;
  }
  return monthDataThreePayment;
}

Map<String, dynamic> $MonthDataThreePaymentToJson(
    MonthDataThreePayment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthDataThreePaymentExtension on MonthDataThreePayment {
  MonthDataThreePayment copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthDataThreePayment()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}