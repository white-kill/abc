import 'package:abc/config/app_config.dart';
import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:get/get.dart';

import '../../../../../../../config/model/record_detail_model.dart';
import 'transfer_record_detail_state.dart';

class TransferRecordDetailLogic extends GetxController {
  final TransferRecordDetailState state = TransferRecordDetailState();


  RecordDetailModel detailModel = RecordDetailModel();

  @override
  void onInit() {
    super.onInit();
    state.id = '${Get.arguments?['id']??''}';

    if(Get.arguments?['model'] == null){
      getData();
    }else{
      detailModel = Get.arguments?['model']??RecordDetailModel();
      update(['updateUI']);
    }
  }



  String valueData(String title) {

    switch (title) {
      case '收款账号':
        return detailModel.oppositeAccount;
      case '收款银行':
        return detailModel.bankName == ''?'---':detailModel.bankName;
      case '付款户名':
        return AppConfig.config.abcLogic.memberInfo.realName;
      case '付款账号':
        return AppConfig.config.abcLogic.card1();
      case '转账方式':
        return detailModel.transactionType == ''?'---':detailModel.transactionType;
      case '转账附言':
        return  detailModel.merchantBranch == ''?'---':detailModel.merchantBranch;
      case '交易时间':
        return detailModel.transactionTime == ''?'---':detailModel.transactionTime.replaceAll('-', '/');
      default:
        return '';
    }
  }

  void getData(){
    Http.get(Apis.billInfo,queryParameters: {
      'id':state.id,
    }).then((v){
      detailModel = RecordDetailModel.fromJson(v);
      update(['updateUI']);
    });
  }
}
