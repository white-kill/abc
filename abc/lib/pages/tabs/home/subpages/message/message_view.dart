import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'message_logic.dart';
import 'message_state.dart';

class MessagePage extends BaseStateless {
  MessagePage({Key? key}) : super(key: key,title: '消息中心');

  final MessageLogic logic = Get.put(MessageLogic());
  final MessageState state = Get.find<MessageLogic>().state;


  @override
  List<Widget>? get rightAction => [
    BaseText(text: '设置').withPadding(
      right: 15.w,
    ).withContainer(
      alignment: Alignment.center
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        SizedBox(height: 10.w,),
        Image(
          image: 'ic_message1'.png3x,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
