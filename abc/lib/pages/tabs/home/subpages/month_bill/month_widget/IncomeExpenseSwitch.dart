import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'month_widget_logic.dart';

class IncomeExpenseSwitch extends StatefulWidget {
  const IncomeExpenseSwitch({Key? key}) : super(key: key);

  @override
  State<IncomeExpenseSwitch> createState() => _IncomeExpenseSwitchState();
}

class _IncomeExpenseSwitchState extends State<IncomeExpenseSwitch> {
  int _selectedIndex = 0; // 0: 支出, 1: 收入
  final List<GlobalKey> _itemKeys = [GlobalKey(), GlobalKey()];
  double _indicatorPosition = 0;
  final double _indicatorWidth = 13.w; // 固定宽度为13.w

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateIndicator());
  }

  void _updateIndicator() {
    final renderBox = _itemKeys[_selectedIndex].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      final position = renderBox.localToGlobal(Offset.zero);
      final containerBox = context.findRenderObject() as RenderBox?;
      if (containerBox != null) {
        final containerPosition = containerBox.localToGlobal(Offset.zero);
        double textCenter = position.dx - containerPosition.dx + renderBox.size.width / 2;

        // 计算横标位置：文本中心点减去横标宽度的一半
        setState(() {
          _indicatorPosition = textCenter - _indicatorWidth / 2;
        });
      }
    }
  }

  void _selectItem(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateIndicator());
    final Month_widgetLogic logic = Get.put(Month_widgetLogic());
    logic.changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: GlobalKey(),
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _selectItem(0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  '支出',
                  key: _itemKeys[0],
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Color(0xff333333) : Color(0xffcccccc),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 50.w),
            GestureDetector(
              onTap: () => _selectItem(1),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  '收入',
                  key: _itemKeys[1],
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Color(0xff333333) : Color(0xffcccccc),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        //SizedBox(height: .h),
        Container(
          height: 2.h,
          child: Stack(
            children: [
              // 绿色滑动横标
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                left: _indicatorPosition,
                child: Container(
                  width: _indicatorWidth, // 固定宽度13.w
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(1.h), // 可选：圆角设计
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}