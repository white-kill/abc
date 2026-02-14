import 'package:abc/routes/app_pages.dart';
import 'package:abc/utils/common_right_button.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  List list = ['index_1', 'index_2', 'index_3', 'index_4', 'index_5'];

  /// 构建分享按钮
  Widget _buildShareButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: CommonRightButton.build([
        RightButtonConfig(
          type: RightButtonType.share,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image(
            image: '${list[index]}'.png3x,
            width: 1.sw,
            fit: BoxFit.fitWidth,
          ).withOnTap(onTap: () {
            if (index == 0) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '岁末嘉年华集锦...',
                'image': 'index_1_view',
                'top': 0,
                'rightWidget': Row(
                  mainAxisSize: MainAxisSize.min,
                  children: CommonRightButton.build([
                    RightButtonConfig(
                      type: RightButtonType.share,
                      rightPadding: 12.w,
                    ),
                    RightButtonConfig(
                      type: RightButtonType.more,
                      rightPadding: 20.w,
                    ),
                  ]),
                ),
              });
            }
            else if (index == 1) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '哇宝年货节',
                'image': 'index_2_view',
                'top': 0,
                'rightWidget': _buildShareButton(),
              });
            }
            else if (index == 2) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '百亿积分加倍赠',
                'image': 'index_3_view',
                'top': 0,
                'rightWidget': _buildShareButton(),
              });
            }
            else if (index == 3) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '京东绑卡',
                'image': 'index_4_view',
                'top': 0,
                'rightWidget': _buildShareButton(),
              });
            }
            else if (index == 4) {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '农行首绑抖音支付',
                'image': 'index_5_view',
                'top': 0,
                'hideRightAction': true,
              });
            }

          });
        },
        itemCount: list.length,
        autoplay: true,
      ),
    );
  }
}
