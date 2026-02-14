import 'package:abc/pages/tabs/other/search_content/search_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../home/placeholder_search_widget.dart';
import 'search_logic.dart';
import 'search_state.dart';

class SearchPage extends BaseStateless {
  SearchPage({Key? key}) : super(key: key);

  final SearchLogic logic = Get.put(SearchLogic());
  final SearchState state = Get.find<SearchLogic>().state;

  @override
  Widget? get titleWidget => Container(
    width: 294.w,
    height:34.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.w)),
        color:Color(0xffEAF2FD).withOpacity(0.4)),
    padding: EdgeInsets.only(left: 10.w, right: 12.w),
    child: Row(
      children: [
        Image(
          image: 'ic_search_left'.png3x,
          width: 20.w,
          height: 20.w,
          color:const Color(0xffC8C8C8),
        ),
        Expanded(child: TextFieldWidget(
          hintText: '个人信用报告',
          onSubmitted: (v){
            Get.to(() => SearchContentPage(),arguments: {
              'name':v,
            });
          },
        )),
      ],
    ),
  );


  @override
  List<Widget>? get rightAction => [
    BaseText(text: '取消').withContainer(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          left: 18.w,
          right: 20.w
      )
    )
  ];


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              '我的搜索',
            ),
            SizedBox(height: 18),
            Wrap(
              direction: Axis.horizontal,
              spacing: 12.w,
              runSpacing: 12.w,
              children: state.nameList.map((e) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical:6.w, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ).withOnTap(onTap: (){
                    Get.to(() => SearchContentPage(),arguments: {
                      'name':e,
                    });
                  }),
                );
              }).toList(),
            ),
          ],
        ).withPadding(
          left: 22.w,right: 10.w,bottom: 20.w,
        ),
        
        Image(image: 'bg_search_bottom'.png3x,fit: BoxFit.fitWidth,),

        SizedBox(height: ScreenUtil().statusBarHeight,)
      ],
    );
  }
}
