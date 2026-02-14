import 'package:abc/pages/tabs/wealth/children/cc_widget/CcWidget.dart';
import 'package:abc/pages/tabs/wealth/children/lccs/state.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';

class LCCSPage extends BaseStateless {
  LCCSPage({Key? key}) : super(key: key);

  final LCCSLogic logic = Get.put(LCCSLogic());
  final LCCSState state = Get.find<LCCSLogic>().state;


  @override
  bool get isChangeNav => false;

  @override
  Widget? get titleWidget => Text(
    '理财超市',
    style: TextStyle(color: Colors.black, fontSize: 17.sp),
  );

  @override
  Widget? get leftItem => Row(
    children: [
      SizedBox(width: 15.w),
      Image(
          width: 22.w,
          height: 22.w,
          image: ('go_back').png3x,
          color: Colors.black)
          .withOnTap(
        onTap: () {
          //返回
          Get.back();
        },
      )
    ],
  );

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'icon_search'.png3x,
      width: 22.w,
      height: 22.w,
      color: Color(0xff707070),
    ).withOnTap(onTap: () {
      Get.toNamed(
        Routes.detailSearchPage,
      );
    }).withPadding(
      right: 12.w,
    ),
  ];

  @override
  double? get lefItemWidth => 80.w;



  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        // Tab导航栏
        _buildTabBar(),
        // Tab内容区域
        Expanded(
          child: _buildTabContent(),
        ),
      ],
    );
  }

  // 构建Tab导航栏
  Widget _buildTabBar() {
    return Container(
      height: 50.h,
      color: Colors.white,
      child: Obx(() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: logic.scrollController,
        child: Row(
          children: List.generate(
            state.tabTitles.length,
            (index) => _buildTabItem(index),
          ),
        ),
      )),
    );
  }

  // 构建单个Tab项
  Widget _buildTabItem(int index) {
    final isSelected = state.currentTabIndex.value == index;
    final title = state.tabTitles[index];
    
    return GestureDetector(
      onTap: () => logic.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xFF00B894) : Color(0xFF666666),
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            SizedBox(height: 8.h),
            // 选中状态的小色块
            Container(
              width: isSelected ? 14.sp * title.length : 0,
              height: 2.h,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF00B894) : Colors.transparent,
                borderRadius: BorderRadius.circular(1.5.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建Tab内容区域
  Widget _buildTabContent() {
    return Obx(() {
      switch (state.currentTabIndex.value) {
        case 0:
          return _buildLiveMoneyContent();
        case 1:
          return _buildStableWealthContent();
        case 2:
          return _buildInvestmentAdvanceContent();
        case 3:
          return _buildProprietaryWealthContent();
        case 4:
          return _buildAllContent();
        default:
          return _buildLiveMoneyContent();
      }
    });
  }

  // 活钱管理内容
  Widget _buildLiveMoneyContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'lccs_hqgl_1'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_hqgl_2'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_hqgl_3'.png, fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }

  // 稳健理财内容
  Widget _buildStableWealthContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'lccs_wjlc_1'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_wjlc_2'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_wjlc_3'.png, fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }

  // 投资进阶内容
  Widget _buildInvestmentAdvanceContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'lccs_tzjj_1'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_tzjj_2'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_tzjj_3'.png, fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }

  // 自营理财内容
  Widget _buildProprietaryWealthContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'lccs_zylc_1'.png, fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }

  // 全部内容
  Widget _buildAllContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'lccs_all_1'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_all_2'.png, fit: BoxFit.fitWidth,),
          Image(image: 'lccs_all_3'.png, fit: BoxFit.fitWidth,),
        ],
      ),
    );
  }
}
