import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/function_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'details_query_detail_logic.dart';
import 'details_query_detail_state.dart';

class DetailsQueryDetailPage extends BaseStateless {
  DetailsQueryDetailPage({Key? key}) : super(key: key, title: '明细查询');

  final DetailsQueryDetailLogic logic = Get.put(DetailsQueryDetailLogic());
  final DetailsQueryDetailState state =
      Get.find<DetailsQueryDetailLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (DetailsQueryDetailLogic c) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 90.w,
              width: 1.sw,
              color: Colors.white,
              padding: EdgeInsets.only(left: 15.w, right: 17.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image(
                        image: 'ic_ly_logo'.png3x,
                        width: 18.w,
                        height: 18.w,
                      ),
                      SizedBox(width: 8.w),
                      logic.replaceAsterisksWithImages(
                          AppConfig.config.abcLogic.card(),
                          color: Color(0xff333333),
                          fontSize: 17)
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //（1收入2支出）
                      BaseText(
                        text: '交易金额',
                        fontSize: 14.sp,
                        color: Color(0xff6B6B6B),
                      ),
                      BaseText(
                        text:
                            '${logic.detailModel.type == '1' ? '+' : '-'}${logic.detailModel.amount.bankBalance}',
                        fontSize: 23.sp,
                        color: logic.detailModel.type == '1'
                            ? Colors.orangeAccent
                            : Color(0xff333333),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    top: 8.w,
                    bottom: 8.w,
                    left: 15.w,
                    right: 15.w,
                  ),
                  width: 1.sw,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: logic.titleList[index],
                        fontSize: 14.sp,
                        color: Color(0xff333333),
                      ).withContainer(width: 80.w),
                      Expanded(
                          child: logic.replaceAsterisksWithImages(
                              logic.valueData(logic.titleList[index]),
                              color: Color(0xff6A6A6A)))
                    ],
                  ),
                );
              },
              itemCount: logic.titleList.length,
            ).withContainer(
              color: Colors.white,
              padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
            )
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
