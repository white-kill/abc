import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/color_util.dart';
import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';

class DaozType extends StatefulWidget {
  const DaozType({super.key});

  @override
  State<DaozType> createState() => _DaozTypeState();
}

class _DaozTypeState extends State<DaozType> {

  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;
  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logic.typeText(),
        BaseText(
          text: '更换到账时间',
          style: TextStyle(fontSize: 14.sp, color: BColors.mainColor),
        ),
      ],
    ).withPadding(left: 15.w, right: 15.w, top: 12.w).withOnTap(onTap: (){
      AlterPickerTime.showDataPick(
        context,
        dataList: ['实时到账','普通转账(2小时后转出)','次日转账(24小时后转出)'],
        onConfirm: (List v) {
          logic.type = v.first;
          logic.update(['update1111']);
        },
      );
    });
  }
}
