import 'package:abc/pages/tabs/life/life_jf/children/view.dart';
import 'package:abc/pages/tabs/life/life_jf/gd/view.dart';
import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../config/abc_config/abc_logic.dart';
import 'life_jf_logic.dart';
import 'life_jf_state.dart';

class Life_jfPage extends BaseStateless {
  Life_jfPage({Key? key}) : super(key: key, title: '生活缴费');

  final Life_jfLogic logic = Get.put(Life_jfLogic());
  final Life_jfState state = Get.find<Life_jfLogic>().state;


  @override
  Color? get background => Colors.white;
  @override
  Widget initBody(BuildContext context) {
    
    StackPosition position = StackPosition(designWidth: 3240, designHeight: 3555, deviceWidth: screenWidth);
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                GetBuilder(
                  builder: (AbcLogic c) {
                    return Text(
                      c.memberInfo.city,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    );
                  },
                  id: 'updateUI',
                ),
                SizedBox(width: 2.w),
                Image(
                    width: 21.w,
                    height: 21.w,
                    image: 'location'.png3x,
                    color: Color(0xff333333)),
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
            Image(image: 'life_shjf_1'.png,fit: BoxFit.fitWidth,),
            Stack(
              children: [
                Image(image: 'life_shjf_2'.png,fit: BoxFit.fitWidth,),
                StackPositionGridWidget.custom(stackPosition: position, x: 385, y: 352, crossCount: 3, bottomMargin: 550, itemCount: 9, onItemTap: (index) {
                  if (index != 8) {
                    if (index == 3) index = 2;
                    Get.to(JfChildrenPage(index: index,));
                  }
                  else {
                    Get.to(JFMorePage());
                  }

                }).build()

              ],
            ),
            Image(image: 'life_shjf_3'.png,fit: BoxFit.fitWidth,),
          ],
        ))
      ],
    );
  }
}
