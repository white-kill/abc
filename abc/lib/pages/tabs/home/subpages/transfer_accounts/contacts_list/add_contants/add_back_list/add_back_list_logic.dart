import 'package:abc/config/dio/network.dart';
import 'package:abc/config/net_config/apis.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/bank_list/bank_list_model.dart';
import 'package:get/get.dart';

import 'add_back_list_state.dart';

class Add_back_listLogic extends GetxController {
  final Add_back_listState state = Add_back_listState();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  void loadData() async {

    Http.get(Apis.bankList).then((value){
      if(value!= null){
        for (var v in value['bankList']) {
          state.contactList.add(ContactInfo.fromJson(v));
        }
      }
      update(['updateUI']);
    });

  }
}
