import 'package:abc/pages/tabs/home/subpages/scan_widget/scan_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';

class TopBannerWidget extends StatefulWidget {
  const TopBannerWidget({super.key});

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  List<String> nameList = ['我的账户', '转账', '收支', '扫一扫'];

  //TODO：跳转页面
  void jumpPage(String name){
    if(name == '我的账户'){
      Get.toNamed(Routes.myAccountPage);
    }

    if(name == '转账'){
      Get.toNamed(Routes.transferAccountsPage,);
    }

    if(name == '收支'){
      Get.toNamed(Routes.billPagePage,);
    }
    if(name == '扫一扫'){
      //Get.toNamed(Routes.homeScanPage);
      //Get.toNamed(Routes.saoyisaoPage);
      Get.to(() => Scan_widgetPage());
    }
  }
  @override
  Widget build(BuildContext context) {
    return VerticalGridView(
      padding: EdgeInsets.only(left: 12.w,right: 12.w,),
      widgetBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: 'icon_home_${index + 1}'.png3x,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              height: 5.w,
            ),
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
      mainHeight:112.w,
      itemCount: 4,
    )
        .withContainer(
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
    );
    //     .withContainer(
    //   width: 375.w,
    //   height: 300.w,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: 'bg_home_top'.png3x,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   alignment: Alignment.bottomCenter,
    //   padding: EdgeInsets.only(bottom: 10.w),
    // );
  }
}
