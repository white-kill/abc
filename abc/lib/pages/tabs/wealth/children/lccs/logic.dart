import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'state.dart';

class LCCSLogic extends GetxController {
  final LCCSState state = LCCSState();
  
  // 滚动控制器
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    int index = Get.arguments?["index"] ?? 0;
    state.currentTabIndex.value = index;
    super.onInit();
  }


  // 切换Tab
  void changeTab(int index) {
    state.currentTabIndex.value = index;
    _scrollToTab(index);
  }

  // 滚动到指定Tab
  void _scrollToTab(int index) {
    // 延迟执行，确保UI已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        // 计算目标位置 - 增加移动距离
        final double itemWidth = 100.w; // 增加Tab宽度估计值
        final double screenWidth = Get.width;
        final double targetOffset = (index * itemWidth) - (screenWidth / 3); // 改为屏幕1/3位置
        
        // 确保滚动位置在有效范围内
        final double maxOffset = (state.tabTitles.length * itemWidth) - screenWidth;
        final double clampedOffset = targetOffset.clamp(0.0, maxOffset > 0 ? maxOffset : 0.0);
        
        // 执行滚动动画 - 增加动画时长
        scrollController.animateTo(
          clampedOffset,
          duration: Duration(milliseconds: 500), // 增加动画时长
          curve: Curves.easeOutCubic, // 使用更明显的缓动曲线
        );
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
