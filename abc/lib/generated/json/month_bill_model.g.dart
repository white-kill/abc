import 'package:abc/generated/json/base/json_convert_content.dart';
import 'package:abc/config/model/month_bill_model.dart';

MonthBillModel $MonthBillModelFromJson(Map<String, dynamic> json) {
  final MonthBillModel monthBillModel = MonthBillModel();
  final MonthBillCustom? custom = jsonConvert.convert<MonthBillCustom>(
      json['custom']);
  if (custom != null) {
    monthBillModel.custom = custom;
  }
  final MonthBillExpenses? expenses = jsonConvert.convert<MonthBillExpenses>(
      json['expenses']);
  if (expenses != null) {
    monthBillModel.expenses = expenses;
  }
  final MonthBillIncome? income = jsonConvert.convert<MonthBillIncome>(
      json['income']);
  if (income != null) {
    monthBillModel.income = income;
  }
  final MonthBillThreePayment? threePayment = jsonConvert.convert<
      MonthBillThreePayment>(json['threePayment']);
  if (threePayment != null) {
    monthBillModel.threePayment = threePayment;
  }
  final String? peas = jsonConvert.convert<String>(json['peas']);
  if (peas != null) {
    monthBillModel.peas = peas;
  }
  final String? loginTIme = jsonConvert.convert<String>(json['loginTIme']);
  if (loginTIme != null) {
    monthBillModel.loginTIme = loginTIme;
  }
  final String? loginCount = jsonConvert.convert<String>(json['loginCount']);
  if (loginCount != null) {
    monthBillModel.loginCount = loginCount;
  }
  return monthBillModel;
}

Map<String, dynamic> $MonthBillModelToJson(MonthBillModel entity) {
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

extension MonthBillModelExtension on MonthBillModel {
  MonthBillModel copyWith({
    MonthBillCustom? custom,
    MonthBillExpenses? expenses,
    MonthBillIncome? income,
    MonthBillThreePayment? threePayment,
    String? peas,
    String? loginTIme,
    String? loginCount,
  }) {
    return MonthBillModel()
      ..custom = custom ?? this.custom
      ..expenses = expenses ?? this.expenses
      ..income = income ?? this.income
      ..threePayment = threePayment ?? this.threePayment
      ..peas = peas ?? this.peas
      ..loginTIme = loginTIme ?? this.loginTIme
      ..loginCount = loginCount ?? this.loginCount;
  }
}

MonthBillCustom $MonthBillCustomFromJson(Map<String, dynamic> json) {
  final MonthBillCustom monthBillCustom = MonthBillCustom();
  final MonthBillCustomCapitalAmount? capitalAmount = jsonConvert.convert<
      MonthBillCustomCapitalAmount>(json['capitalAmount']);
  if (capitalAmount != null) {
    monthBillCustom.capitalAmount = capitalAmount;
  }
  final MonthBillCustomCurrentAmount? currentAmount = jsonConvert.convert<
      MonthBillCustomCurrentAmount>(json['currentAmount']);
  if (currentAmount != null) {
    monthBillCustom.currentAmount = currentAmount;
  }
  final MonthBillCustomDepositAmount? depositAmount = jsonConvert.convert<
      MonthBillCustomDepositAmount>(json['depositAmount']);
  if (depositAmount != null) {
    monthBillCustom.depositAmount = depositAmount;
  }
  final MonthBillCustomManagementAmount? managementAmount = jsonConvert.convert<
      MonthBillCustomManagementAmount>(json['managementAmount']);
  if (managementAmount != null) {
    monthBillCustom.managementAmount = managementAmount;
  }
  final MonthBillCustomFundAmount? fundAmount = jsonConvert.convert<
      MonthBillCustomFundAmount>(json['fundAmount']);
  if (fundAmount != null) {
    monthBillCustom.fundAmount = fundAmount;
  }
  return monthBillCustom;
}

Map<String, dynamic> $MonthBillCustomToJson(MonthBillCustom entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['capitalAmount'] = entity.capitalAmount?.toJson();
  data['currentAmount'] = entity.currentAmount?.toJson();
  data['depositAmount'] = entity.depositAmount?.toJson();
  data['managementAmount'] = entity.managementAmount?.toJson();
  data['fundAmount'] = entity.fundAmount?.toJson();
  return data;
}

extension MonthBillCustomExtension on MonthBillCustom {
  MonthBillCustom copyWith({
    MonthBillCustomCapitalAmount? capitalAmount,
    MonthBillCustomCurrentAmount? currentAmount,
    MonthBillCustomDepositAmount? depositAmount,
    MonthBillCustomManagementAmount? managementAmount,
    MonthBillCustomFundAmount? fundAmount,
  }) {
    return MonthBillCustom()
      ..capitalAmount = capitalAmount ?? this.capitalAmount
      ..currentAmount = currentAmount ?? this.currentAmount
      ..depositAmount = depositAmount ?? this.depositAmount
      ..managementAmount = managementAmount ?? this.managementAmount
      ..fundAmount = fundAmount ?? this.fundAmount;
  }
}

MonthBillCustomCapitalAmount $MonthBillCustomCapitalAmountFromJson(
    Map<String, dynamic> json) {
  final MonthBillCustomCapitalAmount monthBillCustomCapitalAmount = MonthBillCustomCapitalAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillCustomCapitalAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillCustomCapitalAmount.amountDiff = amountDiff;
  }
  return monthBillCustomCapitalAmount;
}

