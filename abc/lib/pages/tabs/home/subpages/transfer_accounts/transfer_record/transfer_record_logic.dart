import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/model/new_transfer_list_model.dart';
import '../../../../../../config/net_config/apis.dart';
import '../../details_query/component/time_tool.dart';
import 'transfer_record_state.dart';

class TransferRecordLogic extends GetxController {
  final TransferRecordState state = TransferRecordState();

  bool showFirst = true;

  @override
  void onInit() {
    super.onInit();

    state.reqData.oppositeAccount = Get.arguments?['oppositeAccount']??'';
    changeTime();
  }

  Future getData() async {

    print(state.reqData.toJson());
   await Http.get(
      Apis.transferPage,
      queryParameters: state.reqData.toJson(),).then((value) {
      state.transferListModel = NewTransferListModel.fromJson(value);
      state.refreshController.loadComplete();
      if(state.transferListModel.list.isNotEmpty){
        state.reqData.endPageTime = state.transferListModel.list.last.day;
      }else{
        state.refreshController.loadNoData();
      }
      showFirst = false;
      if(state.reqData.pageNum == 1){
        state.list = state.transferListModel.list;
        state.originalList = List.from(state.transferListModel.list); // 保存原始列表
      }else{
        state.list = state.list + state.transferListModel.list;
        state.originalList = state.originalList + state.transferListModel.list; // 追加到原始列表
      }

      // 如果有搜索关键词，重新执行搜索
      if(state.searchController.text.isNotEmpty){
        onSearch();
      } else {
        update(['updateUI']);
      }
    });
  }

  List titleName = ['近一周', '近一月', '近三月', '自定义'];
  String tagName(){
    if(state.selectTagIndex == 0) return '近一周';
    if(state.selectTagIndex == 1) return '近一月';
    if(state.selectTagIndex == 2) return '近三月';
    if(state.selectTagIndex == 3){
      if(state.beginTime != '' && state.endTime !=''){
        return '${state.beginTime} - ${state.endTime}';
      }
    }
    return '';
  }

  void onSearch() {
    String searchVal = state.searchController.text.trim();
    
    if(searchVal.isEmpty){
      // 如果搜索关键词为空，恢复原始列表
      state.list = List.from(state.originalList);
    } else {
      // 根据 oppositeName 和 oppositeAccount 进行模糊查询
      state.list = state.originalList.where((item) {
        String oppositeName = item.oppositeName.toLowerCase();
        String oppositeAccount = item.oppositeAccount.toLowerCase();
        String searchLower = searchVal.toLowerCase();
        
        return oppositeName.contains(searchLower) || oppositeAccount.contains(searchLower);
      }).toList();
    }
    
    update(['updateUI']);
  }

  void changeTime(){
    DateTime now = DateTime.now();
    state.reqData.endTime = DateFormat('yyyy-MM-dd').format(now);
    if(state.selectTagIndex == 0){
      state.reqData.beginTime = DateUtils.getLastWeek();
    }
    if(state.selectTagIndex == 1){
      state.reqData.beginTime = DateUtils.getLastMonth();
    }
    if(state.selectTagIndex == 2){
      state.reqData.beginTime = DateUtils.getLastThreeMonths();
    }
    state.reqData.pageNum = 1;
    state.reqData.endPageTime = '';
    getData().then((v){
      if(state.list.length > 10){
        state.controller.jumpTo(0);
      }
    });
  }

  void zdyTime(){
    state.reqData.beginTime = state.beginTime;
    state.reqData.endTime = state.endTime;
    state.reqData.pageNum = 1;
    state.reqData.endPageTime = '';
    getData().then((v){
      if(state.list.isNotEmpty){
        state.controller.jumpTo(0);
      }
    });
  }
}
