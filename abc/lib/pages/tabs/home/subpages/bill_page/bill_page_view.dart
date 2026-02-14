import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/item1_widget.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/item2_widget.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/filter_time_page.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/more/more_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../config/model/bill_one_model.dart';
import '../../../../../routes/app_pages.dart';
import 'bill_detail/bill_detail_view.dart';
import 'bill_page_logic.dart';
import 'bill_page_state.dart';
import 'conmponent/bill_page_top_widget.dart';
import 'detail_search/detail_search_view.dart';

class BillPagePage extends BaseStateless {
  BillPagePage({Key? key}) : super(key: key, title: '收支');

  final BillPageLogic logic = Get.put(BillPageLogic());
  final BillPageState state = Get.find<BillPageLogic>().state;

  @override
  get refreshController => state.refreshController;

  @override
  List<Widget>? get rightAction => [
        Image(
          image: 'icon_search'.png3x,
          width: 22.w,
          height: 22.w,
          color: Color(0xff707070),
        ).withOnTap(onTap: () {
          Get.toNamed(
            Routes.detailSearchPage,
          );
        }).withPadding(
          right: 12.w,
        ),
        Image(
          image: 'ic_sz_more'.png3x,
          width: 24.w,
          height: 24.w,
        ).withOnTap(onTap: () {
          Get.to(() => MorePage());
        }).withPadding(
          right: 20.w,
        ),
      ];

  @override
  void onLoading() {
    super.onLoading();
    // state.reqData.pageNum++;
    // logic.pageNumOne = false;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        BillPageTopWidget(),
        GetBuilder(
          builder: (BillPageLogic c) {
            return state.isDay
                ? Expanded(
                    child: state.oneList.isEmpty && !logic.showFirst
                        ? Column(
                            children: [
                              SizedBox(
                                height: 110.w,
                              ),
                              Image(
                                image: 'ic_mx_no_data'.png3x,
                                width: 165.w,
                                height: 165.w,
                              ),
                            ],
                          )
                        : refreshWidget(
                            child: ListView.builder(
                            controller: state.controller,
                            itemBuilder: (context, index) {
                              BillOneList model = state.oneList[index];
                              if (model.type == '3') {
                                return Item1Widget(
                                  model: model,
                                );
                              }
                              // 判断是否是每月最后一条数据
                              bool isLastInMonth = false;
                              if (index == state.oneList.length - 1) {
                                isLastInMonth = true;
                              } else {
                                BillOneList nextModel = state.oneList[index + 1];
                                // 下一条是月份标题(type==3)或月份不同，则当前是该月最后一条
                                if (nextModel.type == '3' || nextModel.month != model.month) {
                                  isLastInMonth = true;
                                }
                              }
                              return Item2Widget(
                                model: model,
                                isLastInMonth: isLastInMonth,
                              ).withOnTap(onTap: () {
                                print(model);
                                Get.to(() => BillDetailPage(), arguments: {
                                  'model': model.billDetail,
                                  'excerpt': model.excerpt
                                });
                              });
                            },
                            itemCount: state.oneList.length,
                          )),
                  )
                : Expanded(
                    child: FilterTimePage(
                    controller: state.billController,
                    beginTime: state.beginTime,
                    endTime: state.endTime,
                  ));
          },
          id: 'updateUI',
        )
      ],
    );
  }
}
