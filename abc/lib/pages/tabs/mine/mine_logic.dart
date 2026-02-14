import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'mine_state.dart';

class MineLogic extends GetxController {
  var navActionColor = Colors.black.obs;

  var isOpen = true.obs;
  final MineState state = MineState();

  final ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Widget replaceAsterisksWithImages() {
    int count = 6;
    final spans = <InlineSpan>[];

    for (int i = 0; i < count; i++) {
      spans.add(WidgetSpan(
        child: Image(
          image: 'ic_mine_xin'.png3x,
          width: 8.w,
          height: 8.w,
          color: Color(0xff666666),
        ).withPadding(bottom: 4.w),
        alignment: PlaceholderAlignment.middle,
      ));
    }

    return Text.rich(
      maxLines: 10,
      textAlign: TextAlign.right,
      TextSpan(children: spans),
    );
  }

}
