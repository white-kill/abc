import 'package:get/get.dart';

import '../../bank_list/bank_list_model.dart';
import 'add_contants_state.dart';

class AddContactsLogic extends GetxController {
  final AddContactsState state = AddContactsState();

  ContactInfo contactInfo = ContactInfo();

  var isOne = true.obs;

  List<Map> contactList = [];
}
