import 'package:abc/pages/tabs/home/subpages/bill_page/conmponent/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/sp_util.dart';
import 'detail_search_logic.dart';
import 'detail_search_state.dart';

class DetailSearchPage extends BaseStateless {
  DetailSearchPage({Key? key}) : super(key: key, title: '收支搜索');

  final DetailSearchLogic logic = Get.put(DetailSearchLogic());
  final DetailSearchState state = Get.find<DetailSearchLogic>().state;

  @override
  Color? get navColor => Colors.white;

  @override
  Color? get titleColor => Colors.black;

  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(builder: (DetailSearchLogic c) {
      return Column(
        children: [
          TextFieldWidget(
            hintText: '请输入关键字',
            controller: state.textController,
            hintStyle: TextStyle(
              fontSize: 13.sp,
              color: Color(0xff7F7F7F),
            ),
            onSubmitted: (e) {
              List<String> searchList = searchHistoryValue.split(',');
              if (!searchList.contains(e)) {
                searchList.add(e);
              }
              searchList.join(',').saveSearchHistory;
              logic.update(['updateUI']);
            },
          ).withContainer(
            width: 345.w,
            height: 35.w,
            padding: EdgeInsets.only(left: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(20.w)),
            ),
          ),

          Expanded(child:
          state.textController.text ==''?
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              BaseText(
                text: '常用搜索',
                style: TextStyle(fontSize: 15.w),
              ).withPadding(left: 16.w, top: 24.w),
              SizedBox(
                height: 10.w,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 24.w,
                runSpacing: 20.w,
                children: state.nameList.map((e) {
                  return Container(
                    padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 4.w,bottom: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      color: Color(0xff7F7F7F).withOpacity(0.1),
                    ),
                    child: BaseText(
                      text: e,
                      fontSize: 13.w,
                    ).withOnTap(onTap: () {
                      List<String> searchList = searchHistoryValue.split(',');
                      if (!searchList.contains(e)) {
                        searchList.add(e);
                      }
                      searchList.join(',').saveSearchHistory;
                      state.textController.text = e;
                      logic.update(['updateUI']);
                    }),
                  );
                }).toList(),
              ).withPadding(
                left: 25.w,
                right: 35.w,
              ),

              searchHistoryValue == ''?SizedBox.shrink()
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: '历史搜索',
                    style: TextStyle(fontSize: 15.w),
                  ),

                ],
              ).withPadding(left: 16.w, top: 24.w),
              searchHistoryValue == ''?SizedBox.shrink()
                  : SizedBox(
                height: 10.w,
              ),

              searchHistoryValue == ''?SizedBox.shrink()
                  : ListView.separated(
                padding: EdgeInsets.only(left: 12.w,right: 12.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  List<String> data = searchHistoryValue.split(RegExp(r',+')).where((s) => s.isNotEmpty).toList();
                  return Row(
                    children: [
                      Image(image: 'icon_search'.png3x,width: 18.w,height: 18.w,color: Colors.grey,),
                      SizedBox(width: 6.w,),
                      BaseText(text: data[index]),
                    ],
                  ).withContainer(
                    height: 40.w
                  ).withOnTap(onTap: (){
                    state.textController.text = data[index];
                    logic.update(['updateUI']);
                  });
                },
                itemCount: (searchHistoryValue.split(RegExp(r',+')).where((s) => s.isNotEmpty).toList()).length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 1.sw,
                    height: 0.5.w,
                    margin: EdgeInsets.only(left: 15.w),
                    color: Color(0xffE9E9E9),
                  );
                }, //state.list.length,
              ),

              searchHistoryValue == ''?SizedBox.shrink()
                  : Container(
                padding: EdgeInsets.only(top: 12.w),
                height: 28.w,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_outline,size: 20.w,color: Colors.grey,),
                    BaseText(text: '清空历史搜索',fontSize: 11.sp,color: Color(0xff333333),),
                  ],
                ),
              ).withOnTap(onTap: (){
                ''.saveSearchHistory;
                logic.update(['updateUI']);
              }),
            ],
          )
              :FilterPage(
            controller: state.controller,
            keyword: state.textController.text,)

          )
        ],
      );
    },id: 'updateUI',);
  }
}
