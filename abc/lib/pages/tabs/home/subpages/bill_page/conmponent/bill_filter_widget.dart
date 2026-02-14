import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bill_page_logic.dart';
import '../bill_page_state.dart';

class BillFilterWidget extends StatefulWidget {
  const BillFilterWidget({super.key});

  @override
  State<BillFilterWidget> createState() => _BillFilterWidgetState();
}

class _BillFilterWidgetState extends State<BillFilterWidget> {
  // List<String> data1 = ['全部收入', '其他收入', '他人转入'];
  List<String> data1 = [
    '全部收入',
    '工资福利',
    '他人转入',
    '三方转入',
    '现金存入',
    '其他收入',
  ];

  // List<String> data2 = [
  //   '全部支出',
  //   '三方转出',
  //   '转账给他人',
  //   '购物',
  //   '生活用品',
  //   '交通出行',
  //   '通讯费',
  //   '生活缴费',
  //   '餐饮'
  // ];
  List<String> data2 = [
    '全部支出',
    '转账给他人',
    '三方转出',
    '现金取出',
  ];

  // List<String> data3 = ['全部来往'];
  List<String> data3 = [
    '全部来往',
    '转账给自己',
    '还农行信用卡',
    '理财产品',
    '基金',
  ];

  final BillPageLogic logic = Get.put(BillPageLogic());
  final BillPageState state = Get.find<BillPageLogic>().state;

  Color selectColor(String name, {String type = '1'}) {
    if (selectName(name, type: type)) return const Color(0xff52B596);
    return const Color(0xffF3F7F8);
  }

  Color selectTextColor(String name, {String type = '1'}) {
    if (selectName(name, type: type)) return Colors.white;
    return Color(0xff333333);
  }

  bool selectName(String name, {String type = '1'}) {
    if (type == '1') {
      return state.temIncomeTypeList.contains(name);
    }
    if (type == '2') {
      return state.temExpensesTypeList.contains(name);
    }
    return state.temFinancialTransactionsList.contains(name);
  }

  void selectTag1(String name) {
    if (name == '全部收入') {
      state.temIncomeTypeList.clear();
      state.temIncomeTypeList.add(name);
      setState(() {});
      return;
    }
    state.temIncomeTypeList.remove('全部收入');
    if (state.temIncomeTypeList.contains(name)) {
      state.temIncomeTypeList.remove(name);
    } else {
      state.temIncomeTypeList.add(name);
    }
    setState(() {});
  }

  void selectTag2(String name) {
    if (name == '全部支出') {
      state.temExpensesTypeList.clear();
      state.temExpensesTypeList.add(name);
      setState(() {});
      return;
    }
    state.temExpensesTypeList.remove('全部支出');
    if (state.temExpensesTypeList.contains(name)) {
      state.temExpensesTypeList.remove(name);
    } else {
      state.temExpensesTypeList.add(name);
    }
    setState(() {});
  }

  void selectTag3(String name) {
    if (name == '全部来往') {
      state.temFinancialTransactionsList.clear();
      state.temFinancialTransactionsList.add(name);
      setState(() {});
      return;
    }

    state.temFinancialTransactionsList.remove('全部来往');
    if (state.temFinancialTransactionsList.contains(name)) {
      state.temFinancialTransactionsList.remove(name);
    } else {
      state.temFinancialTransactionsList.add(name);
    }

    // if (state.temFinancialTransactionsList.contains(name)) {
    //   state.temFinancialTransactionsList.remove(name);
    // } else {
    //   state.temFinancialTransactionsList.add(name);
    // }
    setState(() {});
  }

  void resetData() {
    state.temIncomeTypeList.clear();
    state.temExpensesTypeList.clear();
    state.temFinancialTransactionsList.clear();
    state.amountController1.text = '';
    state.amountController2.text = '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    state.temExpensesTypeList.clear();
    state.temExpensesTypeList.addAll(state.expensesTypeList);
    state.temIncomeTypeList.clear();
    state.temIncomeTypeList.addAll(state.incomeTypeList);
    state.temFinancialTransactionsList.clear();
    state.temFinancialTransactionsList.addAll(state.financialTransactionsList);
  }

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
            height: navHeight - 0.5.w,
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
                  SmartDialog.dismiss(tag: 'billFilter');
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
                      color: const Color(0xffF3F7F8),
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      // border: Border.all(
                      //   color: const Color(0xffCBCBCB),
                      //   width: 1.w,
                      // ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最小金额',
                      textAlign: TextAlign.center,
                      controller: state.amountController1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  ),
                  Container(
                    width: 8.w,
                    height: 1.w,
                    color: Color(0xffdedede),
                    margin: EdgeInsets.only(left: 21.w, right: 21.w),
                  ),
                  Container(
                    width: 150.w,
                    height: 36.w,
                    padding: EdgeInsets.only(left: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      color: const Color(0xffF3F7F8),
                      // border: Border.all(
                      //   color: const Color(0xffCBCBCB),
                      //   width: 1.w,
                      // ),
                    ),
                    child: TextFieldWidget(
                      hintText: '最大金额',
                      controller: state.amountController2,
                      textAlign: TextAlign.center,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xffCBCBCB),
                      ),
                    ),
                  )
                ],
              ).withPadding(top: 15.w),
              BaseText(
                text: '分类',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              BaseText(
                text: '收入',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data1[index], type: '1'),
                        borderRadius: BorderRadius.all(Radius.circular(20.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data1[index],
                      style: TextStyle(
                          fontWeight: selectName(data1[index], type: '1')
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: selectTextColor(data1[index], type: '1'),
                          fontSize: 13.sp,
                          height: 1),
                    ),
                  ).withOnTap(onTap: () {
                    selectTag1(data1[index]);
                  });
                },
                itemCount: data1.length,
                crossCount: 3,
                mainHeight: 28.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '支出',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data2[index], type: '2'),
                        borderRadius: BorderRadius.all(Radius.circular(20.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data2[index],
                      style: TextStyle(
                        fontWeight: selectName(data2[index], type: '2')
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectTextColor(data2[index], type: '2'),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    selectTag2(data2[index]);
                  });
                },
                itemCount: data2.length,
                crossCount: 3,
                mainHeight: 30.w,
                spacing: 15.w,
              ),
              BaseText(
                text: '本人资金来往',
                fontSize: 16.sp,
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(data3[index], type: '3'),
                        borderRadius: BorderRadius.all(Radius.circular(20.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: data3[index],
                      style: TextStyle(
                        fontWeight: selectName(data3[index], type: '3')
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: selectTextColor(data3[index], type: '3'),
                        fontSize: 13.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    selectTag3(data3[index]);
                  });
                },
                itemCount: data3.length,
                crossCount: 3,
                mainHeight: 30.w,
                spacing: 15.w,
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
                        color: Color(0xff666666),
                        width: 0.5.w,
                      ),
                    ),
                    child: BaseText(
                      text: '重置',
                      fontSize: 16.sp,
                      color: Color(0xffF3AD3C),
                    ),
                  ).withOnTap(
                    onTap: () {
                      resetData();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45.w,
                    alignment: Alignment.center,
                    color: Color(0xffF3AD3C),
                    child: BaseText(
                      text: '确定',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(
                    onTap: () {
                      logic.sureFilter();
                      SmartDialog.dismiss(tag: 'billFilter');
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
