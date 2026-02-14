import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../config/abc_config/abc_logic.dart';
import 'village_fxzl_logic.dart';
import 'village_fxzl_state.dart';

class Village_fxzlPage extends BaseStateless {
  Village_fxzlPage({Key? key}) : super(key: key,title: '发县之旅');

  final Village_fxzlLogic logic = Get.put(Village_fxzlLogic());
  final Village_fxzlState state = Get.find<Village_fxzlLogic>().state;


  @override
  Color? get background => Colors.white;
  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [

                Image(
                    width: 21.w,
                    height: 21.w,
                    image: 'location'.png3x,
                    color: Color(0xff333333)),

                SizedBox(width: 2.w),
                GetBuilder(
                  builder: (AbcLogic c) {
                    return Text(
                      c.memberInfo.city,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff333333),
                      ),
                    );
                  },
                  id: 'updateUI',
                ),
              ],
            ).withPadding(
                left: 15.w,
                right: 12.w
            ),


            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  Image(
                    image: 'ic_search_left'.png3x,
                    width: 20.w,
                    height: 20.w,
                    color: const Color(0xffaeaeae),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(child: TextFieldWidget(
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14.sp),
                    hintStyle: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14.sp,
                    ),
                    hintText: '输入关键字搜索',
                  ))
                ],
              ).withContainer(
                  height: 34.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.all(Radius.circular(20.w))
                  ),
                  margin: EdgeInsets.only(right: 15.w)
              ),)
          ],
        ).withContainer(height: 45.w, width: 1.sw, color: Colors.white),

        Expanded(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Image(image: 'bg_fxzl'.png3x,fit: BoxFit.fitWidth,),
          ],
        ))
      ],
    );
  }
}
