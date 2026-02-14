import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/model/export_record_model.dart';
import 'export_record_logic.dart';
import 'export_record_state.dart';

class ExportRecordPage extends BaseStateless {
  ExportRecordPage({Key? key}) : super(key: key,title: '申请记录');

  final ExportRecordLogic logic = Get.put(ExportRecordLogic());
  final ExportRecordState state = Get.find<ExportRecordLogic>().state;

  @override
  get refreshController => state.refreshController;

  @override
  void onLoading() {
    super.onLoading();
    state.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;

  @override
  Color? get background => Color(0xffF1F1F1);

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (ExportRecordLogic c) {
        return refreshWidget(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10.w),
                itemBuilder: (context, index) {

                  ExportRecordList recordModel = state.list[index];
                  return Container(
                    height: 278.w,
                    width: 1.sw,
                    padding: EdgeInsets.only(left: 15.w, right: 12.w),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _itemWidget(title: '当前状态', content: recordModel.status),
                        _itemWidget(title: '申请账户', content: recordModel.bankCard),
                        Container(
                          width: 360.w,
                          height: 1.w,
                          color: Color(0xffD5D5D5),
                        ).withPadding(
                            top: 4.w, bottom: 4.w
                        ),
                        _itemWidget(title: '账号币种', content: '人民币'),
                        _itemWidget(
                          title: '申请时间',
                          content: recordModel.createTime,
                        ),
                        _itemWidget(
                          title: '时间区间',
                          content: recordModel.dateTimeRange,
                        ),
                        _itemWidget(title: '解压码', content: recordModel.code),
                        _itemWidget(title: '接收邮箱', content: recordModel.email),
                      ],
                    ),
                  );
                },
                itemCount: state.list.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 1.sw,
                    height: 10.w,
                    color: Color(0xFFF1F1F1),
                  );
                }, //state.list.length,
              ),
            );
      },
      id: 'updateUI',
    );
  }

  Widget _itemWidget({String title = '', String content = ''}) {
    return Container(
      height: 38.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: title, color: Color(0xff333333), fontSize: 16),

          BaseText(text: content == ''?'--':content, color: Color(0xff333333), fontSize: 16),
        ],
      ),
    );
  }
}
