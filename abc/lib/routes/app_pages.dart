import 'package:abc/pages/register/view.dart';
import 'package:abc/pages/tabs/home/changeNav/change_navi/change_navi_view.dart';
import 'package:abc/pages/tabs/home/subpages/bill_page/detail_search/detail_search_logic.dart';
import 'package:abc/pages/tabs/home/subpages/cunkuan_page/cunkuan_page_view.dart';
import 'package:abc/pages/tabs/life/children/life_mssh/view.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/xyk/view.dart';
import 'package:abc/pages/tabs/mine/child/aqzx/view.dart';
import 'package:abc/pages/tabs/village/children/jdhx/view.dart';
import 'package:abc/pages/tabs/village/children/xchd/view.dart';
import 'package:abc/pages/tabs/village/children/zixun/view.dart';
import 'package:abc/pages/tabs/wealth/children/gjs/view.dart';
import 'package:abc/pages/tabs/wealth/children/jj/view.dart';
import 'package:abc/pages/tabs/wealth/children/lccp/view.dart';
import 'package:abc/pages/tabs/wealth/children/rmck/view.dart';
import 'package:abc/pages/tabs/wealth/children/lccs/view.dart';
import 'package:abc/pages/tabs/wealth/children/wh/view.dart';
import 'package:abc/pages/tabs/wealth/children/zq/view.dart';
import 'package:abc/pages/tabs/wealth/children/zqqh/view.dart';
import 'package:abc/pages/tabs/home/children/ta_hang_zhuan_ru/view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/index/index_view.dart';
import '../pages/login/login_view.dart';
import '../pages/splash/splash_view.dart';
import '../pages/tabs/home/subpages/bill_page/bill_page_view.dart';
import '../pages/tabs/home/subpages/bill_page/detail_search/detail_search_view.dart';
import '../pages/tabs/home/subpages/daikuan_page/dk_widget/dk_widget_view.dart';
import '../pages/tabs/home/subpages/details_export/details_export_view.dart';
import '../pages/tabs/home/subpages/details_query/details_query_view.dart';
import '../pages/tabs/home/subpages/export_record/export_record_view.dart';
import '../pages/tabs/home/subpages/export_result/export_result_view.dart';
import '../pages/tabs/home/subpages/my_account/my_account_view.dart';
import '../pages/tabs/home/subpages/transfer_accounts/card_transfer/card_transfer_view.dart';
import '../pages/tabs/home/subpages/transfer_accounts/phone_transfer/phone_transfer_view.dart';
import '../pages/tabs/home/subpages/transfer_accounts/transfer_accounts_view.dart';
import '../pages/tabs/home/subpages/transfer_accounts/transfer_result/transfer_result_view.dart';
import '../pages/tabs/mine/card_manage/card_manage_view.dart';
import '../pages/tabs/mine/coupon/coupon_view.dart';
import '../pages/tabs/mine/grade_manage/grade_manage_view.dart';
import '../pages/tabs/mine/mine_property/mine_property_view.dart';
import '../pages/tabs/mine/points_manage/points_manage_view.dart';
import '../pages/tabs/mine/setting/setting_view.dart';
import '../pages/tabs/other/fixed_nav/fixed_nav_view.dart';
import '../pages/tabs/other/search/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.tabs,
      page: () => IndexPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.cardManagePage,
      page: () => CardManagePage(),
    ),
    GetPage(
      name: Routes.pointsManagePage,
      page: () => PointsManagePage(),
    ),
    GetPage(
      name: Routes.gradeManagePage,
      page: () => GradeManagePage(),
    ),
    GetPage(
      name: Routes.settingPage,
      page: () => SettingPage(),
    ),
    GetPage(
      name: Routes.couponPage,
      page: () => CouponPage(),
    ),
    // GetPage(
    //   name: Routes.login,
    //   page: () => LoginPage(),
    // ),
    GetPage(
      name: Routes.changeNavi,
      page: () => ChangeNavPage(),
    ),
    GetPage(
      name: Routes.minePropertyPage,
      page: () => MinePropertyPage(),
    ),
    GetPage(
      name: Routes.myAccountPage,
      page: () => MyAccountPage(),
    ),
    GetPage(
      name: Routes.transferAccountsPage,
      page: () => TransferAccountsPage(),
    ),
    GetPage(
      name: Routes.cardTransferPage,
      page: () => CardTransferPage(),
    ),
    GetPage(
      name: Routes.phoneTransferPage,
      page: () => PhoneTransferPage(),
    ),
    GetPage(
      name: Routes.transferResultPage,
      page: () => TransferResultPage(),
    ),
    GetPage(
      name: Routes.billPagePage,
      page: () => BillPagePage(),
    ),
    GetPage(
      name: Routes.detailsExportPage,
      page: () => DetailsExportPage(),
    ),
    GetPage(
      name: Routes.detailsQueryPage,
      page: () => DetailsQueryPage(),
    ),
    GetPage(
      name: Routes.detailSearchPage,
      page: () => DetailSearchPage(),
    ),
    GetPage(
      name: Routes.exportRecordPage,
      page: () => ExportRecordPage(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchPage(),
    ),
    GetPage(
      name: Routes.exportResultPage,
      page: () => ExportResultPage(),
    ),
    GetPage(
      name: Routes.fixedNavPage,
      page: () => FixedNavPage(),
    ),
    GetPage(
      name: Routes.splashPage,
      page: () => SplashPage(),
    ),
    // 家电换新页面路由
    GetPage(
      name: Routes.jdhxPage,
      page: () => JdhxPage(),
    ),
    // 乡村好店页面路由
    GetPage(
      name: Routes.xchdPage,
      page: () => XchdPage(),
    ),
    // 贵金属页面路由
    GetPage(
      name: Routes.cfgjs,
      page: () => GjsPage(),
    ),
    // 基金页面路由
    GetPage(
      name: Routes.cfjj,
      page: () => JijinPage(),
    ),
    // 理财产品页面路由
    GetPage(
      name: Routes.cflccp,
      page: () => LccpPage(),
    ),
    // 外汇页面路由
    GetPage(
      name: Routes.cfwh,
      page: () => WhPage(),
    ),
    // 债券页面路由
    GetPage(
      name: Routes.cfzq,
      page: () => ZqPage(),
    ),
    // 债券期货页面路由
    GetPage(
      name: Routes.cfzqqh,
      page: () => ZqqhPage(),
    ),
    // 美食生活页面路由
    GetPage(
      name: Routes.lifeMssh,
      page: () => LifeMsshPage(),
    ),
    // 咨询页面路由
    GetPage(
      name: Routes.villageZixun,
      page: () => VillageZiXunPage(),
    ),
    // 他行转入页面路由
    GetPage(
      name: Routes.taHangZhuanRu,
      page: () => TaHangZhuanRuPage(),
    ),
    GetPage(name: Routes.reMenCunKuan, page:() => RmckPage(),),
    // 理财超市页面路由
    GetPage(
      name: Routes.lccsPage,
      page: () => LCCSPage(),
    ),
   // 安全中心
    GetPage(
      name: Routes.aqzxPage,
      page: () => AqzxPage(),
    ),
    GetPage(
      name: Routes.yhkglDetailPage,
      page: () => YhkglXYKPage(),
    )
  ];
}
