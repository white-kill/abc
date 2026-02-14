import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/long_press_five_seconds.dart';
import '../../../../other/sheet_widget/picker.dart';
import '../details_query_logic.dart';
import '../details_query_state.dart';

class DetailsFilterWidget extends StatefulWidget {
  const DetailsFilterWidget({super.key});

  @override
  State<DetailsFilterWidget> createState() => _DetailsFilterWidgetState();
}

class _DetailsFilterWidgetState extends State<DetailsFilterWidget> {
  final DetailsQueryLogic logic = Get.put(DetailsQueryLogic());
  final DetailsQueryState state = Get.find<DetailsQueryLogic>().state;

  int lastYear = 10;

  List<String> data1 = ['全部', '收入', '支出'];

  List<String> data2 = ['全部', '工资', '理财', '基金', '外汇'];

  Color selectColor(String name, {String type = '1', bool bg = false}) {
    if (bg) {
      if (selectName(name, type: type)) return Colors.orangeAccent;
      return Colors.transparent;
    } else {
      if (selectName(name, type: type)) return Colors.orangeAccent;
      return const Color(0xffCBCBCB);
    }
  }

  Color selectTextColor(String name, {String type = '1'}) {
    if (selectName(name, type: type)) return Colors.white;
    return Colors.black;
  }

  bool selectName(String name, {String type = '1'}) {
    if (type == '1') {
      return state.type == name;
    }
    return state.excerpt == name;
  }

  DateTime temEndDate =  DateTime.now();
  DateTime temBeginDate =  DateTime.now();
  String temBeginTime = '';
  String temEndTime = '';

  @override
  void initState() {
    super.initState();
    state.textController1.text = state.reqData.minAmount;
    state.textController2.text = state.reqData.maxAmount;
    state.textController3.text = state.reqData.oppositeName;
    state.textController4.text = state.reqData.oppositeAccount;
    temBeginDate = state.beginDate;
    temEndDate = state.endDate;
    temBeginTime = state.beginTime;
    temEndTime = state.endTime;
    logic.temIndex = logic.tagIndex.value;

    if(spLastYear != ''){
      lastYear = int.parse(spLastYear);
    }
  }

