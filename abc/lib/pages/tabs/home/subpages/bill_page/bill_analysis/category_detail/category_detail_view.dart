import 'package:abc/config/abc_config/balance_eye_widget.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/model/categiry_query_model.dart';
import '../../bill_detail/bill_detail_view.dart';
import 'category_detail_logic.dart';
import 'category_detail_state.dart';

class Category_detailPage extends BaseStateless {
  Category_detailPage({Key? key}) : super(key: key, title: '类别明细');

  final Category_detailLogic logic = Get.put(Category_detailLogic());
  final Category_detailState state = Get.find<Category_detailLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (Category_detailLogic c) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150.w,
              width: 1.sw,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      netImage(url: logic.categoryModel.icon,width: 30.w,height: 30.w),
                      SizedBox(width: 6.w,),
                      BaseText(text: logic.categoryModel.name),
                    ],
                  ),
                  SizedBox(height: 2.w,),
                  BaseText(text: '${Get.arguments?['fuH']??''}${logic.categoryModel.totalAmount.bankBalance}',style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 2.w,),
                  BaseText(text: '${logic.convertToChineseYearMonth()}  共${logic.categoryModel.count}笔'),
                 SizedBox(height: 25.w,),
                  Container(
                    width: 1.sw,
                    height: 1.w,
                    margin: EdgeInsets.only(left: 15.w),
                    color: Color(0xffE9E9E9),
                  )
                ],
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight+10.w),
              itemBuilder: (context, index) {
                CategiryQueryModel rankModel = logic.list[index];
                return Container(
                  margin: EdgeInsets.only(top: 6.w, left: 6.w, right: 6.w,bottom: 6.w),
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 65.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  netImage(
                                      url: rankModel.icon,
                                      width: 26.w,
                                      height: 26.w)
                                      .withPadding(left: 8.w, right: 8.w),
                                  BaseText(
                                    text: rankModel.excerpt,
                                    fontSize: 16.sp,
                                    // color: Color(0xff555555),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6.w,
                              ),
                              BaseText(
                                text: rankModel.transactionTime,
                                fontSize: 13.sp,
                                color: Color(0xff555555),
                              ).withPadding(left: 40.w),
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
                                text:
                                '${Get.arguments?['fuH']??''}¥${rankModel.amount.bankBalance.replaceAll('-', '')}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500
                                ),
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
                          ),

                          Image(image: 'ic_jt_right'.png3x,width: 22.w,height: 22.w,),
                        ],
                      )

                    ],
                  ),
                ).withOnTap(onTap: (){
                  Get.to(() => BillDetailPage(), arguments: {
                    'model': rankModel.billDetail,
                    'excerpt': rankModel.excerpt
                  });
                });
              },
              itemCount: logic.list.length,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: 1.sw,
                  height: 1.w,
                  margin: EdgeInsets.only(left: 15.w),
                  color: Color(0xffE9E9E9),
                );
              },
            ),
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
