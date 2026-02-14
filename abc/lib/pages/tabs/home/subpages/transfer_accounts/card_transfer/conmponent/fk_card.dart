import 'package:abc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class FkCard extends StatefulWidget {
  const FkCard({super.key});

  @override
  State<FkCard> createState() => _FkCardState();
}

class _FkCardState extends State<FkCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 115.w,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: '付款卡',
            fontSize: 18.sp,
            color: Color(0xff333333),
          ).withContainer(
            width: 110.w,
            padding: EdgeInsets.only(left: 15.w, top: 10.w),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: 'ic_jjk'.png3x,
                    width: 24.w,
                    height: 24.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: '借记卡（${AppConfig.config.abcLogic.cardFour()}）',
                        fontSize: 17.sp,
                        color: const Color(0xff333333),
                      ),
                      SizedBox(height: 4.w),
                      BaseText(
                        text: "可用余额￥${AppConfig.config.abcLogic.balance()}",
                        color: const Color(0xff676767),
                        fontSize: 13.sp,
                      ),
                    ],
                  ),
                ],
              ),
              Image(
                image: 'ic_jt_bottom'.png3x,
                width: 25.w,
                height: 25.w,
              ).withPadding(
                right: 18.w,
              ),
            ],
          )
              .withPadding(
            left: 15.w,
            top: 15.w,
          )
              .withOnTap(onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.w)),
                builder: (context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(12.w),
                      child: Stack(
                        children: [
                          Image(image: 'select_card'.png),
                          Positioned(
                            left: 108.w,
                              top: 62.w,
                              child: Text(
                            "${AppConfig.config.abcLogic.cardFour()}",
                            style: TextStyle(fontSize: 16.sp, height: 1.0),
                            strutStyle: StrutStyle(forceStrutHeight: true),
                          ))
                        ],
                      )).withOnTap(onTap: () {
                        Get.back();
                  });
                });
          })
        ],
      ),
    );
  }
}