  void resetDat() {
    state.textController1.text = '';
    state.textController2.text = '';
    state.textController3.text = '';
    state.textController4.text = '';

    state.type = '';
    state.excerpt = '';
    // state.beginTime = '';
    // state.endTime = '';
    temBeginTime = state.beginTime;
    temEndTime = state.endTime;
    temBeginDate = state.beginDate;
    temEndDate = state.endDate;
    setState(() {});
  }
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: navHeight - 0.5,
            alignment: Alignment.centerLeft,
            color: Colors.white,
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: ScreenUtil().statusBarHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.navigate_before,
                  size: 30.h,
                  color: Colors.black,
                ).withOnTap(onTap: () {
                  // SmartDialog.dismiss();
                  Get.back();
                }),
                BaseText(
                  text: '筛选',
                  fontSize: 16.sp,
                ),
                SizedBox(
                  width: 30.w,
                ),
              ],
            ),
          ),

          Container(
            width: 1.sw,
            height: 0.5.w,
            color: Color(0xffdedede),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [

              LongPressFiveSeconds(child: BaseText(
                text: '交易时间',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w), onLongPressCompleted: (){
                AlterWidget.alterWidget(clickMaskDismiss: true,builder: (context) {
                  return Container(
                    width: 1.sw * 0.8,
                    height: 150.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.w))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 12.w,),
                        BaseText(text: '填写可以查询几年前的数据',style: TextStyle(
                            fontSize: 15.w
                        ),),
                        SizedBox(height: 8.w,),
                        TextFieldWidget(
                          hintText: '请填写数字(填写1是1年前的)',
                          controller: textEditingController,
                           keyboardType:TextInputType.number ,
                        ).withContainer(
                            margin: EdgeInsets.only(left: 12.w,right: 12.w),
                            padding: EdgeInsets.only(left: 12.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffdedede),
                                    width: 0.5.w
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4.w))
                            )
                        ),
                        SizedBox(height: 10.w,),
                        Container(
                          width: 1.sw * 0.88,
                          height: 0.5.w,
                          color: const Color(0xffbbbbab),
                        ),
                        SizedBox(
                          height: 46.w,
                          width: 1.sw * 0.8,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: BaseText(
                                      text: '取消',
                                      fontSize: 16.sp,
                                      color: Color(0xFF666666),
                                    ),
                                  ).withOnTap(onTap: () {
                                    SmartDialog.dismiss();
                                  })),
                              Container(
                                width: 0.5.w,
                                height: 42.w,
                                color: const Color(0xffbbbbab),
                              ),
                              Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: BaseText(
                                      text: '确定',
                                      fontSize: 16.sp,
                                      color: Color(0xFF666666),
                                    ),
                                  ).withOnTap(onTap: () {
                                    if(textEditingController.text != ''){
                                      textEditingController.text.saveLastYear;
                                      lastYear = int.parse(textEditingController.text);
                                      setState(() {});
                                    }
                                    SmartDialog.dismiss();
                                  })),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
              }),

              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      border: Border.all(
                        color: Color(0xffcecece),
                        width: 0.5.w,
                      ),
                    ),
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: BaseText(
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          text: temBeginTime == '' ? '开始时间' : temBeginTime,
                        ).withPadding(
                              left: 10.w,
                            ).withOnTap(onTap: () {
                          AbcPicker.showNewTime(
                              title: '选择开始时间',
                              initialDateTime: temBeginDate,
                              lastYear: 9,
                              showText: true,
                              onDateTimeChanged: (data) {
                                temBeginDate = data;
                              },
                              sureCallBack: () {
                                logic.temIndex = -1;
                                temBeginTime = DateFormat('yyyy-MM-dd').format(temBeginDate);
                                setState(() {});
                              });
                        })),
                        Image(
                          image: 'arr_dow'.png3x,
                          width: 8.w,
                          height: 8.w,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
                  Container(
                    width: 28.w,
                    height: 0.5.w,
                    margin: EdgeInsets.only(left: 6.w, right: 6.w),
                    color: Color(0xffdedede),
                  ),
                  Expanded(
                      child: Container(
                    height: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      border: Border.all(
                        color: Color(0xffcecece),
                        width: 0.5.w,
                      ),
                    ),
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: BaseText(
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          text: temEndTime == '' ? '结束时间' : temEndTime,
                        ).withPadding(
                              left: 10.w,
                            ).withOnTap(onTap: () {
                          AbcPicker.showNewTime(
                              title: '选择结束时间',
                              lastYear: 9,
                              initialDateTime: state.endDate,
                              showText: true,
                              onDateTimeChanged: (data) {
                                temEndDate = data;
                                // state.endTime = DateFormat('yyyy-MM-dd').format(data);
                              },
                              sureCallBack: () {
                                logic.temIndex = -1;
                                temEndTime = DateFormat('yyyy-MM-dd').format(temEndDate);
                                setState(() {});
                              });
                        })),
                        Image(
                          image: 'arr_dow'.png3x,
                          width: 8.w,
                          height: 8.w,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
                ],
              ).withPadding(top: 25.w, left: 12.w, right: 12.w),
              BaseText(
                text: '交易类型',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data1[index], bg: true, type: '1'),
                        border: Border.all(
                            color: selectColor(data1[index], type: '1'),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data1[index],
                      style: TextStyle(
                        color: selectTextColor(data1[index]),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.type = data1[index];
                    setState(() {});
                  });
                },
                itemCount: data1.length,
                crossCount: 3,
                mainHeight: 30.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '金额',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 36.w,
                    padding: EdgeInsets.only(left: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      border: Border.all(
                        color: const Color(0xffCBCBCB),
                        width: 1.w,
                      ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最小金额',
                      controller: state.textController1,
                      textAlign: TextAlign.center,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  ),
                  Container(
                    width: 8.w,
                    height: 1.w,
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 21.w, right: 21.w),
                  ),
                  Container(
                    width: 150.w,
                    height: 36.w,
                    padding: EdgeInsets.only(left: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      border: Border.all(
                        color: const Color(0xffCBCBCB),
                        width: 1.w,
                      ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最大金额',
                      textAlign: TextAlign.center,
                      controller: state.textController2,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  )
                ],
              ).withPadding(top: 15.w),
              BaseText(
                text: '交易摘要',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data2[index], bg: true, type: '2'),
                        border: Border.all(
                            color: selectColor(data2[index], type: '2'),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(20.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data2[index],
                      style: TextStyle(
                        color: selectTextColor(data2[index], type: '2'),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.excerpt = data2[index];
                    setState(() {});
                  });
                },
                itemCount: data2.length,
                crossCount: 3,
                mainHeight: 30.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '交易对方',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              Container(
                width: 345.w,
                height: 36.w,
                margin: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                ),
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  border: Border.all(
                    color: const Color(0xffCBCBCB),
                    width: 1.w,
                  ),
                ),
                child: TextFieldWidget(
                  hintText: '对方名称',
                  controller: state.textController3,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffCBCBCB),
                  ),
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Container(
                width: 345.w,
                height: 36.w,
                margin: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                ),
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  border: Border.all(
                    color: const Color(0xffCBCBCB),
                    width: 1.w,
                  ),
                ),
                child: TextFieldWidget(
                  hintText: '对方账号(试试输入卡号后四位数)',
                  controller: state.textController4,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffCBCBCB),
                  ),
                ),
              ),
            ],
          )),
          Container(
            height: 62.w,
            width: 1.sw,
            margin: EdgeInsets.only(
              top: 10.w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                    ),
                    child: BaseText(
                      text: '重置清空',
                      fontSize: 16.sp,
                    ),
                  ).withOnTap(
                    onTap: () {
                      resetDat();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45.w,
                    alignment: Alignment.center,
                    color: Colors.orangeAccent,
                    child: BaseText(
                      text: '确定',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(
                    onTap: () {
                      logic.tagIndex.value = logic.temIndex;
                      state.endTime = temEndTime;
                      state.endDate = temEndDate;
                      state.beginTime = temBeginTime;
                      state.beginDate = temBeginDate;
                      logic.sureFilter();
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.w + ScreenUtil().bottomBarHeight,
          ),
        ],
      ),
    );
  }
}
