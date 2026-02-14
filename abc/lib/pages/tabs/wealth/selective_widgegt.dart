import 'package:abc/routes/app_pages.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class SelectiveWidget extends StatefulWidget {
   SelectiveWidget({super.key});
  final List<String> contentList = [
    'mony_1',
    'mony_2'
  ];
  @override
  State<SelectiveWidget> createState() => _SelectiveWidgetState();
}

class _SelectiveWidgetState extends State<SelectiveWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270.w,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(
                left: (1.sw - (161.w + 159.w + 10.w)) * 0.5,
                top: 5.w,
                bottom: 16.w),
              child: BaseText(
                text: "财富热点",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Swiper(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 5.w),
                      child: Image(image: widget.contentList[index].png3x)
                    );
                  },
                  itemCount: widget.contentList.length,
                  autoplay: widget.contentList.length > 1 ? true : false,
                ).withContainer(
                  width: 159.w,
                  height: 189.w,
                ),
                // _containerBg(
                //   width: 159.w,
                //   height: 189.w,
                //   imagePath: 'mony_1',
                // ),

                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.w,bottom: 5.w),
                      child:  _containerBg(
                        width: 161.w,
                        height: 88.w,
                        imagePath: 'week_hot',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.w),
                      child: _containerBg(
                        width: 161.w,
                        height: 88.w,
                        fit: BoxFit.fitWidth,
                        imagePath: 'wealth_number',
                      ),
                    ),

                  ],
                )
              ],
            ),
          ],
        ),
      ).withOnTap(onTap: () {
        Get.toNamed(Routes.villageZixun, arguments: {"index":1});
    });
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
