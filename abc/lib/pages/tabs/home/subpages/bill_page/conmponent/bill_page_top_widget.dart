import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/filter_item_time_widget.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/filter_item_widget.dart';
import 'package:abc/pages/tabs/other/sheet_widget/sheet_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bill_page_logic.dart';
import '../bill_page_state.dart';

class BillPageTopWidget extends StatefulWidget {
  const BillPageTopWidget({super.key});

  @override
  State<BillPageTopWidget> createState() => _BillPageTopWidgetState();
}

class _BillPageTopWidgetState extends State<BillPageTopWidget> {
  final BillPageLogic logic = Get.put(BillPageLogic());
  final BillPageState state = Get.find<BillPageLogic>().state;

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
        builder: (BillPageLogic c) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _tagWidget(state.isDay
                          ? state.queryTime
                          : '${state.beginTime.replaceAll('-', '.')}-${state.endTime.replaceAll('-', '.')}')
                      .withOnTap(onTap: () {
                    SheetBottom.show(
                        showTopText: true,
                        title: '',
                        child: FilterItemTimeWidget(),
                        sureCallBack: () {
                          logic.sureTime();
                        });
                  }),
                  SizedBox(
                    width: 8.w,
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
              ),
              _tagWidget('筛选').withOnTap(onTap: () {
                logic.openPermanentDialog();
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
