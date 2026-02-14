import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/search_time_widget.dart';
import 'package:abc/utils/abc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/model/search_bill_model.dart';
import '../../../../../../config/net_config/apis.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import '../bill_detail/bill_detail_view.dart';
import '../bill_req.dart';
import '../detail_search/detail_search_logic.dart';
import '../detail_search/detail_search_state.dart';
import 'bill_controller.dart';
import 'item2_search_widget.dart';

class FilterPage extends StatefulWidget {
  final BillController controller;
  final String keyword;

  const FilterPage(
      {super.key, required this.controller, required this.keyword});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  BillReq billReq = BillReq();

  SearchBillModel searchBillModel = SearchBillModel();
  List<SearchBillList> list = [];

  String incomeTotal = '';
  String expensesTotal = '';

  final DetailSearchLogic logic = Get.put(DetailSearchLogic());
  final DetailSearchState state = Get.find<DetailSearchLogic>().state;

  Future getData() async {
    print(billReq.toJson());
    await Http.get(
      Apis.billPageRangePayment,
      queryParameters: billReq.toJson(),
    ).then((value) {
      searchBillModel = SearchBillModel.fromJson(value);
      refreshController.loadComplete();
      if (!searchBillModel.list.isNotEmpty) {
        refreshController.loadNoData();
      }
      if (billReq.pageNum == 1) {
        incomeTotal = searchBillModel.incomeTotal;
        expensesTotal = searchBillModel.expensesTotal;
      }
      if (billReq.pageNum == 1) {
        list = searchBillModel.list;
      } else {
        list = list + searchBillModel.list;
      }
      setState(() {});
    });
  }

  void sureTime(){

    state.isDay = state.isTemDay;
    if (state.isDay) {
      state.queryTime = state.temQueryTime;
      billReq.pageNum = 1;
      billReq.endPageTime = '';
      billReq.totalKeyList = '';
      billReq.beginTime = getFirstAndLastDayOfMonth(state.queryTime)['firstDay']??'';
      billReq.endTime = getFirstAndLastDayOfMonth(state.queryTime)['lastDay']??'';
      getData().then((e) {
        controller.jumpTo(0);
      });
    } else {
      billReq.queryTime = '';
      billReq.pageNum = 1;
      state.beginTime = state.temBeginTime;
      state.endTime = state.temEndTime;
      billReq.beginTime = state.temBeginTime;
      billReq.endTime = state.temEndTime;
      getData().then((e) {
        controller.jumpTo(0);
      });
    }

  }

  DateTime getJanuarySameDay(DateTime currentDate) {
    try {
      // 尝试创建1月份的相同日期
      return DateTime(currentDate.year, 1, currentDate.day);
    } catch (e) {
      // 如果日期无效（如1月31日但2月只有28/29天），则返回1月最后一天
      return DateTime(currentDate.year, 1 + 1, 0); // 下个月的第0天就是上个月的最后一天
    }
  }

  // 核心方法：传入"2025-08"格式字符串，返回月份的第一天和最后一天（格式为'yyyy-MM-dd'）
  Map<String, String> getFirstAndLastDayOfMonth(String yearMonth) {
    // 验证输入格式
    final regex = RegExp(r'^\d{4}-\d{2}$');
    if (!regex.hasMatch(yearMonth)) {
      throw FormatException('请输入正确的格式: YYYY-MM (如: 2025-08)');
    }

    final parts = yearMonth.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);

    // 验证月份范围
    if (month < 1 || month > 12) {
      throw RangeError('月份必须在1-12之间');
    }

    // 计算当月第一天
    final firstDay = DateTime(year, month, 1);

    // 计算当月最后一天
    final lastDay = DateTime(year, month + 1, 0);

    // 格式化为'yyyy-MM-dd'
    final formatter = DateFormat('yyyy-MM-dd');

