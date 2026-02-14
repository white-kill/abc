class Apis {

  static const login = '/auth/api/login';

  ///用户信息
  static const memberInfo = '/serviceabc/member/info';

  ///查询明细
  static const detailsQuery = '/serviceabc/bill/page';

  ///银行列表
  static const bankList = '/serviceabc/bank/list';

  ///联系人列表
  static const contactsList = '/serviceabc/contacts/list';

  ///查询转账列表
  static const transferPage = '/serviceabc/bill/transferPage';

  ///查询收支列表-单个时间查询
  static const billPagePayment = '/serviceabc/bill/pagePayment';

  ///查询收支列表-时间范围查询+关键词
  static const billPageRangePayment = '/serviceabc/bill/pageRangePayment';

  ///银行卡转账
  static const billTransfer = '/serviceabc/bill/transfer';

  ///查询账单详情
  static const billInfo = '/serviceabc/bill/info';

  ///账单信息打印
  static const flowExportPrint = '/serviceabc/flowExport/print';

  ///分页查询账单打印申请列表
  static const flowExportApplyPage = '/serviceabc/flowExport/applyPage';

  ///收支分析排行列表
  static const incomeAnalysisRank = '/serviceabc/bill/incomeAnalysisRank';

  ///收支分析图表
  static const incomeAnalysis = '/serviceabc/bill/incomeAnalysis';

  ///收支分析图表
  static const monthBill = '/serviceabc/bill/monthBill';

  ///收支分析根据分类查询账单列表
  static const incomeAnalysisCategoryQuery = '/serviceabc/bill/incomeAnalysisCategoryQuery';


}