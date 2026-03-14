import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/contacts_list/contants_list_view.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/transfer_record_view.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_setting/transfer_setting_view.dart';
import 'package:abc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../../../config/model/contacts_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../other/customer/customer_view.dart';
import 'transfer_accounts_logic.dart';
import 'transfer_accounts_state.dart';

class TransferAccountsPage extends BaseStateless {
  TransferAccountsPage({Key? key}) : super(key: key, title: '转账');

  final TransferAccountsLogic logic = Get.put(TransferAccountsLogic());
  final TransferAccountsState state = Get.find<TransferAccountsLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_home_customer'.png3x,
      width: 22.w,
      height: 22.w,
      color: Colors.black,
    ).withPadding(
      left: 0.w,
      right: 15.w,
    ).withOnTap(onTap: (){
      Get.to(() => CustomerPage());
    }),
  ];


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Container(
          width: 1.sw,
          height: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
            image: DecorationImage(
              image: 'bg_zz_top'.png3x,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 2.w),
              Container(
                width: 1.sw - 40.w,
                height: 100.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: 'icon_zhzz'.png3x,
                              width: 42.w,
                              height: 42.w,
                            ),
                            BaseText(
                              text: '账号转账',
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ).withOnTap(
                        onTap: () {
                          Get.toNamed(Routes.cardTransferPage);
                        },
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: 'icon_sjhzz'.png3x,
                              width: 42.w,
                              height: 42.w,
                            ),
                            BaseText(
                              text: '手机号转账',
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ).withOnTap(
                        onTap: () {
                          Get.toNamed(Routes.phoneTransferPage);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.w),
              Container(
                width: 1.sw - 40.w,
                height: 40.w,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: 'icon_jilu'.png3x,
                              width: 19.w,
                              height: 19.w,
                            ),
                            SizedBox(width: 6.w),
                            BaseText(
                              text: '转账记录',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ).withOnTap(
                        onTap: () {
                          Get.to(() => TransferRecordPage());
                        },
                      ),
                    ),

                    Expanded(
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: 'icon_zzshez'.png3x,
                              width: 19.w,
                              height: 19.w,
                            ),
                            SizedBox(width: 6.w),
                            BaseText(
                              text: '转账设置',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ).withOnTap(onTap: (){
                        Get.to(() => Transfer_settingPage());
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Obx(() => VerticalGridView(
          widgetBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: '${state.allDataList[index]['image']}'.png3x,
                  width: 27.w,
                  height: 27.h,
                ),
                SizedBox(height: 12.w),
                BaseText(
                  text: state.allDataList[index]['name'],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ).withOnTap(

              onTap: () {
                var text = state.allDataList[index]['name'];
                logic.jumpPage(text);
              },
            );
          },
          itemCount: logic.showAll.value?state.allDataList.length:4,
          crossCount: 4,
          mainHeight: 65.w,
          spacing: 5.w,
        ).withContainer(color: Colors.white,padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.w)),),

        Obx(
          () => Image(
            image:
                logic.showAll.value ? 'ic_jt_top'.png3x : 'ic_jt_bottom'.png3x,
            width: 25.w,
            height: 25.w,
          ).withOnTap(
            onTap: () {
              logic.showAll.value = !logic.showAll.value;
            },
          ),
        ),

        Container(height: 12.w, color: Color(0xFFF7F7F7)),

        Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: "最近转账 ・ 一点即转"),


                      BaseText(text: "全部转账伙伴", color: Color(0xff52B596)).withOnTap(
                        onTap: () {
                          Get.to(() => ContactsListPage())?.then((v){
                            if(v != null){
                              Get.toNamed(Routes.cardTransferPage,arguments: {
                                'cardInfo':v
                              });
                            }
                          });
                        },
                      ),


                    ],
                  ).withPadding(left: 20.w, right: 20.w, top: 18.w, bottom: 30.w),
                  Container(
                    height: 55.w,
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AppConfig.config.abcLogic.memberInfo.sex == '1'? 'abc_m'.png3x: 'abc_w'.png3x,
                              width: 38.w,
                              height: 38.w,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            BaseText(
                              text: AppConfig.config.abcLogic.memberInfo.realName,
                              color: Color(0xff333333),
                              fontSize: 17,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                          ],
                        ),
                        Container(
                          width: 25.w,
                          height: 18.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xFFCBCED5).withOpacity(0.2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.w))),
                          child: BaseText(
                            text: '1',
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [


                            Obx(() => AnimatedRotation(
                              turns: logic.isContactsExpanded.value ? 0.0 : 0.25,
                              duration: Duration(milliseconds: 100),
                              child: Image(
                                image: 'ic_jt_right'.png3x,
                                width: 24.w,
                                height: 24.w,
                              ).withPadding(left: 2.w).withOnTap(onTap: () {
                                logic.isContactsExpanded.value = !logic.isContactsExpanded.value;
                              }),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 3.w,
                    color: Color(0xffF8F9FA),
                  ),

                  Container(
                    height: 60.w,
                    margin: EdgeInsets.only(left: 50.w),
                    child: Row(
                      children: [
                        netImage(url: 'http://img.chinajianse.com/bank/icon/ABC.png', width: 28.w, height: 28.w, radius: 19.w),
                        SizedBox(width: 8.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: AppConfig.config.abcLogic.bankName(),
                              color: Color(0xff333333),
                              fontSize: 16.sp,
                            ),
                            SizedBox(height: 6.w),
                            BaseText(
                              text: '(${AppConfig.config.abcLogic.card()})',
                              color: Color(0xff666666),
                              fontSize: 13.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Color(0xffE5E5E5),
                    width: 358.w,
                    height: 1.w,
                    margin: EdgeInsets.only(left: 17.w),
                  ),

                  GetBuilder(
                    builder: (TransferAccountsLogic c) {
                      return ListView.separated(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil().bottomBarHeight,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {

                          ContactsModel model = state.contactsModelList[index];
                          return Container(
                            height: 75.w,
                            margin: EdgeInsets.only(left: 17.w),
                            child: Row(
                              children: [
                                netImage(url: model.icon, width: 25.w, height: 25.w,radius: 15.w),

                                SizedBox(width: 8.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        BaseText(
                                          text: model.name,
                                          color: Color(0xff666666),
                                          fontSize: 16.sp,
                                        ),
                                        // BaseText(
                                        //   text: '2025-05-04',
                                        //   color: Color(0xff9E9E9E),
                                        //   fontSize: 12.sp,
                                        // ),
                                      ],
                                    ).withContainer(width: 300.w),

                                    SizedBox(height: 10.w),
                                    BaseText(
                                      text: '${model.bankName}(${model.bankCard.maskBankCardNumber()})',
                                      color: Color(0xff666666),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ).withOnTap(onTap: (){
                            Get.toNamed(Routes.cardTransferPage,arguments: {
                              'cardInfo':{
                                'bankCard':model.bankCard,
                                'icon':model.icon,
                                'bankName':model.bankName,
                                'name':model.name,
                                'id':model.bankId
                              }
                            });
                          });
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            color: Color(0xffE5E5E5),
                            width: 358.w,
                            height: 1.w,
                            margin: EdgeInsets.only(left: 17.w),
                          );
                        },
                        itemCount: state.contactsModelList.length,
                      );
                    },
                    id: 'updateBanList',
                  ),
                ],
              ),
            ),
            Positioned(top: 0.w,right: 16.w,child: Image(image: 'oc_nwe'.png3x,width: 38.w,height: 22.w,))
          ],
        ),
      ],
    );
  }
}
