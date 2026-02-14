import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:get/get.dart';

import '../../../../../config/model/export_record_model.dart';
import 'export_record_state.dart';

class ExportRecordLogic extends GetxController {
  final ExportRecordState state = ExportRecordState();

  ExportRecordModel recordModel = ExportRecordModel();
  
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  
  void getData(){
    Http.get(Apis.flowExportApplyPage,queryParameters: {
      'pageSize':state.pageSize,
      'pageNum':state.pageNum,
      'detailType':'',
      'dateTime':''
    }).then((v){
      recordModel = ExportRecordModel.fromJson(v);
      state.refreshController.loadComplete();
      if(!recordModel.list.isNotEmpty){
        state.refreshController.loadNoData();
      }
      if (state.pageNum == 1) {
        state.list = recordModel.list;
      } else {
        state.list = state.list + recordModel.list;
      }
      update(['updateUI']);
    });
  }
}
