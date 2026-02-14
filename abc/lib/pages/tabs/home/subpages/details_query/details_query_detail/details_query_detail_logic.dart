import 'package:abc/pages/tabs/home/function_banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import '../../../../../../config/model/record_detail_model.dart';
import 'details_query_detail_state.dart';

class DetailsQueryDetailLogic extends GetxController {
  final DetailsQueryDetailState state = DetailsQueryDetailState();

  RecordDetailModel detailModel = RecordDetailModel();
  List titleList = [];
  @override
  void onInit() {
    super.onInit();

    detailModel = Get.arguments?['model'];
    titleList = detailModel.type == '1' ?state.titleNameList1:state.titleNameList;
    if(detailModel.oppositeBankName != ''){
      if(detailModel.type == '1'){
        titleList.insert(4,'付款银行');
      }else{
        titleList.insert(4,'收款银行');
      }
    }
    // getData();
  }


  Widget replaceAsterisksWithImages(String text, {Color color = Colors.black,double fontSize = 14}) {
    final parts = text.split('*');
    final spans = <InlineSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(
        text: parts[i],
        style: TextStyle(
            fontSize: fontSize.sp,
            color: color
        ),
      ));
      if (i != parts.length - 1) {
        spans.add(WidgetSpan(
          child: Image(
            image: 'ic_mine_xin'.png3x,
            width: 6.w,
            height: 6.w,
            color: color,
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


  String valueData(String title) {
    switch (title) {
      case '交易时间':
        return detailModel.transactionTime == ''?'---':detailModel.transactionTime;
      case '交易摘要':
        return detailModel.excerpt == ''?'---':detailModel.excerpt;
      case '付款方':
      case '收款方':
        return detailModel.oppositeName == ''?'---':detailModel.oppositeName;
      case '付款账户':
      case '收款账户':
        return detailModel.oppositeAccount == ''?'---':detailModel.oppositeAccount;
      case '交易类型':
        return detailModel.transactionType == ''?'---':detailModel.transactionType;
      case '付款银行':
      case '收款银行':
        return detailModel.oppositeBankName == ''?'---':detailModel.oppositeBankName;
      case '交易渠道':
        return detailModel.transactionChannel == ''?'---':detailModel.transactionChannel;
      case '本次余额':
        return detailModel.accountBalance.bankBalance;
      case '交易附言':
        return detailModel.merchantBranch == ''?'---':detailModel.merchantBranch;
      default:
        return '';
    }
  }

  String formatString(String input) {
    if (input.isEmpty) return '';

    // 检查前缀
    if (input.length < 2) return input;

    final String prefix = input.substring(0, 2).toUpperCase();
    if (!['UA', 'NA', 'NG'].contains(prefix)) return input;

    // 匹配模式
    final RegExp pattern = RegExp(r'^([A-Za-z]{2})(\d+)([\u4e00-\u9fa5\-].*)$');
    final Match? match = pattern.firstMatch(input);

    if (match != null) {
      final String prefix = match.group(1)!;
      final String numbers = match.group(2)!;
      final String suffix = match.group(3)!;

      print('$prefix$numbers|$suffix');
      return '$prefix|$numbers|$suffix';
    }

    return input;
  }
  // void getData(){
  //
  //   Http.get(Apis.billInfo,queryParameters: {
  //     'id':state.id,
  //   }).then((v){
  //     detailModel = RecordDetailModel.fromJson(v);
  //     update(['updateUI']);
  //   });
  // }
}
