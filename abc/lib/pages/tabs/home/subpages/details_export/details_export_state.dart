import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DetailsExportState {
  
  
  String endTime = '';
  String beginTime = '';
  String email = '';

  TextEditingController emailTextController = TextEditingController();
  
  DetailsExportState() {
    ///Initialize variables
    final DateTime now = DateTime.now();
    DateFormat('yyyy-MM-dd').format(now);
    endTime = DateFormat('yyyy-MM-dd').format(now);
    beginTime = getDateMonthsAgo(3);
  }

  String getDateMonthsAgo(int months) {
    final DateTime now = DateTime.now();
    final DateTime pastDate = DateTime(now.year, now.month - months, now.day);
    return DateFormat('yyyy-MM-dd').format(pastDate);
  }
}
