class BillReq {
  BillReq({
      this.pageNum = 1,
      this.pageSize = 20,
      this.beginTime = '',
      this.endTime = '',
      this.maxAmount = '',
      this.minAmount = '',
      this.incomeType = '',
      this.expensesType = '',
      this.financialTransactions = '',
      this.keyword = '',
      this.orderSort = '',
      this.endPageTime = '',
      this.queryTime = '',
      this.totalKeyList = '',
  });

  BillReq.fromJson(dynamic json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    maxAmount = json['maxAmount'];
    minAmount = json['minAmount'];
    incomeType = json['incomeType'];
    expensesType = json['expensesType'];
    financialTransactions = json['financialTransactions'];
    keyword = json['keyword'];
    orderSort = json['orderSort'];
    endPageTime = json['endPageTime'];
    queryTime = json['queryTime'];
    totalKeyList = json['totalKeyList'];
  }
  int pageNum = 1;
  int pageSize = 20;
  String beginTime = '';
  String endTime = '';
  String maxAmount = '';
  String minAmount = '';
  String incomeType = '';
  String expensesType = '';
  String financialTransactions = '';
  String keyword = '';
  String orderSort = '';
  String endPageTime = '';
  String queryTime = '';
  String totalKeyList = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['maxAmount'] = maxAmount;
    map['minAmount'] = minAmount;
    map['incomeType'] = incomeType;
    map['expensesType'] = expensesType;
    map['financialTransactions'] = financialTransactions;
    map['keyword'] = keyword;
    map['orderSort'] = orderSort;
    map['endPageTime'] = endPageTime;
    map['queryTime'] = queryTime;
    map['totalKeyList'] = totalKeyList;
    return map;
  }

}