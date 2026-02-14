import 'dart:convert';
import 'package:abc/pages/tabs/mine/card_manage/children/label_bottom/add_label_bottom.dart';
import 'package:abc/pages/tabs/mine/card_manage/children/scan_bank/view.dart';
import 'package:abc/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/camera_util.dart';
import '../../bank_list/bank_list_model.dart';
import 'add_back_list/add_back_list_view.dart';
import 'add_contants_logic.dart';
import 'add_contants_state.dart';

class AddContactsPage extends BaseStateless {
  AddContactsPage({Key? key}) : super(key: key, title: '添加转账伙伴');

  final AddContactsLogic logic = Get.put(AddContactsLogic());
  final AddContactsState state = Get.find<AddContactsLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (AddContactsLogic c) {
        return ListView.separated(
          itemBuilder: (context, index) {
            if (state.titleNames[index] == '') {
              return Container(
                height: 6.w,
              );
            }
            if (state.titleNames[index] == '备注') {
              return Container(
                height: 95.w,
                width: 1.sw,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    BaseText(
                      text: '备注',
                      fontSize: 15.sp,
                    ).withPadding(left: 15.w, right: 15.w),
                    TextFieldWidget(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14.sp),
                      hintStyle: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 14.sp,
                      ),
                      hintText: '记录点什么......',
                    ).withPadding(left: 15.w, right: 15.w),
                    Container(
                      height: 1.w,
                      width: 1.sw,
                      color: Color(0xFFF1F1F1),
                    )
                  ],
                ),
              );
            }
            if (state.titleNames[index] == 'bottom') {
              return Container(
                width: 340.w,
                height: 45.w,
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (state.controller1.text != '' &&
                          state.controller2.text != '' &&
                          logic.contactInfo.bankName != '')
                      ? Color(0xffF3AD3C)
                      : Color(0xffFBE7B8),
                  borderRadius: BorderRadius.all(Radius.circular(6.w)),
                ),
                child:
                    BaseText(text: "确定", color: Colors.white, fontSize: 14.sp),
              ).withOnTap(onTap: () {
                if((state.controller1.text != '' &&
                    state.controller2.text != '' &&
                    logic.contactInfo.bankName != '')){
                  List decodedList = [];
                  if(spContactList != ''){
                    decodedList = json.decode(spContactList);
                    decodedList.add(logic.contactInfo.toJson());
                    json.encode(decodedList).saveContactList;
                  }else {
                    decodedList.add(logic.contactInfo.toJson());
                    json.encode(decodedList).saveContactList;
                  }
                  Get.back(result:'1');
                }else{
                  '请填写必要信息'.showToast;
                }

              });
            }
            return Container(
              height: 40.w,
              color: Colors.white,
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: _itemWidget(state.titleNames[index],
                  child: _rightWidget(index)),
            ).withOnTap(onTap: () {
              if (state.titleNames[index] == "标签") {
                AddLabelBottom.show();
              }
            });
          },
          itemCount: state.titleNames.length,
          separatorBuilder: (context, index) => Container(
            height: 1.w,
            width: 1.sw,
            color: Color(0xFFF1F1F1),
          ),
        );
      },
      id: 'updateUI',
    );
  }

  Widget _rightWidget(int index) {
    Widget widget = Container();
    if (index == 0) {
      widget = Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                width: 80.w,
                height: 26.w,
                decoration: BoxDecoration(
                    color: logic.isOne.value ? Color(0xffF8A82F) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.w),
                      bottomLeft: Radius.circular(20.w),
                    ),
                    border: logic.isOne.value
                        ? null
                        : Border.all(color: Color(0xffF3AD3C), width: 1.w)),
                child: BaseText(
                  text: '银行转账',
                  color: logic.isOne.value ? Colors.white : Color(0xffF3AD3C),
                ),
              ).withOnTap(onTap: () {
                logic.isOne.value = true;
              }),
              Container(
                alignment: Alignment.center,
                width: 80.w,
                height: 26.w,
                decoration: BoxDecoration(
                    color: logic.isOne.value ? Colors.white : Color(0xffF8A82F),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.w),
                      bottomRight: Radius.circular(20.w),
                    ),
                    border: logic.isOne.value
                        ? Border.all(color: Color(0xffF3AD3C), width: 1.w)
                        : null),
                child: BaseText(
                  text: '手机号',
                  color: !logic.isOne.value ? Colors.white : Color(0xffF3AD3C),
                ),
              ).withOnTap(onTap: () {
                logic.isOne.value = false;
              }),
            ],
          ));
    }
    if (index == 2) {
      widget = TextFieldWidget(
        hintText: '请输入转账伙伴户名',
        controller: state.controller1,
        textAlign: TextAlign.end,
        onChanged: (v){
          logic.contactInfo.name = v;
        },
        onSubmitted: (v) {
          logic.update(['updateUI']);
        },
      );
    }
    if (index == 3) {
      widget = Row(
        children: [
          Expanded(
              child: TextFieldWidget(
            hintText: '请输入转账伙伴帐号',
            controller: state.controller2,
            textAlign: TextAlign.end,
            onChanged: (v){
              logic.contactInfo.bankCard = v;
            },
            onSubmitted: (v) {
              logic.update(['updateUI']);
            },
          )),
          SizedBox(
            width: 12.w,
          ),
          Image(
            image: 'ic_zz_zh'.png3x,
            width: 22.w,
            height: 22.w,
          ).withOnTap(onTap: (){
            CameraUtil.videoRequestCameraPermission().then((v){
              if(v){
                Get.to(ScanCardPage());
              }
            });
          })
        ],
      );
    }
    if (index == 4) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BaseText(
            text: logic.contactInfo.bankName == ''
                ? '请选择开户行'
                : logic.contactInfo.bankName,
            style: TextStyle(
                fontSize: 14.sp,
                color: logic.contactInfo.bankName == ''
                    ? Color(0xff7F7F7F)
                    : Colors.black),
          ),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 22.w,
            height: 22.w,
          )
        ],
      ).withOnTap(onTap: () {
        Get.to(() => Add_back_listPage())?.then((v) {
          if (v != null) {
            ContactInfo info = v as ContactInfo;
            logic.contactInfo.bankId = info.id;
            logic.contactInfo.bankName = info.name;
            logic.contactInfo.icon = info.icon;
            logic.update(['updateUI']);
          }
        });
      });
    }

    if (index == 6) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: TextFieldWidget(
            hintText: '(可选填)',
            textAlign: TextAlign.end,
          )),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 22.w,
            height: 22.w,
          )
        ],
      );
    }
    if (index == 7) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: TextFieldWidget(
            hintText: '(可选填)',
            textAlign: TextAlign.end,
          )),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 22.w,
            height: 22.w,
          )
        ],
      );
    }
    if (index == 8) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: TextFieldWidget(
            hintText: '(可选填)',
            textAlign: TextAlign.end,
          )),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 22.w,
            height: 22.w,
          )
        ],
      );
    }

    if (index == 10) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BaseText(
            text: '(可选填)',
            style: TextStyle(fontSize: 14.sp, color: Color(0xff7F7F7F)),
          ),
          Image(
            image: 'ic_jt_bottom'.png3x,
            width: 22.w,
            height: 22.w,
          )
        ],
      );
    }

    return Container(
      width: 1.sw - 100.w,
      height: 40.w,
      alignment: Alignment.centerRight,
      child: widget,
    );
  }

  Widget _itemWidget(
    String title, {
    required Widget child,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(
          text: title,
          fontSize: 14.sp,
        ),
        child
      ],
    );
  }
}
