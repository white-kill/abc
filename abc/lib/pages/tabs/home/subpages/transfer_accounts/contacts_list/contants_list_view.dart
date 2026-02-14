import 'package:abc/pages/tabs/home/subpages/transfer_accounts/contacts_list/add_contants/add_contants_view.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../placeholder_search_widget.dart';
import 'contants_list_logic.dart';
import 'contants_list_model.dart';
import 'contants_list_state.dart';

class ContactsListPage extends BaseStateless {
  ContactsListPage({Key? key}) : super(key: key,title:'转账伙伴管理');

  final ContactsListLogic logic = Get.put(ContactsListLogic());
  final ContactsListState state = Get.find<ContactsListLogic>().state;

  @override
  Color? get background => Color(0xffF7F7F7);

  Widget _changeWidget(){
    return Obx(() => Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 172.w,height: 32.w,
          decoration: BoxDecoration(
              color: logic.isOne.value?Color(0xffF8A82F):Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.w),
                bottomLeft:  Radius.circular(6.w),
              ),
              border: logic.isOne.value?null:Border.all(
                  color: Color(0xffF3AD3C),
                  width: 1.w
              )
          ),
          child: BaseText(text: '转出',color: logic.isOne.value?Colors.white:Color(0xffF3AD3C),),
        ).withOnTap(onTap: (){
          logic.isOne.value = true;
        }),
        Container(
          alignment: Alignment.center,
          width: 172.w,height: 32.w,
          decoration: BoxDecoration(
              color: logic.isOne.value?Colors.white:Color(0xffF8A82F),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6.w),
                bottomRight:  Radius.circular(6.w),
              ),
              border: logic.isOne.value?Border.all(
                  color: Color(0xffF3AD3C),
                  width: 1.w
              ):null
          ),
          child: BaseText(text: '转入',color: !logic.isOne.value?Colors.white:Color(0xffF3AD3C),),
        ).withOnTap(onTap: (){
          logic.isOne.value = false;
        }),
      ],
    ));
  }

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(builder: (ContactsListLogic c){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 12.w,),
                Container(
                  color: Colors.white,
                  width: 1.sw,
                  child:Column(
                    children: [
                      _changeWidget().withPadding(
                        left: 15.w,right: 15.w,
                      ),
                    ],
                  ) ,
                ),
                SizedBox(height: 20.w,),

                Container(
                  width: 345.w,
                  height:34.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      color:Color(0xffEAF2FD).withOpacity(0.4)),
                  padding: EdgeInsets.only(left: 10.w, right: 12.w),
                  child: Row(
                    children: [
                      Image(
                        image: 'ic_search_left'.png3x,
                        width: 20.w,
                        height: 20.w,
                        color:const Color(0xffC8C8C8),
                      ),
                      Expanded(child: TextFieldWidget(
                        hintText: '输入户名/账号/银行名称/手机号/标签/备注',
                        onSubmitted: (v){
                          logic.loadData(name: v);
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 16.w,),
                Container(
                  height:8.w,
                  color: const Color(0xFFF7F7F7),
                )
              ],
            ),
          ),
          Obx(() => logic.isOne.value?Container(
            height: 40.w,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add,color: Color(0xffF3AD3C),),
                BaseText(text: '添加转账伙伴',color: Color(0xffF3AD3C),fontSize: 14.sp,),
              ],
            ),
          ).withOnTap(onTap: (){
            Get.to(() => AddContactsPage())?.then((v){
              if(v =='1'){
                logic.loadData();
              };
            });
          }):SizedBox.shrink()),

          // if()
          Obx(() =>logic.isOne.value?(logic.contactList.isEmpty?Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(text: '温馨提示',style: TextStyle(
                        fontSize: 15.sp,
                        color: Color(0xff666666)
                    ),),
                    SizedBox(height: 2.w,),
                    BaseText(text: '“转出”转账伙伴是您近期转过账的收款账户信息。',style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff666666)
                    ),)
                  ],
                ).withPadding(
                  top: 25.w,left: 12.w
                ),

                Image(image: 'ic_lxr_1'.png3x),
              ],
            ),
          ) :Expanded(child: AzListView(
            data: logic.contactList,
            itemCount: logic.contactList.length,
            itemBuilder: (BuildContext context, int index) {
              ContactInfo model = logic.contactList[index];
              return _buildListItem(model);
            },
            susItemHeight: 32.w,
            susItemBuilder: (BuildContext context, int index) {
              ContactInfo model = logic.contactList[index];
              return getSusItem(context, model.getSuspensionTag(),
                  susHeight: 32.w);
            },
            indexBarData: SuspensionUtil.getTagIndexList(logic.contactList),
            indexBarOptions: const IndexBarOptions(
              needRebuild: true,
              selectTextStyle: TextStyle(
                  fontSize: 14, color: Color(0xff03B696), fontWeight: FontWeight.w500),
              selectItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
              indexHintWidth: 97,
              indexHintHeight: 97,
              indexHintAlignment: Alignment.centerRight,
              indexHintTextStyle: TextStyle(fontSize: 24.0, color: Color(0xff03B696)),
              indexHintOffset: Offset(-30, 0),
            ),
          ))):Expanded(child: ListView(
            children: [
              Image(image: 'ic_222222'.png3x)
            ],
          )))

        ],
      );
    },id: 'updateUI',);
  }

  Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40})
  {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        tag,
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }




  Widget _buildListItem(ContactInfo model) {
    
    return Row(
      children: [

        NetImageWidget(url: model.icon,width: 32.w,height: 32.w,).withPadding(
          right: 12.w
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(text: model.name,fontSize: 15.sp,),
            SizedBox(height: 4.w,),
           Row(
             children: [
               BaseText(text: model.bankName,fontSize: 13.sp,color: const Color(0xff666666),).withContainer(
                 width: 180.w
               ),
               BaseText(text: '（${model.bankCard.maskBankCardNumber()}）',fontSize: 13.sp,color: Color(0xff666666),)
             ],
           )
          ],
        )
      ],
    ).withContainer(
        constraints: BoxConstraints(
          minHeight: 55.w,
        ),
      padding: EdgeInsets.all( 12.w)
    ).withOnTap(onTap: (){
      Get.back(
          result: {
            'icon':model.icon,
            'bankName':model.bankName,
            'id':model.bankId,
            'name':model.name,
            'bankCard':model.bankCard,
          }
      );
    });
  }

}
