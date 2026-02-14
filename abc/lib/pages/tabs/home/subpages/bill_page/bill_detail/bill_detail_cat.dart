import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'bill_detail_logic.dart';
import 'bill_detail_state.dart';

class BillDetailCat extends StatefulWidget {
  const BillDetailCat({super.key});

  @override
  State<BillDetailCat> createState() => _BillDetailCatState();
}

class _BillDetailCatState extends State<BillDetailCat> {


  List titleName1 = [
    '日常支出',
    '生活缴费',
    '交通出行',
    '生活用品',
    '发红包',
    '转账给他人',
    '现金取出',
    '通讯录',
    '房租房贷',
    '信用卡还款',
    '还款',
    '社保养老',
    '餐饮',
    '零食烟酒',
    '服饰鞋包',
    '休闲娱乐',
    '美容健身',
    '亲子育儿',
    '宠物',
    '手续费',
    '医疗',
    '教育',
    '三方转出',
    '酒店',
    '购物',
    '其他支出',
    '公益'
  ];


  List titleName2 = [
    '工资福利',
    '他人转入',
    '现金存入',
    '收红包',
    '奖金',
    '分红',
    '借款',
    '退款',
    '营业收入',
    '医疗保健',
    '贷款介入',
    '收房租',
    '社保公积金',
    '三方转入',
    '其他收入',
    '投资收益'

  ];

  List titleName3 = [
    '转给自己',
    '存款',
    '理财产品',
    '基金',
    '贵金属',
    '股票',
    '外汇',
    '债券',
    '还农行信用卡',
    '投资性保健',
    '私行代销',
    '其他投资',
    '其他',

  ];
  final BillDetailLogic logic = Get.put(BillDetailLogic());
  final BillDetailState state = Get.find<BillDetailLogic>().state;


  String selectName = '';

  @override
  void initState() {
    super.initState();
    selectName = logic.categoryText.value;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 1.sh * 0.65,
      width: 1.sw,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [

          BaseText(text: "支出",fontSize: 16.sp,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: "PingFang",
                  fontWeight: FontWeight.w600
              )
          ).withPadding(
            top: 12.w,left: 12.w,bottom: 15.w,
          ),
          VerticalGridView(
            padding: EdgeInsets.only(left: 12.w,right: 12.w),
            spacing: 20.w,
            widgetBuilder: (context,index){
            return Column(
              children: [
                //c_0@3x
                Image(image:selectName == titleName1[index]? 'c_${index}_s'.png3x:'c_$index'.png3x,width: 22.w,height: 22.w,),
                SizedBox(height: 12.w,),
                BaseText(text: titleName1[index],fontSize: 14.sp, style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "PingFang",
                  fontWeight: FontWeight.w600
                ),),

              ],
            ).withOnTap(onTap: (){
              logic.temCategoryText= titleName1[index];
              selectName = titleName1[index];
              setState(() {});
            });
          }, itemCount: titleName1.length,mainHeight: 55,),


          BaseText(text: "收入",fontSize: 15.sp,
              style: TextStyle(
                  fontSize: 17.sp,
              fontFamily: "PingFang",
              fontWeight: FontWeight.w600
          )
          ).withPadding(
            top: 30.w,left: 12.w,bottom: 15.w,
          ),
          VerticalGridView(
            padding: EdgeInsets.only(left: 12.w,right: 12.w),
            spacing: 20.w,
            widgetBuilder: (context,index){
              return Column(
                children: [
                  //c_0@3x
                  Image(image:  titleName2[index] == selectName? 'c1_${index}_s'.png3x:'c1_$index'.png3x,width: 22.w,height: 22.w,),
                  SizedBox(height: 12.w,),
                  BaseText(text: titleName2[index],fontSize: 14.sp, style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "PingFang",
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ).withOnTap(onTap: (){
                logic.temCategoryText = titleName2[index];
                selectName = titleName2[index];
                setState(() {});
              });
            }, itemCount: titleName2.length,mainHeight: 55,),



          BaseText(text: "本人资金来往",fontSize: 16.sp,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: "PingFang",
                  fontWeight: FontWeight.w600
              )
          ).withPadding(
            top: 30.w,left: 12.w,bottom: 15.w,
          ),
          VerticalGridView(
            padding: EdgeInsets.only(left: 12.w,right: 12.w),
            spacing: 20.w,
            widgetBuilder: (context,index){
              return Column(
                children: [
                  //c_0@3x
                  Image(image: titleName3[index] == selectName? 'c2_${index}_s'.png3x:'c2_$index'.png3x,width: 22.w,height: 22.w,),
                  SizedBox(height: 12.w,),
                  BaseText(text: titleName3[index],fontSize: 14.sp, style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "PingFang",
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ).withOnTap(onTap: (){
                selectName = titleName3[index];
                logic.temCategoryText= titleName3[index];
                setState(() {});
              });
            }, itemCount: titleName3.length,mainHeight: 55,),

        ],
      ),
    );
  }
}
