import 'package:abc/pages/tabs/home/function_banner_widget.dart';
import 'package:abc/pages/tabs/home/subpages/transfer_accounts/transfer_record/transfer_record_detail/progress/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../transfer_notice/transfer_notice_view.dart';
import 'transfer_record_detail_logic.dart';
import 'transfer_record_detail_state.dart';

class TransferRecordDetailPage extends BaseStateless {
  TransferRecordDetailPage({Key? key}) : super(key: key,title: '明细');

  final TransferRecordDetailLogic logic = Get.put(TransferRecordDetailLogic());
  final TransferRecordDetailState state = Get.find<TransferRecordDetailLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(builder: (TransferRecordDetailLogic c){
      return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120.w,
            width: 1.sw,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15.w,right: 17.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseText(text: '转给${logic.detailModel.oppositeName}',fontSize: 14.sp,color: Color(0xff333333),),
                BaseText(text: '-${logic.detailModel.amount.bankBalance}',style: TextStyle(
                  fontSize: 25.sp,color: Color(0xff333333),
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [

                Container(
                  height: 45.w,
                  padding: EdgeInsets.only(left: 15.w,right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.check_circle,color: Color(0xff03B696),size: 18.w,),
                          SizedBox(width: 4.w,),
                          BaseText(text: '交易成功',fontSize: 15.sp,color: Color(0xff686868),)
                        ],
                      ),

                      Row(
                        children: [
                          BaseText(text: '进度查询',fontSize: 15.sp,color: Color(0xff656565),),
                          SizedBox(width: 4.w,),
                          Image(image: 'ic_jt_right'.png3x,width: 22.w,height: 22.w,)

                        ],
                      ).withOnTap(onTap: (){
                        Get.to(() => ProgressPage(),arguments: {
                          'time':logic.detailModel.transactionTime,
                        });
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  color: Color(0xffD9D7D7),
                  height: 1.w,
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if(state.titleNameList[index] == ''){
                return Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.w,bottom: 10.w),
                  color: Color(0xffD9D7D7),
                  height: 1.w,
                );
              }
              return Container(
                padding: EdgeInsets.only(
                  top: 10.w,
                  bottom: 10.w,
                  left: 15.w,
                  right: 15.w,
                ),
                width: 1.sw,
                child: Row(
                  children: [
                    BaseText(
                      text: state.titleNameList[index],
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ).withContainer(width: 80.w),
                    Expanded(
                        child: BaseText(
                          text: logic.valueData(state.titleNameList[index]),
                          textAlign: TextAlign.end,
                          fontSize: 14.sp,
                          maxLines: 10,
                          color: Color(0xff6A6A6A),
                        ))
                  ],
                ),
              );
            },
            itemCount: state.titleNameList.length,
          ).withContainer(
            color: Colors.white,
            padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
          ),
          SizedBox(
            height: 10.w,
          ),

          Container(
            width: 1.sw,
            height: 45.w,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.w),
            child: BaseText(text: '查看和TA的转账记录'),
          ),

          SizedBox(height: 70.w,),
          Container(
            height: 45.w,
            width: 1.sw,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: 'ic_zzjl_xq'.png3x,
                )
            ),
            child: Column(
              children: [


                Row(
                  children: [

                    Expanded(child: Container(
                      height: 45.w,
                      width: 110.w,
                    ).withOnTap(onTap: (){
                      Get.toNamed(Routes.cardTransferPage,
                      //     arguments: {
                      //   'cardInfo':{
                      //     'bankCard':logic.detailModel.oppositeAccount,
                      //     'icon':logic.detailModel.icon,
                      //     'bankName':logic.detailModel.bankName,
                      //     'name':logic.detailModel.oppositeName,
                      //     'id':logic.detailModel.oppositeBankCard
                      //   }
                      // }
                      );
                    })),

                    SizedBox(width: 35.w,),
                    Expanded(child: SizedBox(
                      height: 45.w,
                      width: 110.w,
                    ).withOnTap(onTap: (){
                      Map<String,dynamic> transferInfo = {};
                      transferInfo['time'] = logic.detailModel.transactionTime;
                      transferInfo['name'] = logic.detailModel.oppositeName;
                      transferInfo['bankCard'] = logic.detailModel.oppositeAccount;
                      transferInfo['amount'] =logic.detailModel.amount;
                      transferInfo['purpose'] =  logic.detailModel.merchantBranch == ''?'---':logic.detailModel.merchantBranch;;
                      Get.to(() => Transfer_noticePage(),arguments: transferInfo);
                    })),

                  ],
                )

              ],
            ),
          )
        ],
      );
    },id: 'updateUI',);
  }
}