Map<String, dynamic> $MonthBillCustomCapitalAmountToJson(
    MonthBillCustomCapitalAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillCustomCapitalAmountExtension on MonthBillCustomCapitalAmount {
  MonthBillCustomCapitalAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillCustomCapitalAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthBillCustomCurrentAmount $MonthBillCustomCurrentAmountFromJson(
    Map<String, dynamic> json) {
  final MonthBillCustomCurrentAmount monthBillCustomCurrentAmount = MonthBillCustomCurrentAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillCustomCurrentAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillCustomCurrentAmount.amountDiff = amountDiff;
  }
  return monthBillCustomCurrentAmount;
}

Map<String, dynamic> $MonthBillCustomCurrentAmountToJson(
    MonthBillCustomCurrentAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillCustomCurrentAmountExtension on MonthBillCustomCurrentAmount {
  MonthBillCustomCurrentAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillCustomCurrentAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthBillCustomDepositAmount $MonthBillCustomDepositAmountFromJson(
    Map<String, dynamic> json) {
  final MonthBillCustomDepositAmount monthBillCustomDepositAmount = MonthBillCustomDepositAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillCustomDepositAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillCustomDepositAmount.amountDiff = amountDiff;
  }
  return monthBillCustomDepositAmount;
}

Map<String, dynamic> $MonthBillCustomDepositAmountToJson(
    MonthBillCustomDepositAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillCustomDepositAmountExtension on MonthBillCustomDepositAmount {
  MonthBillCustomDepositAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillCustomDepositAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthBillCustomManagementAmount $MonthBillCustomManagementAmountFromJson(
    Map<String, dynamic> json) {
  final MonthBillCustomManagementAmount monthBillCustomManagementAmount = MonthBillCustomManagementAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillCustomManagementAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillCustomManagementAmount.amountDiff = amountDiff;
  }
  return monthBillCustomManagementAmount;
}

Map<String, dynamic> $MonthBillCustomManagementAmountToJson(
    MonthBillCustomManagementAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillCustomManagementAmountExtension on MonthBillCustomManagementAmount {
  MonthBillCustomManagementAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillCustomManagementAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthBillCustomFundAmount $MonthBillCustomFundAmountFromJson(
    Map<String, dynamic> json) {
  final MonthBillCustomFundAmount monthBillCustomFundAmount = MonthBillCustomFundAmount();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillCustomFundAmount.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillCustomFundAmount.amountDiff = amountDiff;
  }
  return monthBillCustomFundAmount;
}

Map<String, dynamic> $MonthBillCustomFundAmountToJson(
    MonthBillCustomFundAmount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillCustomFundAmountExtension on MonthBillCustomFundAmount {
  MonthBillCustomFundAmount copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillCustomFundAmount()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}

MonthBillExpenses $MonthBillExpensesFromJson(Map<String, dynamic> json) {
  final MonthBillExpenses monthBillExpenses = MonthBillExpenses();
  final String? totalAmount = jsonConvert.convert<String>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillExpenses.totalAmount = totalAmount;
  }
  final List<MonthBillExpensesList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthBillExpensesList>(e) as MonthBillExpensesList)
      .toList();
  if (list != null) {
    monthBillExpenses.list = list;
  }
  return monthBillExpenses;
}

Map<String, dynamic> $MonthBillExpensesToJson(MonthBillExpenses entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  return data;
}

extension MonthBillExpensesExtension on MonthBillExpenses {
  MonthBillExpenses copyWith({
    String? totalAmount,
    List<MonthBillExpensesList>? list,
  }) {
    return MonthBillExpenses()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..list = list ?? this.list;
  }
}

MonthBillExpensesList $MonthBillExpensesListFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesList monthBillExpensesList = MonthBillExpensesList();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillExpensesList.amount = amount;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    monthBillExpensesList.excerpt = excerpt;
  }
  return monthBillExpensesList;
}

Map<String, dynamic> $MonthBillExpensesListToJson(
    MonthBillExpensesList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['excerpt'] = entity.excerpt;
  return data;
}

extension MonthBillExpensesListExtension on MonthBillExpensesList {
  MonthBillExpensesList copyWith({
    String? amount,
    String? excerpt,
  }) {
    return MonthBillExpensesList()
      ..amount = amount ?? this.amount
      ..excerpt = excerpt ?? this.excerpt;
  }
}

MonthBillIncome $MonthBillIncomeFromJson(Map<String, dynamic> json) {
  final MonthBillIncome monthBillIncome = MonthBillIncome();
  final String? totalAmount = jsonConvert.convert<String>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillIncome.totalAmount = totalAmount;
  }
  final List<MonthBillIncomeList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MonthBillIncomeList>(e) as MonthBillIncomeList)
      .toList();
  if (list != null) {
    monthBillIncome.list = list;
  }
  return monthBillIncome;
}

