import 'package:abc/pages/tabs/home/subpages/details_export/details_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'details_export_logic.dart';
import 'details_export_state.dart';

class DetailsExportPage extends BaseStateless {
  DetailsExportPage({Key? key}) : super(key: key, title: '流水打印');

  final DetailsExportLogic logic = Get.put(DetailsExportLogic());
  final DetailsExportState state = Get.find<DetailsExportLogic>().state;

  @override
  List<Widget>? get rightAction => [
    BaseText(text: '申请记录', color: Color(0xff6F6F6F), fontSize: 14.sp)
        .withContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 10.w),
        )
        .withOnTap(
          onTap: () {
            Get.toNamed(Routes.exportRecordPage);
          },
        ),
  ];

  @override
  Widget initBody(BuildContext context) {
    return DetailsContentWidget();
  }


}
