import 'package:abc/config/model/analysis_chat_model.dart';

import '../../../../other/sheet_widget/picker_widget.dart';

class BillAnalysisState {


  String time = '';
  String temTime = '';

  List<AnalysisChatModel> dataList = [];

  List<ChartData> chartData1 = [];


  DateTimePickerNotifier pickerNotifier = DateTimePickerNotifier();
  BillAnalysisState() {
    ///Initialize variables
  }
}


class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

