import 'package:abc/generated/json/base/json_field.dart';
import 'package:abc/generated/json/month_data_model.g.dart';
import 'dart:convert';
export 'package:abc/generated/json/month_data_model.g.dart';

@JsonSerializable()
class MonthDataModel {
	MonthDataCustom? custom;
	MonthDataExpenses? expenses;
	MonthDataIncome? income;
	MonthDataThreePayment? threePayment;
	String peas = '';
	String loginTIme = '';
	String loginCount = '';

	MonthDataModel();

	factory MonthDataModel.fromJson(Map<String, dynamic> json) => $MonthDataModelFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustom {
	MonthDataCustomCapitalAmount? capitalAmount;
	MonthDataCustomCurrentAmount? currentAmount;
	MonthDataCustomDepositAmount? depositAmount;
	MonthDataCustomManagementAmount? managementAmount;
	MonthDataCustomFundAmount? fundAmount;

	MonthDataCustom();

	factory MonthDataCustom.fromJson(Map<String, dynamic> json) => $MonthDataCustomFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustomCapitalAmount {
	String amount = '';
	String amountDiff = '';

	MonthDataCustomCapitalAmount();

	factory MonthDataCustomCapitalAmount.fromJson(Map<String, dynamic> json) => $MonthDataCustomCapitalAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomCapitalAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustomCurrentAmount {
	String amount = '';
	String amountDiff = '';

	MonthDataCustomCurrentAmount();

	factory MonthDataCustomCurrentAmount.fromJson(Map<String, dynamic> json) => $MonthDataCustomCurrentAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomCurrentAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustomDepositAmount {
	String amount = '';
	String amountDiff = '';

	MonthDataCustomDepositAmount();

	factory MonthDataCustomDepositAmount.fromJson(Map<String, dynamic> json) => $MonthDataCustomDepositAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomDepositAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustomManagementAmount {
	String amount = '';
	String amountDiff = '';

	MonthDataCustomManagementAmount();

	factory MonthDataCustomManagementAmount.fromJson(Map<String, dynamic> json) => $MonthDataCustomManagementAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomManagementAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataCustomFundAmount {
	String amount = '';
	String amountDiff = '';

	MonthDataCustomFundAmount();

	factory MonthDataCustomFundAmount.fromJson(Map<String, dynamic> json) => $MonthDataCustomFundAmountFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataCustomFundAmountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataExpenses {
	String totalAmount = '';
	String totalAmountDiff = '';
	List<MonthDataExpensesList> list = [];

	MonthDataExpenses();

	factory MonthDataExpenses.fromJson(Map<String, dynamic> json) => $MonthDataExpensesFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataExpensesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataExpensesList {
	double amount = 0;
	String excerpt = '';

	MonthDataExpensesList();

	factory MonthDataExpensesList.fromJson(Map<String, dynamic> json) => $MonthDataExpensesListFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataExpensesListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataIncome {
	String totalAmount = '';
	String totalAmountDiff = '';
	List<MonthDataIncomeList> list = [];

	MonthDataIncome();

	factory MonthDataIncome.fromJson(Map<String, dynamic> json) => $MonthDataIncomeFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataIncomeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataIncomeList {
	double amount = 0;
	String excerpt = '';

	MonthDataIncomeList();

	factory MonthDataIncomeList.fromJson(Map<String, dynamic> json) => $MonthDataIncomeListFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataIncomeListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MonthDataThreePayment {
	String amount = '';
	String amountDiff = '';

	MonthDataThreePayment();

	factory MonthDataThreePayment.fromJson(Map<String, dynamic> json) => $MonthDataThreePaymentFromJson(json);

	Map<String, dynamic> toJson() => $MonthDataThreePaymentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}