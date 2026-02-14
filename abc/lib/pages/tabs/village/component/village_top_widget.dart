import 'package:abc/pages/tabs/village/village_fxzl/village_fxzl_view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';

class VillageTopWidget extends StatefulWidget {
  const VillageTopWidget({super.key});

  @override
  State<VillageTopWidget> createState() => _VillageTopWidgetState();
}

class _VillageTopWidgetState extends State<VillageTopWidget> {


  List titleName = ['农银商城', '发县之旅', '公益助农', '乡村好店'];
  
  void jumpPage(String name){
    if(name == '农银商城'){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '农银商城',
        'image': 'bg_nysc',
      });
    }
    if(name == '发县之旅'){
      Get.to(() => Village_fxzlPage());
    }
    if(name == '公益助农'){
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '公益助农',
        'image': 'bg_gyzn',
      });
    }
    if(name == '乡村好店'){
      Get.toNamed(Routes.xchdPage);
    }
  }
  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(image: 'bg_village_top'.png3x, fit: BoxFit.fitWidth),
      ),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '乡村味道',
                  'image': 'bg_xcwd',
                });
              },
              child: Container(height: 79.w + navHeight,width: screenWidth)),
          Container(
            width: 340.w,
            height: 112.w,
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.16),
                    spreadRadius: 0.5.w,
                    blurRadius: 10.w,
                    offset: Offset(0, 1.5.w),
                  ),
                ],
              borderRadius: BorderRadius.all(Radius.circular(12.w))
            ),
            child: VerticalGridView(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              mainHeight:  112.w,
              widgetBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: 'ic_xc$index'.png3x,width: 44.w,height: 44.w,),
                    SizedBox(height: 10.w,),
                    BaseText(
                      text: titleName[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Color(0xff333333),
                      ),
                    ),
                  ],
                ).withOnTap(onTap: () => jumpPage(titleName[index]));
              },
              itemCount: titleName.length,
            ),
          ),
          SizedBox(height: 10.w,)
        ],
      ),
    );
  }
}
