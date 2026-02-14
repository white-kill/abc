import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class NhhcdPage extends BaseStateless {
  NhhcdPage({Key? key}) : super(key: key, title: "【充电优惠】铁塔充电，掌银扫码支付低至1分起");

  final NhhcdLogic logic = Get.put(NhhcdLogic());
  final NhhcdState state = Get.find<NhhcdLogic>().state;

  
  @override
  // TODO: implement bottomWidget
  Widget? get bottomWidget => Stack(
    children: [
      Image(image: "hcd_bottom".png),
      Positioned(
        top: 24.w,
        left: 55.w,
        child: GetBuilder(
          builder: (AbcLogic c) {
            return Container(
              width: 120.w,
              child: Text(
                "农行${c.memberInfo.city}分行微银行",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    height: 1.0,
                  letterSpacing: 1.w
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
          id: 'updateUI',
        ),)
    ],
  );
  
  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image(image: "hcd_1".png),
              Positioned(
                top: 89.w,
                left: 18.w,
                child: GetBuilder(
                  builder: (AbcLogic c) {
                    return Text(
                      "农行${c.memberInfo.city}分行微银行",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xFF5C708A),
                          height: 1.0
                      ),
                    );
                  },
                  id: 'updateUI',
                ),)
            ],
          ),
          Image(image: "hcd_2".png),
          Image(image: "hcd_3".png),
          Image(image: "hcd_4".png),
          Image(image: "hcd_5".png),
          Image(image: "hcd_6".png),
        ],
      ),
    );
  }
}
