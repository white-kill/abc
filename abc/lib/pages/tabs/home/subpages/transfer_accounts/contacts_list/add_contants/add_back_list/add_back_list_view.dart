import 'dart:convert';

import 'package:abc/config/abc_config/balance_eye_widget.dart';
import 'package:abc/main/my_app_page.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'add_back_list_logic.dart';
import 'add_back_list_state.dart';

class Add_back_listPage extends BaseStateless {
  Add_back_listPage({Key? key}) : super(key: key,title: '开户行');

  final Add_back_listLogic logic = Get.put(Add_back_listLogic());
  final Add_back_listState state = Get.find<Add_back_listLogic>().state;

  @override
  Color? get background => Colors.white;
  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [

        Container(
          height: 34.w,
          width: 1.sw,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.all(Radius.circular(20.w))
          ),
          margin: EdgeInsets.only(left: 12.w,right: 12.w),
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Icon(Icons.search,size: 20.w,color: Color(0xff7F7F7F),).withPadding(
              left: 8.w,right: 10.w
            ),
            Expanded(child: TextFieldWidget(hintText: '搜索',))
          ],),
        ),
        
        GetBuilder(builder: (Add_back_listLogic c){
          return Expanded(child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 38.w,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15.w, right: 12.w),
                child:BaseText(text: state.contactList[index].name),
              ).withOnTap(onTap: (){
                Get.back(result: state.contactList[index]);
              });
            },
            itemCount: state.contactList.length,
            separatorBuilder: (context, index) => Container(
              height: 1.w,
              width: 1.sw,
              color: Color(0xFFF1F1F1),
            ),
          ));
        },id: 'updateUI',)
      ],
    );
  }
}
