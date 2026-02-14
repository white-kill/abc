import '../../../../../../config/app_config.dart';
import '../../../../../../config/model/member_info_model.dart';

class ContactsListState {
  late MemberInfoModel infoModel;

  ContactsListState() {

    infoModel = AppConfig.config.abcLogic.memberInfo;
  }
}
