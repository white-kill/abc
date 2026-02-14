import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/details_query/component/details_query_top_widget.dart';
import 'package:abc/pages/tabs/home/subpages/details_query/details_query_detail/details_query_detail_view.dart';
import 'package:abc/utils/abc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../routes/app_pages.dart';
import '../../../other/customer/customer_view.dart';
import 'component/details_query_item.dart';
import 'details_query_logic.dart';
import 'details_query_state.dart';

class DetailsQueryPage extends BaseStateless {
  DetailsQueryPage({super.key}) : super(title: '明细查询');

  final DetailsQueryLogic logic = Get.put(DetailsQueryLogic());
  final DetailsQueryState state = Get.find<DetailsQueryLogic>().state;

  @override
  get refreshController => state.refreshController;
  
  
  @override
  List<Widget>? get rightAction => [
    Image(image: 'mingxi_right'.png3x,width: 20.w,height: 20.w,).withOnTap(onTap: (){
      Get.to(() => CustomerPage());
    }),
    SizedBox(width: 10.w,),
    Image(image: 'mingxi_dao'.png3x,width: 20.w,height: 20.w,).withOnTap(onTap: (){
      Get.toNamed(Routes.detailsExportPage);
    }).withPadding(top: 2.w),
    SizedBox(width: 16.w,),
  ];

  // @override
  // void onLoading() {
  //   super.onLoading();
  //   state.reqData.pageNum++;
  //   logic.getData();
  // }

  @override
  bool get enablePullDown => false;

  @override
  Color? get background => Color(0xffF1F1F1);
  

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        DetailsQueryTopWidget(),
        GetBuilder(
          builder: (DetailsQueryLogic c) {
            return Expanded(
              child: state.list.isEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 70.w),
                        Image(
                          image: 'ic_mx_no_data'.png3x,
                          width: 165.w,
                          height: 165.w,
                        ),
                      ],
                    )
                  : refreshWidget(
                      child: ListView.separated(
                        controller: state.controller,
                        itemBuilder: (context, index) {
                          return DetailsQueryItem(
                            model: state.list[index],
                          ).withOnTap(onTap: (){
                            Get.to(() => DetailsQueryDetailPage(),arguments: {
                              'model':state.list[index].billDetail,
                            });
                          });
                        },
                        itemCount: state.list.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 1.sw,
                            height: 0.5.w,
                            margin: EdgeInsets.only(left: 15.w),
                            color: Color(0xffE9E9E9),
                          );
                        }, //state.list.length,
                      ),
                    ),
            );
          },
          id: 'updateUI',
        ),
      ],
    );
  }
}
