import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/transfer_record_logic.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/transfer_record_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/abc_button.dart';
import '../../../../other/sheet_widget/picker.dart';

class FilterTimeWidget extends StatefulWidget {
  final FilterTimeWidgetDialogController controller;

  const FilterTimeWidget({super.key, required this.controller});

  @override
  State<FilterTimeWidget> createState() => _FilterTimeWidgetState();
}

class _FilterTimeWidgetState extends State<FilterTimeWidget>
    with TickerProviderStateMixin {
  List titleName = ['近一周', '近一月', '近三月', '自定义'];
  int selectIndex = 0;

  late Animation<double> animation;
  late AnimationController animationController;

  final TransferRecordLogic logic = Get.put(TransferRecordLogic());
  final TransferRecordState state = Get.find<TransferRecordLogic>().state;

  bool offstage = true;

  double animationHeight = 0;

  @override
  void dispose() {
    super.dispose();
    animationController.stop();
    animationController.dispose();
  }

  String temBeginTime = '';
  String temEndTime = '';

  @override
  void initState() {
    super.initState();

    animationHeight = 200.w;

    if(state.beginTime == ''){
      temBeginTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }else {
      temBeginTime = state.beginTime;
    }

    if(state.endTime == ''){
      temEndTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }else {
      temEndTime = state.endTime;
    }


    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this, // 使用正确的 vsync
    );
    animation =
        Tween(begin: 0.0, end: animationHeight).animate(animationController)
          ..addListener(() {
            if (animation.status == AnimationStatus.dismissed &&
                animation.value == 0.0) {
              offstage = true;
            } else {
              offstage = false;
            }

            setState(() {});
          });

    widget.controller.addListener(_onController);
  }

  _onController() {
    if (widget.controller.type == 'showDialog') {
      animationHeight = 200.w;
      animation =
          Tween(begin: 0.0, end: animationHeight).animate(animationController);
      animationController.forward();
      selectIndex = state.selectTagIndex;
    }

    if (widget.controller.type == 'disMiss') {
      animationController.reverse();
      state.selectTagIndex = selectIndex;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: offstage,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            offstage
                ? Container()
                : Container(
                    width: 1.sw,
                    height: 1.sh,
                    margin: EdgeInsets.only(top: 1.w),
                    color: const Color(0xff000000).withOpacity(
                        0.36 * (animation.value / animationHeight)),
                  ).withOnTap(onTap: () {
                    state.selectTagIndex = selectIndex;
                    animationController.reverse();
                  }),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                  height: 20.w,
                ),
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
                  widgetBuilder: (_, index) {
                    return AbcButton(
                      title: titleName[index],
                      bgColor: selectIndex == index
                          ? Colors.orangeAccent
                          : Colors.white,
                      titleColor:
                          selectIndex == index ? Colors.white : Colors.black,
                      border: Border.all(
                        color: selectIndex == index
                            ? Colors.orangeAccent
                            : Color(0xffcecece),
                        width: 1.w,
                      ),
                      onTap: () {
                        selectIndex = index;
                        state.selectTagIndex = selectIndex;
                        if (titleName[index] == '自定义') {
                        } else {
                          state.endTime = '';
                          state.beginTime = '';
                          temBeginTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
                          temEndTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
                          logic.update(['updateTitle']);
                          logic.changeTime();
                          animationController.reverse();
                        }
                        setState(() {});
                      },
                    );
                  },
                  itemCount: titleName.length,
                  crossCount: 3,
                  mainHeight: 30.w,
                  spacing: 15.w,
                ).withContainer(color: Colors.white),
                selectIndex == 3
                    ? Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 35.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.w)),
                              color: state.beginTime == ''
                                  ? Colors.white
                                  : Color(0xffE6AC4E).withOpacity(0.2),
                              border: Border.all(
                                color: Color(0xffcecece),
                                width: 0.5.w,
                              ),
                            ),
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Row(
                              children: [
                                Expanded(
                                    child: BaseText(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: state.beginTime == ''
                                        ? Colors.grey
                                        : Colors.orangeAccent,
                                  ),
                                  text: state.beginTime == ''
                                      ? '开始时间'
                                      : state.beginTime,
                                ).withOnTap(onTap: () {
                                  AbcPicker.showNewTime(
                                    title: '选择开始时间',
                                    initialDateTime: DateTime.parse(temBeginTime),
                                    onDateTimeChanged: (data) {
                                      // state.beginTime = DateFormat('yyyy-MM-dd').format(data);
                                      temBeginTime = DateFormat('yyyy-MM-dd').format(data);
                                    },
                                    sureCallBack: (){
                                      state.beginTime = temBeginTime;
                                      setState(() {});
                                      if(state.beginTime != '' && state.endTime != ''){
                                        logic.update(['updateTitle']);
                                        logic.zdyTime();
                                        animationController.reverse();
                                      }
                                    }
                                  );
                                })),
                                Image(
                                  image: 'arr_dow'.png3x,
                                  width: 8.w,
                                  height: 8.w,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )),
                          Container(
                            width: 28.w,
                            height: 0.5.w,
                            margin: EdgeInsets.only(left: 6.w, right: 6.w),
                            color: Color(0xffdedede),
                          ),
                          Expanded(
                              child: Container(
                            height: 35.w,
                            decoration: BoxDecoration(
                              color: state.endTime == ''
                                  ? Colors.white
                                  : Color(0xffE6AC4E).withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.w)),
                              border: Border.all(
                                color: Color(0xffcecece),
                                width: 0.5.w,
                              ),
                            ),
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Row(
                              children: [
                                Expanded(
                                    child: BaseText(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: state.endTime == ''
                                        ? Colors.grey
                                        : Colors.orangeAccent,
                                  ),
                                  text: state.endTime == ''
                                      ? '结束时间'
                                      : state.endTime,
                                ).withOnTap(onTap: () {
                                  AbcPicker.showNewTime(
                                      title: '选择结束时间',
                                      initialDateTime: DateTime.parse(temEndTime),
                                      onDateTimeChanged: (data) {
                                        // state.endTime = DateFormat('yyyy-MM-dd').format(data);
                                        temEndTime = DateFormat('yyyy-MM-dd').format(data);
                                        setState(() {});
                                      },
                                    sureCallBack: (){
                                      state.endTime = temEndTime;
                                      setState(() {});
                                      if(state.beginTime != '' && state.endTime != ''){
                                        logic.update(['updateTitle']);
                                        logic.zdyTime();
                                        animationController.reverse();
                                      }
                                    }
                                  );
                                })),
                                Image(
                                  image: 'arr_dow'.png3x,
                                  width: 8.w,
                                  height: 8.w,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )),
                        ],
                      ).withContainer(
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(top: 25.w, left: 12.w, right: 12.w))
                    : SizedBox.shrink(),
                Container(
                  height: 25.w,
                  color: Colors.white,
                ),
              ],
            ).withContainer(height: animation.value)
          ],
        ),
      ),
    );
  }
}

class FilterTimeWidgetDialogController extends ChangeNotifier {
  String type = 'disMiss';

  void disMiss() {
    type = 'disMiss';
    notifyListeners();
  }

  void showDialog() {
    type = 'showDialog';
    notifyListeners();
  }
}
