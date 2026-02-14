class SearchContentState {

  Map<String, List<String>> contentDat = {
    '明细': [
      '明细查询',
      '记账本',
      '流水打印',
    ],
    '明细导出': [
     '流水打印',
     '明细查询',
     '记账本',
    ],
    '收支': [
      '收支',
      '收支分析',
      '记账本',
    ],
    '转账': [
      '转账',
      '账号转账',
      '多人转账',
    ],
    '流水打印': [
      '流水打印',
    ],
  };


  Map tagNameMap  = {
    '明细': '明细查询',
    '明细导出': '流水打印',
    '收支': '收支',
    '转账':'转账',
    '流水打印': '流水打印'
  };
  SearchContentState() {
    ///Initialize variables
  }
}
