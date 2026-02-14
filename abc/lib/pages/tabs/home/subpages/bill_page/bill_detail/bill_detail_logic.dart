import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../../config/model/bill_one_model.dart';
import 'bill_detail_state.dart';

class BillDetailLogic extends GetxController {
  final BillDetailState state = BillDetailState();

  var showAll = false.obs;

  var switchValue = true.obs;

  var selTxt = '请选择'.obs;

  var categoryText = ''.obs;
  String temCategoryText = '';

  String excerpt = '';

  BillOneListBillDetail billDetail = BillOneListBillDetail();

  List nameLis =  [];


  String zdStr = '';
  @override
  void onInit() {
    super.onInit();
    billDetail = Get.arguments['model'];
    excerpt = Get.arguments?['excerpt']??'';
    categoryText.value =  billDetail.transactionCategory == ''?'--':billDetail.transactionCategory;

    nameLis =billDetail.type == '1'?state.nameLis_1:state.nameLis_0;
    zdStr =billDetail.type == '1'?'给他转账':'再转一笔';

    if(billDetail.oppositeBankName != ''){
      if(billDetail.type == '1'){
        nameLis.insert(3, '付款银行');
      }else{
        nameLis.insert(3, '收款银行');
      }
    }

  }


  String type(){
    if(billDetail.type == '1'){
      return '+';
    }
    if(billDetail.type == '2'){
      return '-';
    }
    return '+';
  }

  String valueName(String name) {
    switch (name) {
      case '交易时间':
        return  billDetail.transactionTime;
      case '收款方':
      case '付款方':
        return  billDetail.oppositeName;
      case '收款账户':
      case '付款账户':
        return  billDetail.oppositeAccount;
      case '付款银行':
      case '收款银行':
        return  billDetail.oppositeBankName == ''?'---':billDetail.oppositeBankName;
      case '交易摘要':
        return  billDetail.excerpt;
      case '交易附言':
        return  billDetail.merchantBranch == ''?'---':billDetail.merchantBranch;
      case '交易卡号':
        return  billDetail.bankCard.maskBankCardNumber();
      case '交易类型':
        return  billDetail.transactionType == ''?'---':billDetail.transactionType;
      default:
        return '';
    }
  }
}
