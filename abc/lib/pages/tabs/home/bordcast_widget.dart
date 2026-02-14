import 'package:abc/routes/app_pages.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'package:wb_base_widget/text_widget/bank_text.dart';

class BordcastWidget extends StatefulWidget {
  BordcastWidget({Key? key}) : super(key: key);
  final List<String> contentList = [
    '降息“靴子”落地，最新解读',
    '商务部：前三季度中国外贸进口继续···',
    '中国农业银行服务价格标准（2024）',
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BordcastWidgetState();
  }
}

class _BordcastWidgetState extends State<BordcastWidget> {

  SwiperController swiper = SwiperController();
  int currentIndex = 0; // 当前轮播索引

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.fixedNavPage, arguments: {
          "title": "我的待办",
          "image": "my_deal",
        });
      },
      child: Column(
        children: [
          Container(
            width: 335.w,
            height: 0.5.w,
            color: Color(0xffCCC7C7),
          ),
          SizedBox(
            height: 27.w,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Image(image: 'icon_toutiao'.png3x, width: 42.w, height: 21.w),
              SizedBox(
                width: 5.w,
              ),
              Container(
                  width: 250.w,
                  height: 20.w,
                  color: Colors.white,
                  child: BaseText(
                    text: '快来试试智能提醒吧～',
                    fontSize: 14.w,
                    color: Colors.black,
                  )),
              Spacer(),
              Image(image: 'icon_arrow_black'.png3x, width: 15.w, height: 15.w),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          InkWell(
            onTap: () {
              print('当前索引: $currentIndex');
              if (currentIndex == 0) {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '文章详情',
                  'imageList': ['deal_0_1', 'deal_0_2', 'deal_0_3','deal_0_4', 'deal_0_5', 'deal_0_6',  'deal_0_7'],
                  'top':0,
                  'rightShare':true,
                });
              }
              else if (currentIndex == 1) {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '文章详情',
                  'image': 'deal_1',
                  'top':0,
                  'rightShare':true,
                });
              }
              else if (currentIndex == 2) {
                Get.toNamed(Routes.fixedNavPage, arguments: {
                  'title': '文章详情',
                  'imageList': ['deal_2_1','deal_2'],
                  'top':0,
                  'rightShare':true,
                });
              }
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Image(image: 'icon_daiban'.png3x, width: 42.w, height: 21.w),
                Container(
                  width: 250.w,
                  height: 20.w,
                  color: Colors.white,
                  child: Swiper(
                    scrollDirection: Axis.vertical,
                    controller: swiper,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5.w),
                        child: BaseText(
                          text: widget.contentList[index],
                          fontSize: 14.w,
                          color: Colors.black,
                        ),
                      );
                    },
                    itemCount: widget.contentList.length,
                    autoplay: widget.contentList.length > 1 ? true : false,
                    onIndexChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Spacer(),
                Image(image: 'icon_arrow_black'.png3x, width: 15.w, height: 15.w),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
        ],
      ).withContainer(
        height: 91.w,
      ),
    );
  }
}
