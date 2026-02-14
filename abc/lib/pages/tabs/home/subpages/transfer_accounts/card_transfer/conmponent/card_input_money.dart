import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../utils/color_util.dart';
import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';
import 'account_transfer_widget.dart';

class CardInputMoney extends StatefulWidget {
  const CardInputMoney({super.key});

  @override
  State<CardInputMoney> createState() => _CardInputMoneyState();
}

class _CardInputMoneyState extends State<CardInputMoney>
    with WidgetsBindingObserver {


  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  bool showDialog = true;


  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && state.moneyFocusNode.hasFocus) {
      state.moneyTextController.text = state.moneyStr;
      state.cardReq.amount = state.moneyStr;
    }
    if (bottomInset == 0) {
      if (state.moneyStr != '') {
        String money = NumberFormat("#,##0.00", "zh_CN")
            .format(double.parse(state.moneyStr));
        state.moneyTextController.text = money;
      }
      logic.update(['updateCardTransfer']);
    }
  }

  String formatToChineseUnitFull(double num) {
    const units = [
      '',
      '十',
      '百',
      '千',
      '万',
      '十万',
      '百万',
      '千万',
      '亿',
      '十亿',
      '百亿',
      '千亿',
      '万亿'
    ];
    const steps = [
      1,
      10,
      100,
      1000,
      10000,
      100000,
      1000000,
      10000000,
      100000000,
      1000000000,
      10000000000,
      100000000000,
      1000000000000
    ];

    if (num == 0) return '';

    int unitIndex = 0;
    for (int i = steps.length - 1; i >= 0; i--) {
      if (num >= steps[i]) {
        num /= steps[i];
        unitIndex = i;
        break;
      }
    }

    return units[unitIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 165.w,
      color: Colors.white,
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             BaseText(
               text: "转账金额",
               style: TextStyle(
                   fontSize: 18.sp,
                   color: Color(0xff333333)
               ),
             ).withContainer(
                 padding: EdgeInsets.only(top: 12.w,left: 15.w,bottom: 25.w)),

             BaseText(text: '转账说明',style: TextStyle(
               color: BColors.mainColor,
               fontSize: 13.sp,
             ),).withContainer(
                 padding: EdgeInsets.only(top: 15.w,right: 15.w,bottom: 25.w)).withOnTap(onTap: (){
               Get.toNamed(Routes.fixedNavPage, arguments: {
                 'title': '转账说明',
                 'image': 'zzsm_1',
                 'top': 0,
                 'right': false
               });
             }),
           ],
         ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transfer.itemCellWidget(
                      title: "¥",
                      hintText: '0手续费',
                      controller: state.moneyTextController,
                      focusNode: state.moneyFocusNode,
                      textColor: const Color(0xff333333),
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                        _DecimalTextInputFormatter(),
                        _MaxValueInputFormatter(1000000000), // 自定义的最大值限制
                      ],
                      onSubmitted: (v) {
                        logic.update(['updateBottom']);
                      },
                      onChanged: (value) {
                        state.moneyStr = value;
                        state.cardReq.amount = value;
                        logic.update(['updateBottom']);
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 20.w,left: 15.w),
                    width: 1.sw,
                    height: 1.w,
                    color: const Color(0xffE7E9EB),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}


class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // 如果新值包含多个小数点，则返回旧值
    if (newValue.text.split('.').length > 2) {
      return oldValue;
    }
    return newValue;
  }
}

// 自定义 TextInputFormatter 限制最大值
class _MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  _MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    try {
      final number = double.parse(newValue.text);
      if (number > maxValue) {
        return oldValue; // 如果超过最大值，返回旧值
      }
      return newValue;
    } catch (e) {
      return oldValue;
    }
  }
}

