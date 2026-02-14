import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/filter_item_widget.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/transfer_record_detail/transfer_record_detail_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/customer/customer_view.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import 'filter_time_widget.dart';
import 'record_item.dart';
import 'transfer_record_logic.dart';
import 'transfer_record_state.dart';

class TransferRecordPage extends BaseStateless {
  TransferRecordPage({Key? key}) : super(key: key, title: '转账记录查询');

  final TransferRecordLogic logic = Get.put(TransferRecordLogic());
  final TransferRecordState state = Get.find<TransferRecordLogic>().state;

  @override
  get refreshController => state.refreshController;

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_home_customer'.png3x,
      width: 22.w,
      height: 22.w,
      color: Colors.black,
    )
        .withPadding(
      left: 0.w,
      right: 15.w,
    )
        .withOnTap(onTap: () {
      Get.to(() => CustomerPage());
    }),
  ];

  @override
  void onLoading() {
    super.onLoading();
    state.reqData.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;

  @override
  bool get enablePullUp => true;

  @override
  Color? get background => Color(0xffF1F1F1);

  @override
  Widget initBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.sw,
          height: 80.w,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  width: 432.w,
                  height: 33.w,
                  margin: EdgeInsets.only(left: 23.w, right: 23.w),
                  decoration: BoxDecoration(
                    color: Color(0xffF1F1F1),
                    borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Image(
                        image: 'ic_search_left'.png3x,
                        width: 20.w,
                        height: 20.w,
                        color: const Color(0xffaeaeae),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          textAlign: TextAlign.start,
                          controller: state.searchController,
                          style: TextStyle(fontSize: 14.sp),
                          hintStyle: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 14.sp,
                          ),
                          hintText: '输入户名/账号/手机号/收款银行搜索',
                          onChanged: (v){
                            logic.onSearch();
                          },
                          onSubmitted: (v){
                            logic.onSearch();
                          }
                        ),
                      )
                    ],
                  )),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Obx(() => BaseText(
                                text: state.dataList[state.selIndex.value]['title'],
                                fontSize: 14.sp,
                                color: Color(0xff333333),
                              )),
                              SizedBox(
                                width: 6.w,
                              ),
                              Image(
                                image: 'ic_mx_sx1'.png3x,
                                width: 12.w,
                                height: 6.w,
                              )
                            ],
                          ).withContainer(
                              height: 45.h
                          ).withOnTap(onTap: () {
                            SheetBottom.show(
                                title: '全部账户',
                                child: FilterItemWidget(
                                  selectIndex: state.selIndex.value,
                                  callBackIndex: (int index) {
                                    state.dialogController.disMiss();
                                    state.selIndex.value = index;
                                  },
                                ));
                          })),
                      Container(
                          child:GetBuilder(builder: (TransferRecordLogic c){
                            return  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BaseText(
                                  text: logic.tagName(),
                                  fontSize: 14.sp,
                                  color: Color(0xff03C3AD),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Image(
                                  image: 'ic_mx_sx1'.png3x,
                                  width: 12.w,
                                  height: 6.w,
                                  color: Color(0xff03C3AD),
                                )
                              ],
                            ).withContainer(
                                height: 45.h
                            ).withOnTap(onTap: () {
                              state.dialogController.showDialog();
                            });
                          },id: 'updateTitle',))
                    ],
                  ))
            ],
          ),
        ),
        GetBuilder(
          builder: (TransferRecordLogic c) {
            return SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: state.list.isEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //jymx_pl
                        Image(
                          image: 'ic_empty'.png3x,
                          width: screenWidth,
                          fit: BoxFit.fitWidth,
                          height: 1.sh - 200.w,
                        ),
                      ],
                    )
                  : refreshWidget(
                      child: ListView.separated(
                      padding: EdgeInsets.only(top: 12.w),
                      controller: state.controller,
                      itemBuilder: (context, index) {
                        // if (state.list[index].day != '') {
                        //   return _widgetItem(state.list[index].day);
                        // }
                        return RecordItem(
                          model: state.list[index],
                        ).withOnTap(onTap: (){
                          print(state.list[index].billDetail);
                          Get.to(() => TransferRecordDetailPage(),arguments: {
                            "id":state.list[index].id,
                            "model":state.list[index].billDetail,
                          });
                        });
                      },
                      itemCount: state.list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 1.sw,
                          height: 0.5.w,
                          margin: EdgeInsets.only(left: 23.w),
                          color: Color(0xffE9E9E9),
                        );
                      }, //state.list.length,
                    )),
            );
          },
          id: 'updateUI',
        ).withPadding(
          top: 80.w,
        ),
        FilterTimeWidget(controller: state.dialogController,).withPadding(top: 80.w),
      ],
    );
  }

  Widget _widgetItem(String day) {
    return Container(
      width: 1.sw,
      height: 36.w,
      color: Color(0xffF7F7F7),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16.w),
      child: BaseText(
        text: day,
        fontSize: 14.sp,
        color: Color(0xff666666),
      ),
    );
  }
}
