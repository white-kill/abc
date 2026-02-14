import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../config/app_config.dart';
import '../../../../../../config/model/new_transfer_list_model.dart';
import '../../../../../../config/model/transfer_list_model.dart';
import 'Req_data.dart';
import 'filter_time_widget.dart';

class TransferRecordState {

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  TextEditingController searchController = TextEditingController();

  NewTransferListModel transferListModel = NewTransferListModel();
  List<NewTransferListList> list = [];
  List<NewTransferListList> originalList = []; // 保存原始列表用于搜索

  ReqData reqData = ReqData();

  List dataList = [
    {'image': 'ic_qbzh', 'title': '全部账户'},
    {
      'image': 'ic_tkjjk',
      'title': '借记卡(${AppConfig.config.abcLogic.cardFour()})'
    },
  ];

  RxInt selIndex = 0.obs;

  int selectTagIndex = 0;


  FilterTimeWidgetDialogController dialogController = FilterTimeWidgetDialogController();


  String beginTime = '';
  String endTime = '';

  TransferRecordState() {
    ///Initialize variables
  }
}
