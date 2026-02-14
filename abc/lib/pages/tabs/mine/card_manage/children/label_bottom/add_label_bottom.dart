import 'package:abc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class AddLabelBottom extends StatefulWidget {
  const AddLabelBottom({super.key});



  static show() {
    showModalBottomSheet(

        context: Get.context!,
        isScrollControlled: true,
        builder: (context) {
      return AddLabelBottom();
    });
  }

  @override
  State<AddLabelBottom> createState() => _AddLabelBottomState();
}

class _AddLabelBottomState extends State<AddLabelBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image(image: 'label_bottom_bg'.png,width: 1.sw, fit: BoxFit.fitWidth,),
          Positioned(
            left: 0,
              top: 50.w,
              child:
          SizedBox(
            height: 5616/3870 * screenWidth,
              width: screenWidth,
              child:
              Expanded(child: ListView(
                children: [
                  Image(image: 'label_bottom1'.png,width: 1.sw, fit: BoxFit.fitWidth,),
                  Image(image: 'label_bottom2'.png,width: 1.sw, fit: BoxFit.fitWidth,),
                  Image(image: 'label_bottom3'.png,width: 1.sw, fit: BoxFit.fitWidth,),
                  Image(image: 'label_bottom4'.png,width: 1.sw, fit: BoxFit.fitWidth,),
                  SizedBox(height: 50.w,)
                ],
              ))
          )
          )
        ],
      ),
    ).withOnTap(onTap: () {
      Get.back();
    });
  }
}
