import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/month_bill_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/month_bill_model.g.dart';

@JsonSerializable()
class MonthBillModel {
	MonthBillCustom? custom;
	MonthBillExpenses? expenses;
	MonthBillIncome? income;
	MonthBillThreePayment? threePayment;
	String peas = '';
	String loginTIme = '';
	String loginCount = '';

	MonthBillModel();

	factory MonthBillModel.fromJson(Map<String, dynamic> json) => $MonthBillModelFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustom {
	MonthBillCustomCapitalAmount? capitalAmount;
	MonthBillCustomCurrentAmount? currentAmount;
	MonthBillCustomDepositAmount? depositAmount;
	MonthBillCustomManagementAmount? managementAmount;
	MonthBillCustomFundAmount? fundAmount;

	MonthBillCustom();

	factory MonthBillCustom.fromJson(Map<String, dynamic> json) => $MonthBillCustomFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustomCapitalAmount {
	String amount = '';
	String amountDiff = '';

	MonthBillCustomCapitalAmount();

	factory MonthBillCustomCapitalAmount.fromJson(Map<String, dynamic> json) => $MonthBillCustomCapitalAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomCapitalAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustomCurrentAmount {
	String amount = '';
	String amountDiff = '';

	MonthBillCustomCurrentAmount();

	factory MonthBillCustomCurrentAmount.fromJson(Map<String, dynamic> json) => $MonthBillCustomCurrentAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomCurrentAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustomDepositAmount {
	String amount = '';
	String amountDiff = '';

	MonthBillCustomDepositAmount();

	factory MonthBillCustomDepositAmount.fromJson(Map<String, dynamic> json) => $MonthBillCustomDepositAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomDepositAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustomManagementAmount {
	String amount = '';
	String amountDiff = '';

	MonthBillCustomManagementAmount();

	factory MonthBillCustomManagementAmount.fromJson(Map<String, dynamic> json) => $MonthBillCustomManagementAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomManagementAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillCustomFundAmount {
	String amount = '';
	String amountDiff = '';

	MonthBillCustomFundAmount();

	factory MonthBillCustomFundAmount.fromJson(Map<String, dynamic> json) => $MonthBillCustomFundAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillCustomFundAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpenses {
	String totalAmount = '';
	List<MonthBillExpensesList> list = [];

	MonthBillExpenses();

	factory MonthBillExpenses.fromJson(Map<String, dynamic> json) => $MonthBillExpensesFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillExpensesList {
	String amount = '';
	String excerpt = '';

	MonthBillExpensesList();

	factory MonthBillExpensesList.fromJson(Map<String, dynamic> json) => $MonthBillExpensesListFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillExpensesListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncome {
	String totalAmount = '';
	List<MonthBillIncomeList> list = [];

	MonthBillIncome();

	factory MonthBillIncome.fromJson(Map<String, dynamic> json) => $MonthBillIncomeFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillIncomeList {
	String amount = '';
	String excerpt = '';

	MonthBillIncomeList();

	factory MonthBillIncomeList.fromJson(Map<String, dynamic> json) => $MonthBillIncomeListFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillIncomeListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthBillThreePayment {
	String amount = '';
	String amountDiff = '';

	MonthBillThreePayment();

	factory MonthBillThreePayment.fromJson(Map<String, dynamic> json) => $MonthBillThreePaymentFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillThreePaymentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}