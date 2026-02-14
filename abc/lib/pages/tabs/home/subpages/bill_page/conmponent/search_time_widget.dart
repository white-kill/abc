import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../other/sheet_widget/picker_widget.dart';
import '../detail_search/detail_search_logic.dart';
import '../detail_search/detail_search_state.dart';

class SearchTimeWidget extends StatefulWidget {
  const SearchTimeWidget({super.key});

  @override
  State<SearchTimeWidget> createState() => _SearchTimeWidgetState();
}

class _SearchTimeWidgetState extends State<SearchTimeWidget> {

  final DetailSearchLogic logic = Get.put(DetailSearchLogic());
  final DetailSearchState state = Get.find<DetailSearchLogic>().state;


  bool isDay = true;
  bool isBegin = true;

  @override
  void initState() {
    super.initState();
    isDay = state.isDay;
    WidgetsBinding.instance.addPostFrameCallback((v){
      if(isDay){
        DateFormat format = DateFormat('yyyy-MM');
        DateTime dateTime = format.parse(state.queryTime);
        state.pickerSearchNotifier.jumpTime(dateTime);
      }else {
        DateFormat format = DateFormat('yyyy-MM-dd');
        DateTime dateTime = format.parse(state.beginTime);
        state.pickerSearchNotifier.jumpTime(dateTime);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.w,
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 26.w,
            alignment: Alignment.center,
            color: Color(0xffF3AD3C).withOpacity(0.2),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '若查询时间为2021年一月之前，请',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '点击此处。',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xffF3AD3C),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.detailsQueryPage);
                      },
                  ),
                  TextSpan(
                    text: '跳转至明细',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 35.w,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseText(text: '月份选择',style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff333333),
                    ),),
                    SizedBox(height: 8.w,),
                    Container(
                      width: 65.w,
                      height: 6.w,
                      color: isDay?Color(0xffF3AD3C):null,
                    ),
                    SizedBox(height: 30.w,),
                  ],
                ).withOnTap(onTap: (){
                  isDay = true;
                  state.isTemDay = isDay;
                  state.pickerSearchNotifier.changeTimeType(false);
                  DateFormat format = DateFormat('yyyy-MM');
                  DateTime dateTime = format.parse(state.temQueryTime);
                  state.pickerSearchNotifier.jumpTime(dateTime);
                  setState(() {});
                }),

                SizedBox(width: 45.w,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseText(text: '自定义',style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff333333),
                    ),),
                    SizedBox(height: 8.w,),
                    Container(
                      width: 50.w,
                      height: 6.w,
                      color: isDay?null:Color(0xffF3AD3C),
                    ),
                    SizedBox(height: 30.w,),
                  ],
                ).withOnTap(onTap: (){
                  isDay = false;
                  state.isTemDay = isDay;
                  state.pickerSearchNotifier.changeTimeType(true);
                  DateFormat format = DateFormat('yyyy-MM-dd');
                  DateTime dateTime = format.parse(state.temBeginTime);
                  state.pickerSearchNotifier.jumpTime(dateTime);
                  setState(() {});
                }),
              ],
            ),
          ),

          isDay?SizedBox.shrink():Row(
            children: [
              Expanded(child: Container(
                height: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  border: Border.all(
                    color: isBegin?Color(0xffF3AD3C):Color(0xffcecece),
                    width: 1.w,
                  ),
                ),
                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                child: Row(
                  children: [
                    Expanded(child: BaseText(
                      fontSize: 14.sp,
                      text: state.temBeginTime,
                    ).withOnTap(onTap: (){
                      isBegin = true;
                      DateFormat format = DateFormat('yyyy-MM-dd');
                      DateTime dateTime = format.parse(state.temBeginTime);
                      state.pickerSearchNotifier.jumpTime(dateTime);
                      setState(() {});
                    })),
                    Image(image: 'arr_dow'.png3x,width: 8.w,height: 8.w,color: Colors.black,)
                  ],
                ),
              )),

              Container(
                width: 30.w,
                height: 0.5.w,
                color: Color(0xffdedede),
              ).withPadding(
                left: 8.w,right: 8.w,
              ),

              Expanded(child: Container(
                height: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                  border: Border.all(
                    color: !isBegin?Color(0xffF3AD3C):Color(0xffcecece),
                    width: 1.w,
                  ),
                ),
                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                child: Row(
                  children: [
                    Expanded(child: BaseText(
                      fontSize: 14.sp,
                      text: state.temEndTime,
                    ).withOnTap(onTap: (){
                      isBegin = false;
                      DateFormat format = DateFormat('yyyy-MM-dd');
                      DateTime dateTime = format.parse(state.temEndTime);
                      state.pickerSearchNotifier.jumpTime(dateTime);
                      setState(() {});
                    })),
                    Image(image: 'arr_dow'.png3x,width: 8.w,height: 8.w,color: Colors.black,)
                  ],
                ),
              )),
            ],
          ).withPadding(
              left: 15.w,right: 15.w,bottom: 45.w
          ),

          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: DateTimePicker(
                dateTimePickerNotifier: state.pickerSearchNotifier,
                lastYear: 4,
                showDay:false,
                onDateTimeChanged:(DateTime data){
                  var formatter1 = DateFormat('yyyy-MM');
                  if(isDay){
                    state.temQueryTime = formatter1.format(data);
                  }else {
                    var formatter = DateFormat('yyyy-MM-dd');
                    if(isBegin){
                      state.temBeginTime = formatter.format(data);
                      setState(() {});
                    }else {
                      state.temEndTime = formatter.format(data);
                      setState(() {});
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