    return {
      'firstDay': formatter.format(firstDay),
      'lastDay': formatter.format(lastDay),
    };
  }


  @override
  void initState() {
    super.initState();
    billReq.orderSort = '1';
    billReq.keyword = widget.keyword;
    // DateTime now = DateTime.now();
    // DateTime januarySameDay = getJanuarySameDay(now);

    // var formatter2 = DateFormat('yyyy-MM-dd');
    // billReq.beginTime = formatter2.format(januarySameDay);
    // billReq.endTime = formatter2.format(now);
    if(state.isDay){
      billReq.beginTime = getFirstAndLastDayOfMonth(state.queryTime)['firstDay']??'';
      billReq.endTime = getFirstAndLastDayOfMonth(state.queryTime)['lastDay']??'';
    }else{
      billReq.beginTime = state.beginTime;
      billReq.endTime = state.endTime;
    }
    getData();
    widget.controller.addListener(_onController);
  }

  bool showTab = true;

  _onController() {
    if (mounted) {
      if (widget.controller.type == "changeType") {}
      if (widget.controller.type == "changeTime") {}
      if (widget.controller.type == "changeKeyword") {}

      getData();
    }
  }

  Widget _tagWidget(String content) {
    return Row(
      children: [
        BaseText(
          text: content,
          color: Color(0xff333333),
          fontSize: 12.sp,
        ),
        SizedBox(
          width: 4.w,
        ),
        Image(
          image: 'arr_dow'.png3x,
          width: 10.w,
          height: 10.w,
          color: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          child: Column(
            children: [
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _tagWidget(state.isDay?state.queryTime:'${billReq.beginTime}-${billReq.endTime}').withOnTap(onTap: (){
                    SheetBottom.show(
                        showTopText: true,
                        title: '',
                        child: SearchTimeWidget(),
                        sureCallBack: () {
                          sureTime();
                        });
                  }),
                  Row(
                    children: [
                      AbcButton(
                        title: '按时间',
                        width: 48.w,
                        height: 20.w,
                        titleColor: billReq.orderSort == '1'
                            ? Colors.white
                            : Color(0xff333333),
                        bgColor: billReq.orderSort == '1'
                            ? Color(0xffF3AD3C)
                            : const Color(0xFFF7F7F7),
                        fontSize: 11.sp,
                        onTap: () async {
                          billReq.orderSort = '1';
                          billReq.pageNum = 1;
                          await getData();
                          controller.jumpTo(0);
                        },
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      AbcButton(
                        title: '按金额',
                        width: 48.w,
                        height: 20.w,
                        titleColor: billReq.orderSort == '2'
                            ? Colors.white
                            : Color(0xff333333),
                        bgColor: billReq.orderSort == '2'
                            ? Color(0xffF3AD3C)
                            : const Color(0xFFF7F7F7),
                        fontSize: 11.sp,
                        onTap: () async {
                          billReq.orderSort = '2';
                          billReq.pageNum = 1;
                          await getData();
                          controller.jumpTo(0);
                        },
                      ),
                    ],
                  ),
                ],
              ).withPadding(
                left: 12.w,
                right: 12.w,
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                height: 50.w,
                color: Color(0xffF3AD3C).withOpacity(0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      text: '支出¥$expensesTotal',
                      fontSize: 12.sp,
                    ),
                    BaseText(
                      text: '共${searchBillModel.total}笔交易',
                      fontSize: 12.sp,
                    ),
                  ],
                ).withPadding(
                  left: 12.w,
                  right: 12.w,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: refreshController,
          physics: const ClampingScrollPhysics(),
          onLoading: () {
            billReq.pageNum++;
            getData();
          },
          child: ListView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return Item2SearchWidget(
                model: list[index],
              ).withOnTap(onTap: () {
                Get.to(() => BillDetailPage(), arguments: {
                  'model': list[index].billDetail,
                  'excerpt': list[index].excerpt,
                });
              });
            },
            itemCount: list.length,
          ),
        ))
      ],
    );
  }
}
