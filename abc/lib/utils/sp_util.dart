
import 'package:abc/config/app_config.dart';
import 'package:sp_util/sp_util.dart';

class SpKey{


  static const String tokenKey = "access_token";

  static const String userTypeKey = "user_position";

  static const String userAccount = "user_account";

  static const String userPassword = "user_password";


  static const String userRememberPassword = "user_remember_password";

  static const String userIdKey = "user_id_key";

  static const String languageKey = "language_key";

  static const String deleteAccount = "delete_account";

  static const String searchHistory = "search_history";

  static const String userInfo = "user_info";

  static const String bankAliasName = "bank_alias";

  static const String bankRegistration = "bank_registration";

  static const String bankOpenOutlets = "bank_open_outlets";

  static const String bankCardStatus = "bank_card_status";

  static const String bankAccountStatus = "bank_account_status";

  static const String bankDefaultAccount = "bank_default_account";

  static const String contactList = "contact_list";

  static const String lastYear = "lastYear_key";

  static const String billData = "bill_data";

  static const String deviceName = "device_name";

}

extension SpExtensionBool on bool {

  void get saveRememberPsd => SpUtil.putBool(SpKey.userRememberPassword, this);
}


extension SpExtension on String{

  void get saveToken => SpUtil.putString(SpKey.tokenKey, this);


  void get saveAccount => SpUtil.putString(SpKey.userAccount, this);

  void get savePassword => SpUtil.putString(SpKey.userPassword, this);

  void get saveUserId => SpUtil.putString(SpKey.userIdKey, this);

  void get saveLanguage => SpUtil.putString(SpKey.languageKey, this);

  void get saveDeleteAccount => SpUtil.putString(SpKey.deleteAccount, this);

  void get saveSearchHistory => SpUtil.putString(SpKey.searchHistory, this);

  void get saveUserInfo => SpUtil.putString("${SpKey.userInfo}${AppConfig.config.abcLogic.memberInfo.account}", this);

  void get saveBankAlias => SpUtil.putString("${SpKey.bankAliasName}${AppConfig.config.abcLogic.memberInfo.account}", this);

  void get saveBankRegistration => SpUtil.putString('${SpKey.bankRegistration}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveBankOpenOutlets => SpUtil.putString('${SpKey.bankOpenOutlets}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveBankCardStatus => SpUtil.putString('${SpKey.bankCardStatus}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveBankAccountStatus => SpUtil.putString('${SpKey.bankAccountStatus}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveBankDefaultAccount => SpUtil.putString('${SpKey.bankDefaultAccount}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveContactList => SpUtil.putString('${SpKey.contactList}${AppConfig.config.abcLogic.memberInfo.account}', this);


  void get saveLastYear => SpUtil.putString('${SpKey.lastYear}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveBillData => SpUtil.putString('${SpKey.billData}${AppConfig.config.abcLogic.memberInfo.account}', this);

  void get saveDeviceName => SpUtil.putString(SpKey.deviceName, this);

}


Future<bool>? get removeAllData => SpUtil.clear();

Future<bool>? removeKey(String key) => SpUtil.remove(key);


String get token => SpUtil.getString(SpKey.tokenKey)??"";

String get account => SpUtil.getString(SpKey.userAccount)??"";

String get password => SpUtil.getString(SpKey.userPassword)??"";

bool get getRememberPsd => SpUtil.getBool(SpKey.userRememberPassword)??false;

String get userId => SpUtil.getString(SpKey.userIdKey)??'';

String get languageValue => SpUtil.getString(SpKey.languageKey)??'';

String get deleteAccountValue => SpUtil.getString(SpKey.deleteAccount)??'';

String get searchHistoryValue => SpUtil.getString(SpKey.searchHistory)??'';

String get userInfo => SpUtil.getString("${SpKey.userInfo}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankAlias => SpUtil.getString("${SpKey.bankAliasName}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankRegistration => SpUtil.getString("${SpKey.bankRegistration}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankOpenOutlets => SpUtil.getString("${SpKey.bankOpenOutlets}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankCardStatus => SpUtil.getString("${SpKey.bankCardStatus}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankAccountStatus => SpUtil.getString("${SpKey.bankAccountStatus}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get bankDefaultAccount => SpUtil.getString("${SpKey.bankDefaultAccount}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get spContactList => SpUtil.getString("${SpKey.contactList}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get spLastYear => SpUtil.getString("${SpKey.lastYear}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get spBillData => SpUtil.getString("${SpKey.billData}${AppConfig.config.abcLogic.memberInfo.account}")??'';

String get spDeviceName => SpUtil.getString(SpKey.deviceName)??'';


