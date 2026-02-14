import 'package:abc/pages/tabs/home/subpages/details_query/component/details_filter_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../config/dio/network.dart';
import '../../../../../config/model/details_query_model.dart';
import '../../../../../config/net_config/apis.dart';
import 'component/time_tool.dart';
import 'details_query_state.dart';

class DetailsQueryLogic extends GetxController {
  final DetailsQueryState state = DetailsQueryState();

  var tagIndex = 0.obs;
  int temIndex = 0;

  bool isLoad = false;

  @override
  void onInit() {
    super.onInit();
    state.controller.addListener(_scrollListener);
    getData();
  }


  void _scrollListener() {
    if (state.controller.position.pixels >
        state.controller.position.maxScrollExtent - 300) {
      if(isLoad) return;
      isLoad = true;
      state.reqData.pageNum++;
      getData();
    }
  }

  @override
  void onClose() {
    state.controller.removeListener(_scrollListener);
    state.controller.dispose();
    super.onClose();
  }


  Future getData() async {
    print(state.reqData.toJson());
    await Http.get(
      Apis.detailsQuery,
      queryParameters: state.reqData.toJson(),
      isLoading: state.reqData.pageNum == 1
    ).then((value) {
      isLoad = false;
      try {
        state.detailsQueryModel = DetailsQueryModel.fromJson(value);
        state.refreshController.loadComplete();
        if (!state.detailsQueryModel.list.isNotEmpty) {
          state.refreshController.loadNoData();
        }
        if (state.reqData.pageNum == 1) {
          state.list = state.detailsQueryModel.list;
        } else {
          state.list = state.list + state.detailsQueryModel.list;
        }
        update(['updateUI']);
      } catch (e) {
        print(e);
      }
    });
  }

  void openPermanentDialog() {
    Get.to(() => DetailsFilterWidget(), transition: Transition.noTransition);
  }

  void sureFilter() {
    String reqType = '';
    if (state.type == '全部') reqType = '';
    if (state.type == '收入') reqType = '1';
    if (state.type == '支出') reqType = '2';
    state.reqData.type = reqType;
    state.reqData.excerpt = state.excerpt;
    state.reqData.pageNum = 1;
    state.reqData.maxAmount = state.textController2.text;
    state.reqData.minAmount = state.textController1.text;
    state.reqData.oppositeName = state.textController3.text;
    state.reqData.oppositeAccount = state.textController4.text;
    state.reqData.endTime = state.endTime;
    state.reqData.beginTime = state.beginTime;
    getData().then((v) {
      state.controller.jumpTo(0);
    });
  }

  void changeTime() {
    DateTime now = DateTime.now();
    state.reqData.endTime = DateFormat('yyyy-MM-dd').format(now);
    if (tagIndex.value == 0) {
      state.reqData.beginTime = DateUtils.getLastWeek();
      state.reqData.pageNum = 1;
    }
    if (tagIndex.value == 1) {
      state.reqData.beginTime = DateUtils.getLastMonth();
      state.reqData.pageNum = 1;
    }
    if (tagIndex.value == 2) {
      state.reqData.beginTime = DateUtils.getLastThreeMonths();
      state.reqData.pageNum = 1;
    }
    state.beginDate = DateTime.parse(state.reqData.beginTime);
    state.beginTime = state.reqData.beginTime;
    state.endDate = DateTime.parse(state.reqData.endTime);
    state.endTime = state.reqData.endTime;
    getData().then((v) {
      if (state.list.isNotEmpty) {
        state.controller.jumpTo(0);
      }
    });
  }
}
