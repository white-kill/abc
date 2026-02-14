import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../export_result/export_result_view.dart';
import 'details_export_state.dart';

class DetailsExportLogic extends GetxController {
  var isThreeM = true.obs;
  final DetailsExportState state = DetailsExportState();

  void print() {
    if(!isValidEmail(state.emailTextController.text)){
      '请输入正确的邮箱'.showToast;
      return;
    }
    Http.post(Apis.flowExportPrint, data: {
      "currency": "人民币",
      "beginTime": state.beginTime,
      "endTime": state.endTime,
      "email": state.emailTextController.text
    }).then((v) {
      Get.to(() => ExportResultPage(),arguments: {
        'email':state.emailTextController.text,
      });
    });
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
