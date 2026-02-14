import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../config/model/export_record_model.dart';

class ExportRecordState {

  RefreshController refreshController = RefreshController();
  List<ExportRecordList> list = [];

  int pageSize = 10;
  int pageNum = 1;

  ExportRecordState() {
    ///Initialize variable
  }
}
