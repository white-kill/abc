import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/time_tool.dart';
import '../../../../other/sheet_widget/picker_widget.dart';
import '../conmponent/bill_controller.dart';

class DetailSearchState {

  List nameList = [];
  TextEditingController textController = TextEditingController();

  DateTimePickerNotifier pickerSearchNotifier = DateTimePickerNotifier();

  String beginTime = '';
  String temBeginTime = '';
  String endTime = '';
  String temEndTime = '';

  bool isDay = false;
  bool isTemDay = false;


  String queryTime = '';
  String temQueryTime = '';


  BillController controller = BillController();
  DetailSearchState() {
    ///Initialize variables

    nameList = [
      '仅收入',
      '仅支出'
    ];

    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM');
    String formattedDate = formatter.format(now); // "2024-12-31"
    queryTime = formattedDate;
    temQueryTime = queryTime;

    var formatter2 = DateFormat('yyyy-MM-dd');
    beginTime = DateRangeCalculator.getRecentMonthRange(6)['start']??'';
    temBeginTime = DateRangeCalculator.getRecentMonthRange(6)['start']??'';
    endTime = formatter2.format(now);
    temEndTime = formatter2.format(now);
  }
}
