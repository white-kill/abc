import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../../utils/abc_button.dart';
import '../../../other/sheet_widget/picker.dart';
import '../export_result/export_result_view.dart';
import '../transfer_accounts/card_transfer/conmponent/transfer_password_widget.dart';
import 'alter_content.dart';
import 'details_export_logic.dart';
import 'details_export_state.dart';
import 'details_password.dart';

class DetailsContentWidget extends StatefulWidget {
  const DetailsContentWidget({super.key});

  @override
  State<DetailsContentWidget> createState() => _DetailsContentWidgetState();
}

class _DetailsContentWidgetState extends State<DetailsContentWidget> {
  final DetailsExportLogic logic = Get.put(DetailsExportLogic());
  final DetailsExportState state = Get.find<DetailsExportLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 8.w),
        Container(
          width: 1.sw,
          height: 91.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w, right: 12.w),
          child: Column(
            children: [
              _itemWidget(
                      title: '账户', content: AppConfig.config.abcLogic.card())
                  .withOnTap(onTap: () {
                AlterPickerTime.showDataPick(
                  context,
                  dataList: [AppConfig.config.abcLogic.card()],
                  onConfirm: (List v) {},
                );
              }),
              Container(width: 360.w, height: 1.w, color: Color(0xffD5D5D5)),
              _itemWidget(title: '币种', content: '人民币 | 本币').withOnTap(
                  onTap: () {
                AlterPickerTime.showDataPick(
                  context,
                  dataList: ['人民币 | 本币'],
                  onConfirm: (List v) {},
                );
              }),
            ],
          ),
        ),
        SizedBox(height: 10.w),

        GetBuilder(
          builder: (DetailsExportLogic c) {
            return Container(
              width: 1.sw,
              height: 140.w,
              color: Colors.white,
              padding: EdgeInsets.only(left: 15.w, right: 12.w),
              child: Column(
                children: [
                  _itemWidget(title: '时间跨度', child: _changeWidget()),
                  Container(width: 360.w, height: 1.w, color: Color(0xffD5D5D5)),

                  _itemWidget(title: '起始日期', content: state.beginTime)
                      .withOnTap(onTap: () {
                    AbcPicker.showNewTime(
                      title: '',
                      initialDateTime: DateFormat('yyyy-MM-dd').parse(state.beginTime),
                        onDateTimeChanged: (data){
                          state.beginTime = DateFormat('yyyy-MM-dd').format(data);
                          logic.update(['updateTime']);
                        }
                    );
                  }),
                  Container(width: 360.w, height: 1.w, color: Color(0xffD5D5D5)),
                  _itemWidget(
                    title: '结束日期',
                    content: state.endTime,
                  ).withOnTap(onTap: () {
                    AbcPicker.showNewTime(
                        title: '',
                        initialDateTime: DateFormat('yyyy-MM-dd').parse(state.endTime),
                        onDateTimeChanged: (data){
                          state.endTime = DateFormat('yyyy-MM-dd').format(data);
                          logic.update(['updateTime']);
                        }
                    );
                  }),
                ],
              ),
            );
          },
          id: 'updateTime',
        ),
        SizedBox(height: 10.w),
        Container(
          width: 1.sw,
          height: 45.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w, right: 12.w),
          child: Column(
            children: [
              _itemWidget(
                  title: '邮箱',
                  child: Container(
                    width: 280.w,
                    height: 45.w,
                    child: TextFieldWidget(
                      controller: state.emailTextController,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16.sp),
                      hintStyle: TextStyle(
                        color: Color(0xffC4C4C4),
                        fontSize: 16.sp,
                      ),
                      hintText: '请输入接收邮箱',
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(height: 30.w),
        AbcButton(
          title: '确定',
          width: 344.w,
          height: 45.w,
          titleColor: Colors.white,
          bgColor: Color(0xffF8A82F),
          radius: 2,
          fontSize: 18,
          onTap: () {
            if(!logic.isValidEmail(state.emailTextController.text)){
              '请输入正确的邮箱'.showToast;
              return;
            }

            AlterWidget.alterWidget(builder: (context){
              return AlterContent();
            });

            // logic.print();
          },
        ).withPadding(left: 15.w, right: 15.w),
        SizedBox(height: 10.w),
        BaseText(
          maxLines: 20,
          text: '温馨提示:\n'
              '1.当前仅支持导出活期账户交易明细，单次最多支持5千条交易明细导出，请合理设置时间跨度。\n'
              '2.交易明细涉及您的个人隐私，收件人仅限本人。\n'
              '3.时间跨度不能超过1年。',
          style: TextStyle(color: Color(0xff666666), fontSize: 14.sp),
        ).withPadding(left: 15.w, right: 15.w),
      ],
    );
  }

  Widget _changeWidget() {
    return Obx(() => Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 75.w,
              height: 27.w,
              decoration: BoxDecoration(
                  color:
                      logic.isThreeM.value ? Color(0xffF8A82F) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.w),
                    bottomLeft: Radius.circular(15.w),
                  ),
                  border: logic.isThreeM.value
                      ? null
                      : Border.all(color: Color(0xffC7C7C7), width: 1.w)),
              child: BaseText(
                text: '三个月',
                color: logic.isThreeM.value ? Colors.white : Color(0xffC4C4C4),
              ),
            ).withOnTap(onTap: () {
              logic.isThreeM.value = true;
              state.beginTime = state.getDateMonthsAgo(3);
              logic.update(['updateTime']);
            }),
            Container(
              alignment: Alignment.center,
              width: 75.w,
              height: 27.w,
              decoration: BoxDecoration(
                  color:
                      logic.isThreeM.value ? Colors.white : Color(0xffF8A82F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.w),
                    bottomRight: Radius.circular(15.w),
                  ),
                  border: logic.isThreeM.value
                      ? Border.all(color: Color(0xffC7C7C7), width: 1.w)
                      : null),
              child: BaseText(
                text: '近半年',
                color: !logic.isThreeM.value ? Colors.white : Color(0xffC4C4C4),
              ),
            ).withOnTap(onTap: () {
              logic.isThreeM.value = false;
              state.beginTime = state.getDateMonthsAgo(6);
              logic.update(['updateTime']);
            }),
          ],
        ));
  }

  Widget _itemWidget({String title = '', String content = '', Widget? child}) {
    return Container(
      height: 45.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: title, color: Color(0xff333333), fontSize: 16.sp),
          Row(
            children: [
              child ??
                  BaseText(
                    text: content,
                    color: Color(0xff6D6D6D),
                    fontSize: 16.sp,
                  ),
              child == null
                  ? Image(
                      image: 'ic_jt_bottom'.png3x,
                      width: 25.w,
                      height: 25.w,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
