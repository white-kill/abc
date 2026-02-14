import 'package:abc/pages/tabs/life/life_jf/life_jf_view.dart';
import 'package:abc/pages/tabs/life/phone/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../mine/xiaodou/xiaodou_view.dart';
import 'life_ms/life_ms_view.dart';

class LifeTopBannerWidget extends StatefulWidget {
  const LifeTopBannerWidget({super.key});

  @override
  State<LifeTopBannerWidget> createState() => _LifeTopBannerWidgetState();
}

class _LifeTopBannerWidgetState extends State<LifeTopBannerWidget> {
  List<String> nameList = ['生活缴费', '手机充值', '政务民生', '小豆乐园'];

  void jumpPage(String name) {

    if(name == '生活缴费'){
      Get.to(() => Life_jfPage());
    }
    if(name == '手机充值'){
      Get.to(() => PhonePage());
    }
    if(name == '政务民生'){
      Get.to(() => Life_msPage());
    }
    if(name == '小豆乐园'){
      Get.to(() => XiaodouPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VerticalGridView(
          padding: EdgeInsets.only(left: 12.w,right: 12.w),
          widgetBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: 'icon_life_${index + 1}'.png3x,
                  width: 50.w,
                  height: 50.h,
                ),
                SizedBox(height: 5.w),
                BaseText(
                  text: nameList[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Color(0xff333333),
                  ),
                ),
              ],
            ).withOnTap(onTap: () => jumpPage(nameList[index]));
          },
          mainHeight: 112.w,
          itemCount: 4,
        ).withContainer(
          width: 340.w,
          height: 112.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 0.5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
