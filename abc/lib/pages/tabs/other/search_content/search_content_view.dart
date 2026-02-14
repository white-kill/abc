import 'package:abc/utils/abc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../home/placeholder_search_widget.dart';
import 'search_content_logic.dart';
import 'search_content_state.dart';

class SearchContentPage extends BaseStateless {
  SearchContentPage({Key? key}) : super(key: key);

  final SearchContentLogic logic = Get.put(SearchContentLogic());
  final SearchContentState state = Get.find<SearchContentLogic>().state;

  @override
  Widget? get titleWidget => PlaceholderSearchWidget(
    width: 294.w,
    contentList: [Get.arguments?['name'] ?? ''],
    textColor: Colors.black,
    bgColor: Color(0xffEAF2FD).withOpacity(0.4),
  );

  @override
  List<Widget>? get rightAction => [
    BaseText(text: '取消').withContainer(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 18.w, right: 20.w),
    ),
  ];

  Widget _spanText(String content, keyword) {
    print(content);
    print(keyword);
    return Text.rich(TextSpan(children: _highlightKeywords(content, keyword)));
  }

  List<TextSpan> _highlightKeywords(String text, String keyword) {
    List<TextSpan> spans = [];
    final pattern = RegExp(keyword);
    int lastEnd = 0;

    for (final match in pattern.allMatches(text)) {
      spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      spans.add(
        TextSpan(
          text: match.group(0),
          style: TextStyle(color: Color(0xff52B595), fontSize: 14.sp),
        ),
      );
      lastEnd = match.end;
    }
    // 添加剩余文本
    spans.add(TextSpan(text: text.substring(lastEnd)));
    return spans;
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: 1.sw,
          height: 295.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_content_top'.png3x,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AbcButton(
                title: state.tagNameMap[Get.arguments?['name'] ?? '明细']??'明细',
                width: 180.w,
                height: 35.w,
                bgColor: Color(0xffF5BD51),
                titleColor: Colors.white,
                onTap: () => logic.jumpPage(state.tagNameMap[Get.arguments?['name'] ?? '']),
              ).withPadding(left: 50.w, bottom: 100.w),
            ],
          ),
        ),

        Container(
          // height: 210.w,
          padding: EdgeInsets.only(bottom: 20.w),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: "功能",
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    children: [
                      BaseText(
                        text: '全部(22)',
                        color: Color(0xff686868),
                        fontSize: 14.sp,
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 25.w,
                        height: 25.w,
                      ),
                    ],
                  ),
                ],
              ).withPadding(left: 16.w, right: 10.w),

              SizedBox(height: 16.w),
              Container(
                width: 340.w,
                // height: 136.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.w),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.06),
                      blurRadius: 6,
                      spreadRadius: 0.5,
                      offset: const Offset(0, 0.5),
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    print(Get.arguments);
                    List<String>? nameList =
                        state.contentDat[Get.arguments?['name'] ?? '收支'];
                    return Container(
                      height: 45.w,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 14.w),
                      child: _spanText(
                        nameList?[index] ?? "",
                        Get.arguments?['name'] ?? '收支',
                      ),
                    ).withOnTap(onTap: () {
                      logic.jumpPage(nameList?[index] ?? "");
                    });
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: 1.sw,
                      height: 0.5.w,
                      margin: EdgeInsets.only(left: 15.w),
                      color: Color(0xffE9E9E9),
                    );
                  },
                  itemCount:
                      (state.contentDat[Get.arguments?['name'] ?? '明细'] ?? [])
                          .length,
                ),
              ),
            ],
          ),
        ),

        Image(image: 'bg_content_bottomn'.png3x, fit: BoxFit.fitWidth),

        SizedBox(height: ScreenUtil().statusBarHeight),
      ],
    );
  }
}
