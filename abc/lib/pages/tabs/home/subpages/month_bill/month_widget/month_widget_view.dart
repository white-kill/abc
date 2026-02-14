import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/bill_analysis/bill_analysis_view.dart';
import 'package:abc/pages/tabs/home/subpages/month_bill/month_widget/IncomeExpenseSwitch.dart';
import 'package:abc/pages/tabs/mine/xiaodou/xiaodou_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../../utils/widget_util.dart';
import '../../../../other/customer/customer_view.dart';
import 'month_widget_logic.dart';
import 'month_widget_state.dart';

class Month_widgetPage extends BaseStateless {
  Month_widgetPage({Key? key}) : super(key: key);

  final Month_widgetLogic logic = Get.put(Month_widgetLogic());
  final Month_widgetState state = Get.find<Month_widgetLogic>().state;

  @override
  Widget? get titleWidget => Text(
        '月度账单',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      );


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_home_customer'.png3x,
      width: 22.w,
      height: 22.w,
      color: Colors.black,
    ).withPadding(
      left: 0.w,
      right: 15.w,
    ).withOnTap(onTap: (){
      Get.to(() => CustomerPage());
    }),
  ];


  @override
  Widget initBody(BuildContext context) {

    return GetBuilder(builder: (Month_widgetLogic c){
      return Container(
          color: Color(0xFFB2DEAB),
          child: ListView(
            children: [
              Stack(
                children: [
                  Image(image: 'month_bill_bg'.png3x, fit: BoxFit.fitWidth),
                  Column(
                    children: [
                      SizedBox(height: 46.w),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 26.w),
                          Text(
                            '${DateTime(DateTime.now().year, DateTime.now().month - 1).month}',
                            style: TextStyle(
                              color: Color(0xff563829),
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '月账单',
                            style: TextStyle(
                              color: Color(0xff563829),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w100,
                            ),
                          ).withPadding(
                              bottom: 4.w
                          ),
                        ],
                      ),
                      SizedBox(height: 25.w),
                      Container(
                        width: 350.w,
                        height: 435.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 18.w),
                            Row(
                              children: [
                                SizedBox(width: 13.w),
                                Text(
                                  '资产概览',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Image(
                                  image: 'icon_tips'.png3x,
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 35.w),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                    logic.dataModel.custom?.capitalAmount?.amount??'',
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '月末总资产(元)',
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1.w,
                                  height: 28.h,
                                  color: Color(0xffE6E6E6),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Obx(() => Text(
                                        logic.switchValue.value?logic.dataModel.custom?.capitalAmount?.amountDiff??'':'--',
                                        style: TextStyle(
                                          color: Color(0xffD4514C),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                      Text(
                                        '较上月(元)',
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 26.w),
                            Row(
                              children: [
                                SizedBox(width: 14.w),
                                Text(
                                  '月末资产明细',
                                  style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '对比上月',
                                  style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: Obx(() => CupertinoSwitch(
                                    value: logic.switchValue.value,
                                    onChanged: (bool value) {
                                      logic.switchValue.value = value;
                                    },
                                    activeColor: Color(0xff51B297),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Obx(() => Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 11.w),
                                  child: Container(
                                      width: 158.w,
                                      height: 73.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDFBF8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: logic.switchValue.value?15.w:20.w,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 13.w),
                                              Image(
                                                image: 'item_icon_clock'.png3x,
                                                width: 15.w,
                                                height: 15.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '活期',
                                                style: TextStyle(
                                                    color: Color(0xff333333),height: 1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.currentAmount?.amount??'',
                                              style: TextStyle(
                                                  color: Color(0xff666666),height: 1),
                                            ),
                                          ),

                                          logic.switchValue.value == false?SizedBox.shrink():SizedBox(
                                            height: 4.w,
                                          ),
                                          logic.switchValue.value == false?SizedBox.shrink(): Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.currentAmount?.amountDiff??'',
                                              style: TextStyle(
                                                  color: logic.isFuck(logic.dataModel.custom?.currentAmount?.amountDiff??'')?Color(0xff666666):Color(0xffD4514C),height: 1),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 11.w),
                                  child: Container(
                                      width: 158.w,
                                      height: 73.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDFBF8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: logic.switchValue.value?15.w:20.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 13.w),
                                              Image(
                                                image: 'item_icon_clock'.png3x,
                                                width: 15.w,
                                                height: 15.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '存款',
                                                style: TextStyle(
                                                    color: Color(0xff333333),height: 1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.depositAmount?.amount??'',
                                              style: TextStyle(
                                                  color: Color(0xff666666),height: 1),
                                            ),
                                          ),

                                          logic.switchValue.value == false?SizedBox.shrink(): SizedBox(
                                            height: 4.w,
                                          ),
                                          logic.switchValue.value == false?SizedBox.shrink(): Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.depositAmount?.amountDiff??'',
                                              style: TextStyle(
                                                  color: logic.isFuck(logic.dataModel.custom?.currentAmount?.amountDiff??'')?Color(0xff666666):Color(0xffD4514C),height: 1),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 10.w,
                            ),
                            Obx(() => Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 11.w),
                                  child: Container(
                                      width: 158.w,
                                      height: 73.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDFBF8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: logic.switchValue.value?15.w:20.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 13.w),
                                              Image(
                                                image: 'item_icon_clock'.png3x,
                                                width: 15.w,
                                                height: 15.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '理财',
                                                style: TextStyle(
                                                    color: Color(0xff333333),height: 1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.managementAmount?.amount??'',
                                              style: TextStyle(
                                                  color: Color(0xff666666),height: 1),
                                            ),
                                          ),

                                          logic.switchValue.value == false?SizedBox.shrink():SizedBox(
                                            height: 4.w,
                                          ),
                                          logic.switchValue.value == false?SizedBox.shrink():Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.managementAmount?.amountDiff??'',
                                              style: TextStyle(
                                                  color:logic.isFuck(logic.dataModel.custom?.managementAmount?.amountDiff??'')?Color(0xff666666):Color(0xffD4514C),height: 1),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 11.w),
                                  child: Container(
                                      width: 158.w,
                                      height: 73.w,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFDFBF8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: logic.switchValue.value?15.w:20.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 13.w),
                                              Image(
                                                image: 'item_icon_clock'.png3x,
                                                width: 15.w,
                                                height: 15.w,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '基金',
                                                style: TextStyle(
                                                    color: Color(0xff333333),height: 1),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.fundAmount?.amount??'',
                                              style: TextStyle(
                                                  color: Color(0xff666666),height: 1),
                                            ),
                                          ),

                                          logic.switchValue.value == false?SizedBox.shrink():SizedBox(
                                            height: 4.w,
                                          ),
                                          logic.switchValue.value == false?SizedBox.shrink():Padding(
                                            padding: EdgeInsets.only(left: 36.w),
                                            child: Text(
                                              logic.dataModel.custom?.fundAmount?.amountDiff??'',
                                              style: TextStyle(
                                                  color: logic.isFuck(logic.dataModel.custom?.fundAmount?.amountDiff??'')?Color(0xff666666):Color(0xffD4514C),height: 1),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            )),
                            Image(image: "item_bottom_banner".png3x)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Container(
                        width: 350.w,
                        height: 390.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.w,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 13.w),
                                Text(
                                  '收支分析',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Image(
                                  image: 'icon_tips'.png3x,
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 19.w),
                            IncomeExpenseSwitch(),
                            SizedBox(height: 20.w),
                            GetBuilder(builder: (Month_widgetLogic c){
                              return Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          c.totalAmount,
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '本月支出(元)',
                                          style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: 14.sp,
                                            // fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1.w,
                                    height: 28.h,
                                    color: Color(0xffE6E6E6),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          c.totalAmountDiff,
                                          style: TextStyle(
                                            color: Color(0xff5AA456),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '较上月(元)',
                                          style: TextStyle(
                                            color: Color(0xff666666),
                                            fontSize: 14.sp,
                                            // fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },id: 'updateChat',),
                            Row(children: [
                              GetBuilder(builder: (Month_widgetLogic c){
                                return Container(
                                    width: 350.w,
                                    height: 200.w,
                                    child: SfCircularChart(series: <CircularSeries>[
                                      DoughnutSeries<SalesData, String>(
                                        dataSource: state.data1,
                                        xValueMapper: (SalesData data, _) =>
                                        data.year,
                                        yValueMapper: (SalesData data, _) =>
                                        data.sales,
                                        pointColorMapper: (SalesData data, _) =>
                                        data.color,
                                        animationDuration: 500,
                                        dataLabelMapper:
                                            (SalesData data, int index) {
                                          return '${data.year}\n${data.sales}';
                                        },
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          labelPosition:
                                          ChartDataLabelPosition.outside,
                                          // 标签显示在外侧
                                          textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Color(0xff333333),
                                          ),
                                          useSeriesColor: false,
                                          // 不使用系列颜色
                                          overflowMode: OverflowMode.shift,
                                          // 溢出时自动调整位置
                                          connectorLineSettings:
                                          const ConnectorLineSettings(
                                            type: ConnectorType.line,
                                            width: 1,
                                            color: Color(0xff459B7F),
                                          ),
                                        ),
                                        radius: '60%',
                                        innerRadius: '60%',
                                      )
                                    ]));
                              },id: 'updateChat',)
                            ]),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  '更多分析',
                                  style: TextStyle(
                                    color: Color(0xffF3AF3F),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Image(
                                  color: Color(0xffF3AF3F),
                                  image: 'item_banner_arrow'.png3x,
                                  width: 14.w,
                                  height: 14.w,
                                ),
                                Spacer()
                              ],
                            ).withOnTap(onTap: () {
                              Get.to(() => BillAnalysisPage(),arguments: {
                                'm':'${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}'
                              });
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Container(
                        width: 350.w,
                        height: 277.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(children: [
                          SizedBox(height: 18.w),
                          Row(
                            children: [
                              SizedBox(width: 13.w),
                              Text(
                                '信用卡消费',
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Image(
                                image: 'icon_tips'.png3x,
                                width: 14.w,
                                height: 14.w,
                              ),
                            ],
                          ),
                          SizedBox(height: 36.w),
                          Text(
                            '未持有卡',
                            style: TextStyle(
                                fontSize: 18.sp, color: Color(0xff666666)),
                          ),
                          SizedBox(
                            height: 16.5.w,
                          ),
                          Container(
                            width: 80.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              color: Color(0xffF3AD3C),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                '前往办卡',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          ).withOnTap(onTap: () {
                            Get.toNamed(Routes.changeNavi, arguments: {
                              'title': '信用卡',
                              'image': 'xyk',
                              'offset':false,
                              'defTitleColor': Colors.black,
                            });
                          }),
                          SizedBox(
                            height: 16.5.w,
                          ),
                          Image(
                            image: 'item_banner_food'.png3x,
                            width: 326.w,
                            height: 99.w,
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Container(
                          width: 350.w,
                          height: 256.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 18.w),
                              Row(
                                children: [
                                  SizedBox(width: 13.w),
                                  Text(
                                    '我的小豆',
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Image(
                                    image: 'icon_tips'.png3x,
                                    width: 14.w,
                                    height: 14.w,
                                  ),
                                ],
                              ),
                              SizedBox(height: 34.w),
                              Row(
                                children: [
                                  SizedBox(width: 13.w),
                                  Text(
                                    '月末小豆总数',
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    // logic.dataModel.peas,
                                      AppConfig.config.abcLogic.memberInfo.peas.toString(),
                                    style: TextStyle(
                                      color: Color(0xffF3AD3C),
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '个',
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '我的小豆',
                                    style: TextStyle(
                                      color: Color(0xff666666),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image(
                                    image: 'item_banner_arrow'.png3x,
                                    color: Color(0xff666666),
                                    width: 20.w,
                                    height: 20.w,
                                  ).withPadding(
                                      right: 12.w
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 13.w),
                                  Text(
                                    '本月领取小豆0个，快去赢取小豆吧~',
                                    style: TextStyle(
                                      color: Color(0xff666666),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.w,
                              ),
                              Image(
                                image: 'item_banner_bean'.png3x,
                                width: 326.w,
                                height: 99.w,
                              ),
                            ],
                          )).withOnTap(onTap: () {
                        Get.to(() => XiaodouPage());
                      }),
                      SizedBox(
                        height: 20.w,
                      ),
                      Container(
                          width: 350.w,
                          height: 192.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 13.w,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 13.w),
                                Text(
                                  '重要时刻',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Image(
                                  image: 'icon_tips'.png3x,
                                  width: 14.w,
                                  height: 14.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 28.w,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 13.w),
                                    Text(
                                      '本月共登录掌上银行',
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      logic.dataModel.loginCount,
                                      style: TextStyle(
                                        color: Color(0xffF3AD3C),
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '次',
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18.w,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 13.w),
                                    Text(
                                      DateUtil.formatDate(DateTime.now(), format:DateFormats.zh_mo_d),
                                      style: TextStyle(
                                        color: Color(0xffF3AD3C),
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '是你访问掌上银行次数最多的一天',
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 13.w,
                                ),
                                Text(
                                  '财富积累我们砥砺前行',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ])),
                      SizedBox(
                        height: 20.w,
                      ),
                      Image(
                        image: 'item_share_btn'.png3x,
                        width: 270.w,
                        height: 43.w,
                      ).withOnTap(onTap: (){
                        showModalBottomSheet(
                          context:context?? Get.context!,
                          builder: (context) {
                            return Container(
                              width: 1.sw,
                              height: 170.w,
                              decoration: decorationImage('yd_bottom',fit: BoxFit.cover),
                              child: Column(
                                children: [

                                  Expanded(child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(child: Container().withOnTap(onTap: (){
                                          Get.back();
                                        })),
                                      ],
                                    ),
                                  )),
                                  Container(height: 60.w,).withOnTap(onTap: (){
                                    Get.back();
                                  })
                                ],
                              ),
                            );
                          },
                        );
                      }),
                      SizedBox(
                        height: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ));
    },id: 'UpdateUI',);

  }
}

class SalesData {
  SalesData(this.year, this.sales, this.color);

  final String year;
  final double sales;
  final Color color;
}
