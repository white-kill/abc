import 'package:get/get.dart';

class LCCSState {
  LCCSState() {
    ///Initialize variables
  }

  // 当前选中的Tab索引
  final RxInt currentTabIndex = 0.obs;

  // Tab标题列表
  final List<String> tabTitles = [
    '活钱管理',
    '稳健理财', 
    '投资进阶',
    '自营理财',
    '全部'
  ];
}
