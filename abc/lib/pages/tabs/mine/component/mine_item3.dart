import 'package:abc/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../main_order/main_order_view.dart';

class MineItem3 extends StatefulWidget {
  const MineItem3({super.key});

  @override
  State<MineItem3> createState() => _MineItem3State();
}

class _MineItem3State extends State<MineItem3> {


  List titleName = [
    '全部',
    '待发货',
    '待收货',
    '已完成',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 160.w,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: 'bg_mine_item_3'.png3x,
                fit: BoxFit.fitWidth,)
          ),
          child: VerticalGridView(
            spacing: 5.w,
            mainHeight: 64.w,
            padding: EdgeInsets.only(left: 25.w, right: 25.w,bottom: 30.w),
            widgetBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 30.w,
                    height: 30.w,
                    child: Image(image: 'mine_item_3_$index'.png3x),
                  ),
                  SizedBox(height: 8.w,),
                  BaseText(
                      text: titleName[index],
                      fontSize: 14.sp,
                      color: Color(0xff333333),
              style: TextStyle(
              fontSize: 13.sp,
              color: Color(0xff333333),
              fontFamily: "PingFang",
              fontWeight: FontWeight.w500),
                  ),
                ],
              ).withOnTap(onTap: (){
                List titleNames = [
                  '全部订单',
                  '待发货订单',
                  '待收货订单',
                  '已完成订单',
                  '已取消订单'
                ];
                print(titleNames[index]);
                Get.to(() => Main_orderPage(),arguments: {
                  'index':index,
                  'titleName':titleNames[index]
                });
              });
            },
            itemCount: titleName.length,
          ),
        ),
        Positioned(
            top: 10.h,
            left: 20.w,
            child: Container(
              width: screenWidth - 40.w,
              height: 50.w,

        ).withOnTap(onTap: () {
              Get.to(() => Main_orderPage(),arguments: {
                'index':0,
                'titleName':"我的订单"
              });
            }))
      ],
    );
  }
}
