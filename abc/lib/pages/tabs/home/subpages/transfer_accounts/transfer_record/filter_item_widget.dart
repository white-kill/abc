import 'package:abc/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class FilterItemWidget extends StatefulWidget {
  final Function(int index) callBackIndex;
  final int selectIndex;
  const FilterItemWidget({super.key, required this.callBackIndex, required this.selectIndex});

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  List dataList = [
    {'image': 'ic_qbzh', 'title': '全部账户'},
    {
      'image': 'ic_tkjjk',
      'title': '借记卡(${AppConfig.config.abcLogic.cardFour()})'
    },
  ];

  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    selectIndex = widget.selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.w,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            height: 45.w,
            padding: EdgeInsets.only(left: 12.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: (dataList[index]['image'].toString()).png3x,
                      width: 24.w,
                      height: 24.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    BaseText(text: dataList[index]['title'])
                  ],
                ),
                Image(
                  image:
                      selectIndex == index ? 'ic_f_se'.png3x : 'ic_f_un'.png3x,
                  width: 17.w,
                  height: 17.w,
                )
              ],
            ),
          ).withOnTap(onTap: () {
            selectIndex = index;
            widget.callBackIndex(index);
            Get.back();
            setState(() {});
          });
        },
        itemCount: dataList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: 1.sw,
            height: 0.5.w,
            margin: EdgeInsets.only(left: 15.w),
            color: Color(0xffE9E9E9),
          );
        }, //state.list.length,
      ),
    );
  }
}
