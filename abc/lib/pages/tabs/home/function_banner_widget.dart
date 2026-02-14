import 'package:abc/pages/tabs/home/subpages/cunkuan_page/cunkuan_page_view.dart';
import 'package:abc/pages/tabs/home/subpages/daikuan_page/dk_widget/dk_widget_view.dart';
import 'package:abc/pages/tabs/home/subpages/home_all/home_all/home_all_view.dart';
import 'package:abc/pages/tabs/home/subpages/lifepay_page/lifepay/lifepay_view.dart';
import 'package:abc/pages/tabs/home/subpages/netpoint_page/netpoint_page/netpoint_page_view.dart';
import 'package:abc/pages/tabs/life/life_jf/life_jf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../../routes/app_pages.dart';

class FunctionBannerWidget extends StatefulWidget {
  const FunctionBannerWidget({super.key});

  @override
  State<FunctionBannerWidget> createState() => _FunctionBannerWidgetState();
}

class _FunctionBannerWidgetState extends State<FunctionBannerWidget> {
  List dataList = [
    [
      {'image': 'ic_fhome_1_', 'name': '信用卡'},
      {'image': 'ic_fhome_1_', 'name': '存款'},
      {'image': 'ic_fhome_1_', 'name': '热门活动'},
      {'image': 'ic_fhome_1_', 'name': '个人养老金'},
      {'image': 'ic_fhome_1_', 'name': '贷款'},
      {'image': 'ic_fhome_1_', 'name': '网点服务'},
      {'image': 'ic_fhome_1_', 'name': '明细查询'},
      {'image': 'ic_fhome_1_', 'name': '流水打印'},
      {'image': 'ic_fhome_1_', 'name': '生活缴费'},
      {'image': 'ic_fhome_1_', 'name': '全部'}
    ],
  ];

  void jumpPage(String name) {
    print(name);
    switch (name) {
      case '信用卡':
        Get.toNamed(Routes.changeNavi, arguments: {
          'title': '信用卡',
          'image': 'xyk',
          'offset':false,
          'defTitleColor': Colors.black,
        });
        break;
        case '存款':
          Get.to(() => Cunkuan_pagePage());
        break;
        case '热门活动':
        Get.toNamed(Routes.changeNavi, arguments: {
          'title': '热门活动',
          'image': 'rmhd',
          'offset':false,
          'defTitleColor': Colors.black,
        });
        break;
        case '个人养老金':
          Get.toNamed(Routes.changeNavi, arguments: {
            'title': '个人养老金',
            'image': 'grylj',
            'offset':false,
            'defTitleColor': Colors.black,
          });
        break;
        case '贷款':
          Get.to(() => Dk_widgetPage());
        break;
       case '网点服务':
        Get.to(() => Netpoint_pagePage());
        break;
        case '生活缴费':
          Get.to(() =>Life_jfPage());
          break;
      case '全部':
        Get.to(() => Home_allPage());
        break;
      case '明细查询':
        Get.toNamed(Routes.detailsQueryPage);
        break;
      case '流水打印':
        Get.toNamed(Routes.detailsExportPage);
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 158.w,
      width: 375.w,
      child: SwiperHorizontal(
          itemCount: dataList.length,
          activeColor: Colors.white.withOpacity(0.0),
          color: Colors.white.withOpacity(0.0),
          widgetBuilder: (_, index) {
            return _swiperItemWidget(dataList[index], index);
          }),
    );
  }
  Widget _swiperItemWidget(List data, int idx) {
    return VerticalGridView(
      padding: EdgeInsets.only(left: 12.w, right: 12.w,top: 10.w),
      widgetBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              //home_banner_icon
              image: 'home_banner_icon_${index + 1}'.png3x,
              //image: 'banben'.png3x,
              width: 30.w,
              height: 30.h,
              //color: Colors.black,
            ),
            SizedBox(
              height: 4.w,
            ),
            BaseText(
              text: data[index]['name'],
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xff222222),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ).withOnTap(onTap: () => jumpPage(data[index]['name']));
      },
      itemCount: data.length,
      crossCount: 5,
      mainHeight: 55.w,
      spacing: 10.w,
    );
  }
}
