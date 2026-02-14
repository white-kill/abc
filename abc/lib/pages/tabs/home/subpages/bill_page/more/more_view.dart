import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'more_logic.dart';
import 'more_state.dart';

class MorePage extends BaseStateless {
  MorePage({Key? key}) : super(key: key,title: '更多');

  final MoreLogic logic = Get.put(MoreLogic());
  final MoreState state = Get.find<MoreLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10.w),
      itemBuilder: (context, index) {
        return Container(
          height: 45.w,
          padding: EdgeInsets.only(left: 12.w,right: 12.w),
          color: Colors.white,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            BaseText(text: state.nameLis1[index]),
            Image(image: 'ic_jt_right'.png3x,width: 25.w,height: 25.w,),
          ],),
        ).withOnTap(onTap: (){
          logic.jumpPage(state.nameLis1[index]);
        });
      },
      itemCount: state.nameLis1.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: 1.sw,
          height: 1.w,
          color: Color(0xffE9E9E9),
        );
      }, //state.list.length,
    );
  }
}
