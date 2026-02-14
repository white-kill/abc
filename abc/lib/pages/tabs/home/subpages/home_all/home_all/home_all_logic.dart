import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/sticky_widget.dart';
import 'home_all_state.dart';

class Home_allLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final Home_allState state = Home_allState();

  // ScrollController 和相关状态
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> anchorKeys = List.generate(10, (index) => GlobalKey());
  final GlobalKey tabKey = GlobalKey();
  
  // StickyController 用于管理悬停组件
  final StickyController stickyController = StickyController();
  
  // 当前选中的 Tab 索引
  RxInt currentTabIndex = 0.obs;
  
  // TabController 用于控制 Tab 选中状态
  TabController? _tabController;
  TabController get tabController {
    _tabController ??= TabController(length: 10, vsync: this);
    return _tabController!;
  }
  
  // 标志位：是否正在手动点击 Tab（用于避免滚动时自动更新 Tab 选中状态）
  bool _isManualTabClick = false;

  @override
  void onInit() {
    super.onInit();
    _initScrollListener();
  }

  @override
  void onClose() {
    scrollController.dispose();
    stickyController.dispose();
    _tabController?.dispose();
    super.onClose();
  }

  // 初始化滚动监听
  void _initScrollListener() {
    scrollController.addListener(() {
      // 更新 StickyController 的滚动偏移量
      stickyController.updateScrollOffset(scrollController.offset);
      
      // 更新 Tab 选中状态
      _updateTabSelection();
    });
  }
  
  // 更新 Tab 选中状态
  void _updateTabSelection() {
    // 如果正在手动点击 Tab，则不自动更新选中状态
    if (_isManualTabClick) {
      return;
    }
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollOffset = scrollController.offset;
      int newTabIndex = 0;
      
      // 遍历所有锚点，找到当前滚动位置对应的 Tab
      for (int i = anchorKeys.length - 1; i >= 0; i--) {
        final key = anchorKeys[i];
        final context = key.currentContext;
        if (context != null) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);
          
          final scrollViewContext = scrollController.position.context.notificationContext;
          if (scrollViewContext != null) {
            final scrollViewRenderBox = scrollViewContext.findRenderObject() as RenderBox;
            final scrollViewPosition = scrollViewRenderBox.localToGlobal(Offset.zero);
            
            final relativePosition = position.dy - scrollViewPosition.dy;
            final anchorOffset = scrollOffset + relativePosition;
            
            // 如果当前滚动位置已经超过了这个锚点位置（考虑悬停 tab 的高度）
            if (scrollOffset >= anchorOffset - 50.0) {
              newTabIndex = i;
              break;
            }
          }
        }
      }
      
      // 更新 Tab 选中状态
      if (newTabIndex != currentTabIndex.value) {
        currentTabIndex.value = newTabIndex;
        if (tabController.index != newTabIndex) {
          tabController.animateTo(newTabIndex);
        }
      }
    });
  }


  // 滚动到指定锚点
  void scrollToAnchor(int index) {
    if (index < anchorKeys.length) {
      // 设置手动点击标志，防止滚动时自动更新 Tab 选中状态
      _isManualTabClick = true;
      
      final key = anchorKeys[index];
      final context = key.currentContext;
      if (context != null) {
        // 获取锚点元素的位置
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        
        // 获取 ScrollView 的位置
        final scrollViewContext = scrollController.position.context.notificationContext;
        if (scrollViewContext != null) {
          final scrollViewRenderBox = scrollViewContext.findRenderObject() as RenderBox;
          final scrollViewPosition = scrollViewRenderBox.localToGlobal(Offset.zero);
          
          // 计算锚点相对于 ScrollView 的位置
          final relativePosition = position.dy - scrollViewPosition.dy;
          
          // 计算目标滚动位置（当前滚动位置 + 相对位置 - 悬停偏移量）
          final targetOffset = scrollController.offset + relativePosition - 35.h; // 35.h 是为了让内容显示在悬停tab下方
          
          // 滚动到目标位置
          scrollController.animateTo(
            targetOffset.clamp(0.0, scrollController.position.maxScrollExtent),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ).then((_) {
            // 滚动完成后，延迟重置标志位，允许自动更新 Tab 选中状态
            Future.delayed(Duration(milliseconds: 100), () {
              _isManualTabClick = false;
            });
          });
        }
      } else {
        // 如果无法获取 context，立即重置标志位
        _isManualTabClick = false;
      }
    } else {
      // 如果索引无效，立即重置标志位
      _isManualTabClick = false;
    }
  }
}
