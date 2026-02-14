import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import 'export_result_logic.dart';
import 'export_result_state.dart';

class ExportResultPage extends BaseStateless {
  ExportResultPage({Key? key}) : super(key: key,title: '操作结果');

  final ExportResultLogic logic = Get.put(ExportResultLogic());
  final ExportResultState state = Get.find<ExportResultLogic>().state;


@override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 45.w,),
            Image(image: 'ic_dc_jg'.png3x,fit: BoxFit.fitWidth,),

            SizedBox(height: 45.w,),
            BaseText(
              maxLines: 20,
              text:'明细文件将在24小时内发送至邮箱${Get.arguments?['email']??''}，'
                  '请在申请记录查询中查看文件解压密码。'
                  '稍后文件解压密码也将以短信形式发送至您的掌银登录手机号，请您注意查收。',
              style: TextStyle(color: Color(0xff666666), fontSize: 16.sp),
            ).withPadding(left: 15.w, right: 15.w),
          ],
        )),

        Container(
          padding: EdgeInsets.only(left: 12.w,right: 12.w,
          bottom: ScreenUtil().bottomBarHeight + 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: 'ic_dc_tag1'.png3x,width: 167.w,height: 48.w,).withOnTap(onTap: (){
                Get.offAndToNamed(Routes.exportRecordPage);
              }),
              Image(image: 'ic_dc_tag2'.png3x,width: 167.w,height: 48.w,).withOnTap(onTap: (){
                Get.back();
                Get.back();
              }),
            ],
          ),
        )
      ],
    );
  }
}
