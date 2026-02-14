import 'package:intl/intl.dart';

class DateRangeCalculator {
  static final DateFormat _formatter = DateFormat('yyyy-MM-dd');

  /// 计算近N个月的日期范围
  static Map<String, String> getRecentMonthRange(int months) {
    final DateTime now = DateTime.now();
    final DateTime endDate = DateTime(now.year, now.month, now.day);
    final DateTime startDate = _calculateStartDate(now, months);

    return {
      'start': _formatter.format(startDate),
      'end': _formatter.format(endDate),
    };
  }

  /// 计算开始日期（处理月末边界情况）
  static DateTime _calculateStartDate(DateTime endDate, int months) {
    int year = endDate.year;
    int month = endDate.month - months;
    int day = endDate.day;

    // 处理跨年情况
    while (month < 1) {
      year--;
      month += 12;
    }

    // 处理月末情况（如3月31日往前推1个月应该是2月28/29日）
    final int daysInMonth = DateTime(year, month + 1, 0).day;
    day = day > daysInMonth ? daysInMonth : day;

    return DateTime(year, month, day);
  }

  /// 获取常用时间范围选项
  static Map<String, Map<String, String>> getCommonDateRanges() {
    final DateTime now = DateTime.now();
    return {
      '近1个月': getRecentMonthRange(1),
      '近3个月': getRecentMonthRange(3),
      '近6个月': getRecentMonthRange(6),
      '近12个月': getRecentMonthRange(12),
    };
  }
}