Map<String, dynamic> $MonthBillIncomeToJson(MonthBillIncome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  return data;
}

extension MonthBillIncomeExtension on MonthBillIncome {
  MonthBillIncome copyWith({
    String? totalAmount,
    List<MonthBillIncomeList>? list,
  }) {
    return MonthBillIncome()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..list = list ?? this.list;
  }
}

MonthBillIncomeList $MonthBillIncomeListFromJson(Map<String, dynamic> json) {
  final MonthBillIncomeList monthBillIncomeList = MonthBillIncomeList();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillIncomeList.amount = amount;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    monthBillIncomeList.excerpt = excerpt;
  }
  return monthBillIncomeList;
}

Map<String, dynamic> $MonthBillIncomeListToJson(MonthBillIncomeList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['excerpt'] = entity.excerpt;
  return data;
}

extension MonthBillIncomeListExtension on MonthBillIncomeList {
  MonthBillIncomeList copyWith({
    String? amount,
    String? excerpt,
  }) {
    return MonthBillIncomeList()
      ..amount = amount ?? this.amount
      ..excerpt = excerpt ?? this.excerpt;
  }
}

MonthBillThreePayment $MonthBillThreePaymentFromJson(
    Map<String, dynamic> json) {
  final MonthBillThreePayment monthBillThreePayment = MonthBillThreePayment();
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    monthBillThreePayment.amount = amount;
  }
  final String? amountDiff = jsonConvert.convert<String>(json['amountDiff']);
  if (amountDiff != null) {
    monthBillThreePayment.amountDiff = amountDiff;
  }
  return monthBillThreePayment;
}

Map<String, dynamic> $MonthBillThreePaymentToJson(
    MonthBillThreePayment entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['amountDiff'] = entity.amountDiff;
  return data;
}

extension MonthBillThreePaymentExtension on MonthBillThreePayment {
  MonthBillThreePayment copyWith({
    String? amount,
    String? amountDiff,
  }) {
    return MonthBillThreePayment()
      ..amount = amount ?? this.amount
      ..amountDiff = amountDiff ?? this.amountDiff;
  }
}