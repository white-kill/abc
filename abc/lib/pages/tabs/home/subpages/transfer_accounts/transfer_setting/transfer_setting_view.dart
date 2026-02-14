import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'transfer_setting_logic.dart';
import 'transfer_setting_state.dart';

class Transfer_settingPage extends BaseStateless {
  Transfer_settingPage({Key? key}) : super(key: key,title: '转账设置');

  final Transfer_settingLogic logic = Get.put(Transfer_settingLogic());
  final Transfer_settingState state = Get.find<Transfer_settingLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10.w),
      itemBuilder: (context, index) {

        if(index == 4){
          return Container(
            height: 15.w,
            color: Colors.transparent,
          );
        }
        if(index == 1){
          return Container(
            height: 45.w,
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 12.w,top: 8.w),
            child: BaseText(text: '开通后, 支付或转账时即可验证指纹快速完成交易',fontSize: 13.sp,color: Color(0xff666666),),
          );
        }
        return Container(
          height: 45.w,
          padding: EdgeInsets.only(left: 12.w,right: 12.w),
          color: Colors.white,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              BaseText(text: state.nameLis1[index]),
              if(index == 0)
                Obx(() => CupertinoSwitch(
                  value: logic.changeValue.value,
                  onChanged: (bool value) {
                    logic.changeValue.value = value;
                  },
                  activeColor: Color(0xff51B297), //
                )),
              if(index != 0)
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
          height: (index ==2 || index == 5)?1.w:0,
          color: (index ==2 || index == 5)?Color(0xffE9E9E9):Colors.transparent,
        );
      }, //state.list.length,
    );
  }
}
