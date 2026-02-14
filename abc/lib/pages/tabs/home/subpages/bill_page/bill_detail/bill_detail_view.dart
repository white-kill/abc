import 'package:abc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import 'bill_detail_cat.dart';
import 'bill_detail_logic.dart';
import 'bill_detail_state.dart';

class BillDetailPage extends BaseStateless {
  BillDetailPage({super.key}) : super(title: '收支详情');

  final BillDetailLogic logic = Get.put(BillDetailLogic());
  final BillDetailState state = Get.find<BillDetailLogic>().state;

  Widget replaceAsterisksWithImages(String text) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
            image: 'ic_mine_xin'.png3x,
            width: 6.w,
            height: 6.w,
          ).withPadding(bottom: 4.w),
          alignment: PlaceholderAlignment.middle,
        ));
      }
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (BillDetailLogic c) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1.sw - 85.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image(image: 'ic_test1'.png3x, width: 17.w, height: 17.w),
                        netImage(
                            url: logic.billDetail.categoryIcon,
                            width: 17.w,
                            height: 17.w),
                        SizedBox(
                          width: 4.w,
                        ),
                        Flexible(
                          child: BaseText(
                            text: logic.billDetail.excerpt2,
                            color: Color(0xff333333),
                            fontSize: 14.sp,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: logic.type(),
                          style: TextStyle(
                              fontSize: 28.sp, color: Colors.black, height: 1)),
                      TextSpan(
                          text: logic.billDetail.amount.bankBalance,
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w400,
                              height: 1)),
                    ]),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  BaseText(
                    text: '余额 ¥ ${logic.billDetail.accountBalance.bankBalance}',
                    color: Color(0xff666666),
                    fontSize: 13.sp,
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                ],
              ),
            ),
            Obx(() => ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            // constraints: BoxConstraints(
                            //   minHeight: 30.w,
                            // ),
                            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.w, bottom: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  text: logic.nameLis[index],
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Color(0Xff666666), fontSize: 15.sp,
                                  ),
                                ),
                                if (logic.nameLis[index] == '收款账户' ||
                                    logic.nameLis[index] == '交易卡号')
                                  replaceAsterisksWithImages(
                                          logic.valueName(logic.nameLis[index]))
                                      .withContainer(
                                    alignment: Alignment.centerRight,
                                    width: 250.w,
                                  ).withPadding(top: 2.w),
                                if (logic.nameLis[index] != '收款账户' &&
                                    logic.nameLis[index] != '交易卡号')
                                  BaseText(
                                    text: logic.valueName(logic.nameLis[index]),
                                    maxLines: 10,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      height: 1.45,
                                      fontSize: 15.sp,
                                    ),
                                  ).withSizedBox(width: 250.w)
                              ],
                            ),
                          );
                        },
                        itemCount: logic.showAll.value
                            ? logic.nameLis.length
                            : logic.nameLis.length - 2)
                    .withContainer(
                  color: Colors.white,
                )),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: logic.showAll.value ? '收起' : '查看更多',
                    color: Colors.orangeAccent,
                  ),
                  Image(
                    image: logic.showAll.value
                        ? 'ic_jt_top'.png3x
                        : 'ic_jt_bottom'.png3x,
                    width: 18.w,
                    height: 18.w,
                    color: Colors.orangeAccent,
                  )
                ],
              )
                  .withContainer(
                      height: 40.w,
                      width: 1.sw,
                      color: Colors.white,
                      alignment: Alignment.center)
                  .withOnTap(
                onTap: () {
                  logic.showAll.value = !logic.showAll.value;
                },
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Stack(
              children: [
                Container(
                  child: Image(
                    image: "shouzhi_detail_bottom".png,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                    top: 70.w,
                    right: 18.w,
                    child: Text(
                      logic.categoryText.value,
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0xFFC4C4C4)),
                    ))
              ],
            )
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return _item1Widget(state.nameLis1[index],
            //         child: _item1Right(index));
            //   },
            //   itemCount: state.nameLis1.length,
            //   separatorBuilder: (BuildContext context, int index) {
            //     return Container(
            //       width: 1.sw,
            //       height: 0.5.w,
            //       margin: EdgeInsets.only(left: 15.w),
            //       color: Color(0xffE9E9E9),
            //     );
            //   }, //state.list.length,
            // ),
            // SizedBox(height: 10.w,),
            // Container(
            //   height: 95.w,
            //   width: 1.sw,
            //   color: Colors.white,
            //   padding: EdgeInsets.only(left: 15.w, right: 15.w),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         height: 10.w,
            //       ),
            //       BaseText(
            //         text: '备注',
            //         fontSize: 15.sp,
            //       ),
            //       TextFieldWidget(
            //         textAlign: TextAlign.start,
            //         style: TextStyle(fontSize: 14.sp),
            //         hintStyle: TextStyle(
            //           color: Color(0xff999999),
            //           fontSize: 14.sp,
            //         ),
            //         hintText: '记录点什么......',
            //       ),
            //       Container(
            //         height: 1.w,
            //         width: 345.w,
            //         color: Color(0xffCCCCCC),
            //       ),
            //       // Container(
            //       //   width: 1.sw,
            //       //   height: 30.w,
            //       //   color: Colors.white,
            //       //   padding: EdgeInsets.only(top: 8.w),
            //       //   alignment: logic.billDetail.type == '1'?Alignment.topCenter:Alignment.topCenter,
            //       //   child: BaseText(text: logic.zdStr,color: Colors.orangeAccent,).withOnTap(onTap: (){
            //       //     Get.toNamed(Routes.cardTransferPage,arguments: {
            //       //       // 'cardInfo':{
            //       //       //   'bankCard':model.bankCard,
            //       //       //   'icon':model.icon,
            //       //       //   'bankName':model.bankName,
            //       //       //   'name':model.name,
            //       //       //   'id':model.bankId
            //       //       // }
            //       //     });
            //       //   }),
            //       // ),
            //     ],
            //   ),
            // ),

            // SizedBox(height: 25.w,)
          ],
        );
      },
      id: 'updateUI',
    );
  }

  Widget _item1Right(int index) {
    if (index == 0) {
      return Obx(() => CupertinoSwitch(
            value: logic.switchValue.value,
            onChanged: (bool value) {
              logic.switchValue.value = !logic.switchValue.value;
            },
            activeColor: Color(0xff51B297), // 自定义开启颜色
          ));
    }
    if (index == 1) {
      return Row(
        children: [
          Obx(() => BaseText(
                text: logic.categoryText.value,
                fontSize: 14.sp,
                color: Colors.black,
              )),
          Image(
            image: 'ic_jt_bottom'.png3x,
            width: 25.w,
            height: 25.w,
          )
        ],
      ).withOnTap(onTap: () {
        SheetBottom.show(
            showTopText: true,
            title: '选择类别',
            child: BillDetailCat(),
            sureCallBack: () {
              logic.categoryText.value = logic.temCategoryText;
            });
      });
    }
    if (index == 2) {
      return Row(
        children: [
          Obx(() => BaseText(
                text: logic.selTxt.value,
                fontSize: 14.sp,
                color: logic.selTxt.value == '请选择'
                    ? Color(0xff999999)
                    : Colors.black,
              )),
          Image(
            image: 'ic_jt_bottom'.png3x,
            width: 25.w,
            height: 25.w,
          )
        ],
      ).withOnTap(onTap: () {
        SheetBottom.show(
            showTopText: true,
            title: '',
            child: Container(
              height: 200.w,
              width: 1.sw,
              color: Colors.white,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(
                        text: state.subTextList[index],
                        fontSize: 15.sp,
                      ),
                      index == 0
                          ? Image(
                              image: logic.selTxt.value != '请选择'
                                  ? 'ic_f_se'.png3x
                                  : 'ic_f_un'.png3x,
                              width: 17.w,
                              height: 17.w,
                            )
                          : Icon(
                              Icons.add,
                              size: 25.w,
                              color: Color(0xff999999),
                            )
                    ],
                  )
                      .withContainer(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          height: 45.w)
                      .withOnTap(onTap: () {
                    if (index == 0) {
                      logic.selTxt.value = state.subTextList[index];
                      Get.back();
                    } else {
                      logic.selTxt.value = '请选择';
                      Get.back();
                      Get.toNamed(Routes.fixedNavPage, arguments: {
                        'title': '收支详情',
                        'image': 'bg_xjzb',
                        'top': 10
                      });
                    }
                  });
                },
                itemCount: state.subTextList.length,
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
            sureCallBack: () {});
      });
    }
    return Container();
  }

  Widget _item1Widget(
    String name, {
    required Widget child,
  }) {
    return Container(
      height: 45.w,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(
            text: name,
            fontSize: 15.sp,
          ),
          child,
        ],
      ),
    );
  }
}
