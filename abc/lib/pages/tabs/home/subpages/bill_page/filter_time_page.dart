import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/dio/network.dart';
import '../../../../../config/model/search_bill_model.dart';
import '../../../../../config/net_config/apis.dart';
import 'bill_detail/bill_detail_view.dart';
import 'bill_req.dart';
import 'conmponent/bill_controller.dart';
import 'conmponent/item2_search_widget.dart';

class FilterTimePage extends StatefulWidget {
  final BillController controller;
  final String beginTime;
  final String endTime;

  const FilterTimePage(
      {super.key,
      required this.controller,
      required this.beginTime,
      required this.endTime});

  @override
  State<FilterTimePage> createState() => _FilterTimePageState();
}

class _FilterTimePageState extends State<FilterTimePage> {
  RefreshController refreshController = RefreshController();
  ScrollController listController = ScrollController();

  BillReq billReq = BillReq();

  SearchBillModel searchBillModel = SearchBillModel();
  List<SearchBillList> list = [];


  String incomeTotal = '';
  String expensesTotal = '';

  Future getData() async {
    await Http.get(
      Apis.billPageRangePayment,
      queryParameters: billReq.toJson(),
    ).then((value) {
      searchBillModel = SearchBillModel.fromJson(value);
      refreshController.loadComplete();
      if (billReq.pageNum == 1) {
        incomeTotal = searchBillModel.incomeTotal;
        expensesTotal = searchBillModel.expensesTotal;
      }
      if (!searchBillModel.list.isNotEmpty) {
        refreshController.loadNoData();
      }
      if (billReq.pageNum == 1) {
        list = searchBillModel.list;
      } else {
        list = list + searchBillModel.list;
      }
      setState(() {});
    });
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

  @override
  void dispose() {
    listController.removeListener(_handleScroll);
    listController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    billReq.orderSort = '1';
    DateTime now = DateTime.now();
    DateTime januarySameDay = getJanuarySameDay(now);
    var formatter2 = DateFormat('yyyy-MM-dd');
    if (widget.beginTime == '') {
      billReq.beginTime = formatter2.format(januarySameDay);
    } else {
      billReq.beginTime = widget.beginTime;
    }
    if (widget.endTime == '') {
      billReq.endTime = formatter2.format(now);
    } else {
      billReq.endTime = widget.endTime;
    }

    getData();
    widget.controller.addListener(_onController);
    listController.addListener(_handleScroll);
  }

  bool showTab = true;

  _onController() {
    if (mounted) {
      if (widget.controller.type == "changeType") {}
      if (widget.controller.type == "changeTime") {
        billReq = widget.controller.billReq1!;
        billReq.beginTime = widget.controller.beginTime;
        billReq.endTime = widget.controller.endTime;
        billReq.pageNum = 1;
        getData().then((v) {
          listController.jumpTo(0);
        });
      }
      if (widget.controller.type == "changeKeyword") {}

      getData();
    }
  }

  final double _lastPosition = 0;
  bool _showWidget = false;

  void _handleScroll() {
    final currentPosition = listController.position.pixels;
    final delta = currentPosition - _lastPosition;
    if (delta == 0 && _showWidget) {
      setState(() => _showWidget = false);
    }
    if (!_showWidget && delta > 20) {
      setState(() => _showWidget = true);
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          color: Colors.white,
          child: Stack(
            children: [
              // _showWidget
              //     ? Container(
              //         color: Color(0xffF3AD3C).withOpacity(0.08),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Column(
              //               children: [
              //                 BaseText(
              //                   text: '支出¥${expensesTotal}',
              //                   fontSize: 11.sp,
              //                 ),
              //                 SizedBox(
              //                   height: 8.w,
              //                 ),
              //                 BaseText(
              //                   text: '收入¥$incomeTotal',
              //                   fontSize: 11.sp,
              //                 ),
              //               ],
              //             ),
              //             Container(
              //               width: 50.w,
              //               height: 20.w,
              //               margin: EdgeInsets.only(left: 16.w),
              //               decoration: BoxDecoration(
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(10.w)),
              //                 border: Border.all(
              //                     color: Color(0xff979797), width: 1.w),
              //               ),
              //               alignment: Alignment.center,
              //               child: BaseText(text: '分析'),
              //             )
              //           ],
              //         ).withPadding(
              //           all: 15.w,
              //         ),
              //       )
              //     : SizedBox.shrink(),
              _showWidget
                  ? SizedBox.shrink()
                  : Stack(
                    children: [
                      Container(
                          width: 1.sw,
                          height: 413/1290 * 1.sw,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: 'ic_zc_sx'.png3x, fit: BoxFit.fitWidth),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60.w,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BaseText(
                                          text: expensesTotal,
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 18.sp,
                                          ),
                                        ),

                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BaseText(
                                          text: incomeTotal,
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 18.sp,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ).withPadding(
                                  left: 15.w,
                                  right: 15.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Positioned(
                          right: 38.w,
                          top: 25.w,
                          child: Container(
                        width: 20.w,
                        height: 20.w,
                      ).withOnTap(onTap: () {
                        Get.dialog(
                          Material(
                            color: Colors.transparent,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Image(
                                    image: 'shouzhi_dialog'.png,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          barrierDismissible: true,
                        );
                      }))
                    ],
                  ),
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
            controller: listController,
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
