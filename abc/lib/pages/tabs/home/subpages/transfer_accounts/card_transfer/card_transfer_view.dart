import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/card_input_money.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/daoz_type.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/fk_card.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/zh_info.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/card_transfer/conmponent/zh_remarks.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/sheet_widget/sheet_bottom.dart';
import '../transfer_record/transfer_record_view.dart';
import 'card_transfer_logic.dart';
import 'card_transfer_state.dart';
import 'conmponent/transfer_confirm_widget.dart';
import 'conmponent/transfer_password_widget.dart';
import 'conmponent/zh_info1.dart';

class CardTransferPage extends BaseStateless {
  CardTransferPage({Key? key}) : super(key: key, title: '账号转账');

  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  @override
  List<Widget>? get rightAction => [
        GetBuilder(
          builder: (CardTransferLogic c) {
            return state.cardInfo['id'] == ''
                ? SizedBox.shrink()
                : BaseText(
                    text: '转账记录',
                    fontSize: 15.sp,
                  )
                    .withContainer(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 15.w),
                  )
                    .withOnTap(onTap: () {
                    Get.to(() => TransferRecordPage(), arguments: {
                      'oppositeAccount': state.cardInfo['bankCard']
                    });
                  });
          },
          id: 'updateUI',
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (CardTransferLogic c) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 6.w),
            state.cardInfo['id'] == '' ? ZhInfo() : ZhInfo1(),
            SizedBox(height: 10.w),
            FkCard(),
            SizedBox(height: 10.w),
            CardInputMoney(),
            SizedBox(height: 10.w),
            ZhRemarks(),
            GetBuilder(
              builder: (CardTransferLogic c) {
                return DaozType();
              },
              id: 'update1111',
            ),
            GetBuilder(
              builder: (CardTransferLogic c) {
                bool show = state.cardReq.bankName != '' &&
                    state.cardReq.amount != '' &&
                    state.cardReq.realName != '';
                print(show);
                return Container(
                  width: 340.w,
                  height: 45.w,
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: show ? Color(0xffF3AD3C) : Color(0xffFBE7B8),
                    borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  ),
                  child: BaseText(
                      text: "下一步", color: Colors.white, fontSize: 14.sp),
                ).withOnTap(onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (show) {
                    SheetBottom.show(
                        title: '确认信息', child: TransferConfirmWidget());
                  }
                });
              },
              id: 'updateBottom',
            ),
            BaseText(
              text: "温馨提示\n1.请勿轻易向陌生收款人转账，"
                  "谨防电信网络诈骗。"
                  "做到“陌生电话勿轻信，对方身份要核清，"
                  "家中隐私勿泄露，涉及钱财需小心，遇到事情勿惊慌，"
                  "即时拨打110”"
                  "\n2.为了您的资金安全，请务必妥善保管银行卡号、密码等个人重要信息。",
              maxLines: 20,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff636363),
                height: 20 / 14,
              ),
            ).withContainer(
              width: 350.w,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 17.w, right: 25.w, top: 24.w),
            ),
            SizedBox(height: ScreenUtil().bottomBarHeight + 25.w),
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
