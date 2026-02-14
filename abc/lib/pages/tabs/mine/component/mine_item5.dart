import 'package:abc/pages/tabs/home/subpages/netpoint_page/netpoint_page/netpoint_page_view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class MineItem5 extends StatefulWidget {
  const MineItem5({super.key});

  @override
  State<MineItem5> createState() => _MineItem5State();
}

class _MineItem5State extends State<MineItem5> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 215.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: 'bg_mine_item_5'.png3x,
                fit: BoxFit.fitWidth,)
          ),
        ).withOnTap(onTap: () {
          Get.to(() => Netpoint_pagePage());

          // Get.toNamed(Routes.fixedNavPage, arguments: {
          //   'title': '网点服务',
          //   'imageList': ['wdfw_1','wdfw_2'],
          // });
        }),
        // Positioned(
        //     top: 10.h,
        //     left: 10.h,
        //     child:
        // Container(width: screenWidth - 20.h,
        // height: 50.h,
        // ).withOnTap(onTap: () {
        //   Get.toNamed(Routes.fixedNavPage, arguments: {
        //     'title': '网点服务',
        //     'imageList': ['wdfw_1','wdfw_2'],
        //   });
        // })
        // )
      ],
    );
  }
}
