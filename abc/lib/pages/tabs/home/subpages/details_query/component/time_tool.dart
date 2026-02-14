import 'package:intl/intl.dart';

class DateUtils {
  static String getLastWeek() {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 7)));
  }

  static String getLastMonth() {
    final now = DateTime.now();
    // 处理跨年情况
    if (now.month == 1) {
      return DateFormat('yyyy-MM-dd')
          .format(DateTime(now.year - 1, 12, now.day));
    } else {
      return DateFormat('yyyy-MM-dd')
          .format(DateTime(now.year, now.month - 1, now.day));
    }
  }

  static String getLastThreeMonths() {
    final now = DateTime.now();
    // 处理跨年情况
    if (now.month <= 3) {
      return DateFormat('yyyy-MM-dd')
          .format(DateTime(now.year - 1, 12 + now.month - 3, now.day));
    } else {
      return DateFormat('yyyy-MM-dd')
          .format(DateTime(now.year, now.month - 3, now.day));
    }
  }

  // 或者使用天数计算（更精确）
  static String getLastThreeMonthsPrecise() {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 90)));
  }
}