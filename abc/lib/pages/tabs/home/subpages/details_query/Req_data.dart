class ReqData {
  ReqData({
      this.beginTime = '',
      this.endTime = '',
      this.maxAmount = '',
      this.minAmount = '',
      this.oppositeAccount = '',
      this.oppositeName = '',
      this.pageNum = 1,
      this.pageSize = 20,
      this.transactionType = '',
      this.excerpt = '',
      this.type = '',});

  ReqData.fromJson(dynamic json) {
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    maxAmount = json['maxAmount'];
    minAmount = json['minAmount'];
    oppositeAccount = json['oppositeAccount'];
    oppositeName = json['oppositeName'];
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    transactionType = json['transactionType'];
    type = json['type'];
    excerpt = json['excerpt'];
  }
  String beginTime = '';
  String endTime = '';
  String maxAmount = '';
  String minAmount = '';
  String oppositeAccount = '';
  String oppositeName = '';
  int pageNum = 1;
  int pageSize = 20;
  String transactionType = '';
  String type = '';
  String excerpt = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['maxAmount'] = maxAmount;
    map['minAmount'] = minAmount;
    map['oppositeAccount'] = oppositeAccount;
    map['oppositeName'] = oppositeName;
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['transactionType'] = transactionType;
    map['type'] = type;
    map['excerpt'] = excerpt;
    return map;
  }

}