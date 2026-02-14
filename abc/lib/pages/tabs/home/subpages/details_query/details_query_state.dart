import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../config/model/details_query_model.dart';
import 'Req_data.dart';
import 'component/time_tool.dart';

class DetailsQueryState {

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();
  List<DetailsQueryList> list = [];

  DetailsQueryModel detailsQueryModel = DetailsQueryModel();

  ReqData reqData = ReqData();

  List tagName = [
    '近一周',
    '近一月',
    '近三月',
    '筛选'
  ];



  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();


  String type = '';
  String excerpt = '';
  String beginTime = '';
  String endTime = '';


  String currentTime = '';

  DateTime endDate =  DateTime.now().subtract(const Duration(days: 7));
  DateTime beginDate =  DateTime.now();

  DetailsQueryState() {
    ///Initialize variables
    reqData.pageNum = 1;
    reqData.pageSize = 20;
    DateTime now = DateTime.now();
    currentTime = DateFormat('yyyy-MM-dd').format(now);

    reqData.endTime = currentTime;
    reqData.beginTime = DateUtils.getLastWeek();

    beginDate = DateTime.parse(reqData.beginTime);
    beginTime = reqData.beginTime;
    endTime = reqData.endTime;
  }
}
