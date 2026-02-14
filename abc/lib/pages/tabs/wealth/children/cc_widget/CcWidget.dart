import 'package:abc/utils/screen_util.dart';
import 'package:abc/utils/stack_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

/// 持仓头
class CcWidget extends StatefulWidget {
  const CcWidget({super.key});

  @override
  State<CcWidget> createState() => _CcWidgetState();
}

class _CcWidgetState extends State<CcWidget> {
  bool eyeStatus = true;

  @override
  Widget build(BuildContext context) {
    final position = StackPosition(designWidth: 3870, designHeight: 1134, deviceWidth: screenWidth);
    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: 1134 / 3870 * screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cf_cc_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: position.getX(880),
            top: position.getY(320),
            child: InkWell(
              onTap: () {
                setState(() {
                  // 切换眼睛状态
                  eyeStatus = !eyeStatus;
                });
              },
              child: Container(
                child: eyeStatus
                    ? Image(
                        image: 'cf_eye_on'.png,
                        width: position.getWidth(200),
                        height: position.getHeight(100),
                      )
                    : Image(
                        image: 'cf_eye_close'.png,
                        width: position.getWidth(200),
                        height: position.getHeight(100),
                      ),
              ),
            )),
        if (eyeStatus)
          Positioned(
              left: position.getX(184),
              top: position.getY(614),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: position.getWidth(700), height: position.getHeight(240), child: Image(image: "cf_zero".png)), // cf_eye_on cf_eye_close cf_secret_dot
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "元",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'PingFang',
                      height: 1.0,
                    ),
                    strutStyle: StrutStyle(fontSize: 13.sp, height: 1.0, forceStrutHeight: true),
                  )
                ],
              ))
        else
          Positioned(
              left: position.getX(184),
              top: position.getY(700),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                    image: 'cf_secret_dot'.png,
                    width: position.getWidth(100),
                    height: position.getHeight(100),
                  ),
                  SizedBox(width: 5,),
                  Image(
                    image: 'cf_secret_dot'.png,
                    width: position.getWidth(100),
                    height: position.getHeight(100),
                  ),
                  SizedBox(width: 5,),

                  Image(
                    image: 'cf_secret_dot'.png,
                    width: position.getWidth(100),
                    height: position.getHeight(100),
                  ),
                  SizedBox(width: 5,),
                  Image(
                    image: 'cf_secret_dot'.png,
                    width: position.getWidth(100),
                    height: position.getHeight(100),
                  ),
                  SizedBox(width: 5,),
                  Image(
                    image: 'cf_secret_dot'.png,
                    width: position.getWidth(100),
                    height: position.getHeight(100),
                  ),
                ],
              )),
      ],
    );
  }
}
