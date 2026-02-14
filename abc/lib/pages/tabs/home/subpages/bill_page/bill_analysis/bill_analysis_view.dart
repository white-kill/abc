import 'package:abc/config/model/analysis_rank_model.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/bill_analysis/analysis_top_widget.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/bill_analysis/category_detail/category_detail_view.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'bill_analysis_logic.dart';
import 'bill_analysis_state.dart';

class BillAnalysisPage extends BaseStateless {
  BillAnalysisPage({Key? key}) : super(key: key, title: '收支分析');

  final BillAnalysisLogic logic = Get.put(BillAnalysisLogic());
  final BillAnalysisState state = Get.find<BillAnalysisLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        AnalysisTopWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder(builder: (BillAnalysisLogic c){
              return BaseText(
                text: '¥${logic.totalAmount.bankBalance}',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
              );
            },id: 'updateList',),
            _changeWidget(),
          ],
        ).withContainer(
            padding: EdgeInsets.only(left: 15.w, right: 15.w), height: 60.w),
        GetBuilder(
          builder: (BillAnalysisLogic c) {
            return Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                GetBuilder(
                  builder: (BillAnalysisLogic c) {
                    return Container(
                      height: 240.w,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: SfCartesianChart(
                        borderWidth: 0,
                        plotAreaBorderWidth: 0,
                        // primaryXAxis: CategoryAxis(isVisible: false,),  // 隐藏X轴
                        primaryYAxis: NumericAxis(isVisible: false),
                        // 隐藏Y轴
                        primaryXAxis: CategoryAxis(
                          interval: 1,
                          axisLabelFormatter: (AxisLabelRenderDetails details) {
                            return ChartAxisLabel(
                                details.text,
                                TextStyle(
                                  fontSize: 10.sp,
                                ));
                          },
                          majorGridLines: const MajorGridLines(width: 0),
                          majorTickLines: const MajorTickLines(width: 0),
                        ),
                        series: <CartesianSeries>[
                          ColumnSeries<ChartData, String>(
                            dataSource: state.chartData1,
                            xValueMapper: (ChartData data, _) => (data.x.contains('.')?'${data.x.split('.').last}月':data.x),
                            yValueMapper: (ChartData data, _) => data.y,
                            // color: Colors.blue,
                            width: 0.7,
                            dataLabelMapper: (ChartData data, int index) {
                              // return '¥${data.y.bankBalance}';
                              // print(index);
                              return index == logic.selectedIndex
                                  ? '¥${data.y.bankBalance}'
                                  : '';
                            },
                            pointColorMapper: (ChartData data, int index) {
                              return index == logic.selectedIndex
                                  ? logic.chatColor
                                  :  logic.chatColor.withOpacity(0.3);
                            },
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              labelIntersectAction: LabelIntersectAction.none,
                              textStyle: TextStyle(
                                  color:  logic.chatColor,
                                  fontSize: 13.sp),
                              labelPosition: ChartDataLabelPosition.outside,
                              // angle: -45,
                            ),
                            onPointTap: (ChartPointDetails details) {
                              // 点击数据标签时更新选中索引
                              logic.selectedIndex = details.pointIndex!;
                              logic.update(['updateChat']);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  id: 'updateChat',
                ),
                Container(
                  padding: EdgeInsets.only(left: 12.w, top: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: 'as_fl'.png3x,
                            width: 24.w,
                            height: 24.w,
                          ),
                          BaseText(
                            text: '分类',
                            fontSize: 18.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BaseText(text: '对比上月'),
                          Obx(() => CupertinoSwitch(
                                value: logic.switchValue.value,
                                onChanged: (bool value) {
                                  logic.switchValue.value = value;
                                },
                                activeColor: Color(0xff51B297),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    AnalysisRankCategoryList categoryModel = logic.analysisRankModel.categoryList[index];
                    return Container(
                      height: 55.w,
                      margin: EdgeInsets.only(top: 10.w),
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              netImage(
                                url: categoryModel.icon,
                                width: 20.w,
                                height: 20.w,
                              ).withPadding(right: 6.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(text: '${categoryModel.name}(${categoryModel.rate}%,${categoryModel.count}笔)'),
                                  SizedBox(
                                    height: 8.w,
                                  ),

                                  Stack(
                                    children: [
                                      Container(
                                        width: 180.w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xffdedede),
                                            borderRadius: BorderRadius.all(Radius.circular(2.w))
                                        ),
                                      ),
                                      Container(
                                        width: (180 * (categoryModel.rate/100)).w,
                                        height: 3.w,
                                        decoration: BoxDecoration(
                                            color:Colors.orangeAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(2.w))
                                        ),
                                      ),
                                    ],
                                  )
                                  // BaseText(text: 'rankModel.transactionTime'),

                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BaseText(
                                    text: '¥${categoryModel.totalAmount.bankBalance}',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Obx(() => logic.switchValue.value?SizedBox(
                                    height: 8.w,
                                  ):SizedBox.shrink()),
                                  Obx(
                                    () => logic.switchValue.value
                                        ? BaseText(
                                            text: categoryModel.diffAmount ==0?'--':'↑ ${categoryModel.diffAmount.bankBalance}',
                                            fontSize: 12.sp,
                                            color: Colors.red,
                                          )
                                        : SizedBox.shrink(),
                                  )
                                ],
                              ),
                              Image(
                                image: 'ic_jt_right'.png3x,
                                width: 20.w,
                                height: 20.w,
                              )
                            ],
                          )
                        ],
                      ),
                    ).withOnTap(onTap: (){
                      Get.to(() => Category_detailPage(),arguments: {
                        'model':categoryModel,
                        'time':state.time,
                        'fuH':logic.isZc.value?'-':'+'
                      });
                    });
                  },
                  itemCount: logic.listCount(),
                ),
                logic.analysisRankModel.categoryList.length<5?SizedBox.shrink():SizedBox(
                  width: 1.sw,
                  height: 35.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: '查看更多'),
                      Image(image:
                      logic.showMore?'ic_jt_top'.png3x:'ic_jt_bottom'.png3x,width: 20.w,height: 20.w,)
                    ],
                  ),
                ).withOnTap(onTap: (){
                  logic.showMore = !logic.showMore;
                  logic.update(['updateList']);
                }),
                Container(
                  padding: EdgeInsets.only(left: 12.w, top: 20.w),
                  child: Row(

                    children: [
                      Image(
                        image: 'as_phb'.png3x,
                        width: 24.w,
                        height: 24.w,
                      ),
                      BaseText(
                        text: '排行榜',
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    AnalysisRankRankList rankModel = logic.analysisRankModel.rankList[index];
                    return Container(
                      margin: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 1), // 轻微阴影（区分模块与背景）
                          ),
                        ],
                      ),
                      height: 70.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BaseText(
                                text: '${index + 1}',
                                style: TextStyle(
                                    fontSize: 28.w,
                                    color: Colors.orangeAccent.withOpacity(1 -
                                        (index < 6 ? (index / 10) : 7 / 10))),
                              ).withPadding(left: 12.w, right: 12.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(
                                    text: rankModel.excerpt,
                                    fontSize: 16.sp,
                                    color: Color(0xff555555),
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(
                                    text: rankModel.transactionTime,
                                    fontSize: 13.sp,
                                    color: Color(0xff555555),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BaseText(
                                text: '${logic.isZc.value?'-':"+"}¥${rankModel.amount.bankBalance}',
                                fontSize: 16.sp,
                              ),
                              SizedBox(
                                height: 6.w,
                              ),
                              BaseText(
                                text: rankModel.bankCard,
                                fontSize: 13.sp,
                                color: Color(0xff555555),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: logic.analysisRankModel.rankList.length,
                ),

                SizedBox(height: ScreenUtil().bottomBarHeight,)
              ],
            ).withContainer(color: Colors.white));
          },
          id: 'updateList',
        )
      ],
    );
  }

  Widget _changeWidget() {
    return Obx(() => Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 75.w,
              height: 27.w,
              decoration: BoxDecoration(
                  color: logic.isZc.value ? Color(0xffF8A82F) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.w),
                    bottomLeft: Radius.circular(15.w),
                  ),
                  border: logic.isZc.value
                      ? null
                      : Border.all(color: Color(0xffC7C7C7), width: 1.w)),
              child: BaseText(
                text: '支出',
                color: logic.isZc.value ? Colors.white : Color(0xffC4C4C4),
              ),
            ).withOnTap(onTap: () {
              logic.isZc.value = true;
              logic.chatColor = Color(0xff03B696);
              logic.incomeAnalysis();
              logic.incomeAnalysisRank();
            }),
            Container(
              alignment: Alignment.center,
              width: 75.w,
              height: 27.w,
              decoration: BoxDecoration(
                  color: logic.isZc.value ? Colors.white : Color(0xffF8A82F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.w),
                    bottomRight: Radius.circular(15.w),
                  ),
                  border: logic.isZc.value
                      ? Border.all(color: Color(0xffC7C7C7), width: 1.w)
                      : null),
              child: BaseText(
                text: '收入',
                color: !logic.isZc.value ? Colors.white : Color(0xffC4C4C4),
              ),
            ).withOnTap(onTap: () {
              logic.isZc.value = false;
              logic.chatColor = Colors.orangeAccent;
              logic.incomeAnalysis();
              logic.incomeAnalysisRank();
            }),
          ],
        ));
  }
}
