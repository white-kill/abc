class ReqData {
  ReqData({
      this.beginTime = '',
      this.endTime = '',
      this.oppositeAccount = '',
      this.pageNum = 1,
      this.pageSize = 10,
      this.endPageTime = '',
      this.keyword = '',});

  ReqData.fromJson(dynamic json) {
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    oppositeAccount = json['oppositeAccount'];
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    keyword = json['keyword'];
    endPageTime = json['endPageTime'];
  }
  String beginTime = '';
  String endTime = '';
  String oppositeAccount = '';
  int pageNum = 1;
  int pageSize = 10;
  String keyword = '';
  String endPageTime = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['oppositeAccount'] = oppositeAccount;
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['keyword'] = keyword;
    map['endPageTime'] = endPageTime;
    return map;
  }

}