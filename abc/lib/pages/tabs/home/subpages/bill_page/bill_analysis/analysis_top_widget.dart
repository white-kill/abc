import 'package:abc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/sheet_widget/picker_widget.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import '../conmponent/filter_item_widget.dart';
import 'bill_analysis_logic.dart';
import 'bill_analysis_state.dart';

class AnalysisTopWidget extends StatefulWidget {
  const AnalysisTopWidget({super.key});

  @override
  State<AnalysisTopWidget> createState() => _AnalysisTopWidgetState();
}

class _AnalysisTopWidgetState extends State<AnalysisTopWidget> {



  final BillAnalysisLogic logic = Get.put(BillAnalysisLogic());
  final BillAnalysisState state = Get.find<BillAnalysisLogic>().state;

  int topTjIndex = 0;

  List dataList = [
    {'image': 'ic_qbzh', 'title': '全部账户'},
    {'image': 'bh_sg', 'title': '不含手工记账'},
    {
      'image': 'a_jjk',
      'title': '借记卡(${AppConfig.config.abcLogic.cardFour()})'
    },
    {'image': 'sg', 'title': '手工记账'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      child: GetBuilder(
        builder: (BillAnalysisLogic c) {
          return Row(
            children: [
              _tagWidget(c.state.time).withOnTap(onTap: () {
                SheetBottom.show(
                    showTopText: true,
                    title: '',
                    child:Container(
                      height: 200.w,
                      alignment: Alignment.center,
                      child: DateTimePicker(
                        dateTimePickerNotifier: c.state.pickerNotifier,
                        lastYear: 9,
                        showDay:false,
                        onDateTimeChanged:(DateTime date){
                         c.state.temTime = DateFormat("yyyy-MM").format(date);
                        },
                      ),
                    ),
                    sureCallBack: () {
                      c.state.time = c.state.temTime;
                      c.incomeAnalysisRank();
                      logic.update(['upDateTopWidget']);
                    });
              }),
              SizedBox(
                width: 24.w,
              ),
              _tagWidget(dataList[topTjIndex]['title']).withOnTap(
                  onTap: () {
                    SheetBottom.show(
                        title: '选择账户',
                        child: FilterItemWidget(
                          selectIndex: topTjIndex,
                          callBackIndex: (index) {
                            topTjIndex = index;
                            logic.update(['upDateTopWidget']);
                          },
                        ));
                  }),
            ],
          );
        },
        id: 'upDateTopWidget',
      ),
    );
  }

  Widget _tagWidget(String content) {
    return Row(
      children: [
        BaseText(
          text: content,
          color: Color(0xff333333),
          fontSize: 14.sp,
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
}

