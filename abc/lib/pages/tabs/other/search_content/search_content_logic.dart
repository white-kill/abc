import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import 'search_content_state.dart';

class SearchContentLogic extends GetxController {
  final SearchContentState state = SearchContentState();



  void jumpPage(String name){

    if(name == '明细查询'){
      Get.toNamed(Routes.detailsQueryPage);
    }
    if(name == '流水打印'){
      Get.toNamed(Routes.detailsExportPage);
    }
    if(name == '转账'){
      //cardTransferPage
      Get.toNamed(Routes.transferAccountsPage,);
    }
    if(name == '收支'){
      Get.toNamed(Routes.billPagePage,);
    }
  }
}
