import 'dart:io';

import 'package:abc/config/app_config.dart';
import 'package:abc/pages/tabs/mine/xiaodou/xiaodou_view.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/abc_config/abc_logic.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/screen_util.dart';
import '../../../../utils/sp_util.dart';
import '../mine_info/mine_info_view.dart';

class MineInfoWidget extends StatefulWidget {
  const MineInfoWidget({super.key});

  @override
  State<MineInfoWidget> createState() => _MineInfoWidgetState();
}

class _MineInfoWidgetState extends State<MineInfoWidget> {
  String _deviceModel = '';

  @override
  void initState() {
    super.initState();
    _getDeviceModel();
  }

  Future<void> _getDeviceModel() async {
    // 优先使用本地存储的自定义设备名称
    String localName = spDeviceName;
    if (localName.isNotEmpty) {
      _deviceModel = localName;
      if (mounted) setState(() {});
      return;
    }
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _deviceModel = androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _deviceModel = iosInfo.utsname.machine;
    }
    if (mounted) setState(() {});
  }

  void _showDeviceNameDialog() {
    final controller = TextEditingController(text: _deviceModel);
    Get.dialog(
      AlertDialog(
        title: const Text('设置设备名称'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '请输入设备名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                name.saveDeviceName;
                _deviceModel = name;
                setState(() {});
              }
              Get.back();
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  List titleName = ['银行卡', '小豆', '积分', '礼券'];


  void jumpPage(String name){
    if(name == '银行卡'){
      Get.toNamed(Routes.cardManagePage);
    }
    if(name == '积分'){
      Get.toNamed(Routes.pointsManagePage);
    }
    if(name == '礼券'){
      Get.toNamed(Routes.couponPage);
    }
    if(name == '小豆'){
      Get.to(() => XiaodouPage());
    }

  }

  String value(String name){
    if(name == '小豆'){
      return AppConfig.config.abcLogic.memberInfo.peas.toString();
    }
    if(name == '积分'){
      return AppConfig.config.abcLogic.memberInfo.points.toString();
    }
    if(name == '礼券'){
      return AppConfig.config.abcLogic.memberInfo.couponsNum.toString();
    }
    return '1';
  }

  String getLoginTimeDisplay(String loginTime) {
    try {
      // 将中文冒号替换为英文冒号
      String normalizedTime = loginTime.replaceAll('：', ':');
      // 解析日期时间
      DateTime dt = DateTime.parse(normalizedTime);
      // 格式化为 2026-02-09 15:55:05
      String y = dt.year.toString();
      String mo = dt.month.toString().padLeft(2, '0');
      String d = dt.day.toString().padLeft(2, '0');
      String h = dt.hour.toString().padLeft(2, '0');
      String mi = dt.minute.toString().padLeft(2, '0');
      String s = dt.second.toString().padLeft(2, '0');
      return '$y-$mo-$d $h:$mi:$s';
    } catch (e) {
      return loginTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return GetBuilder(
      builder: (AbcLogic c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onLongPress: _showDeviceNameDialog,
                      child: Container(
                        width: 60.w,
                        height: 60.w,
                        margin: EdgeInsets.only(left: 26.w, right: 14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                        ),
                        child: Image(
                          image: AppConfig.config.abcLogic.memberInfo.sex == '1'? 'abc_m'.png3x: 'abc_w'.png3x,
                          width: 60.w,
                          height: 60.w,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: 'ic_mine_xin'.png3x,
                                  width: 12,
                                  height: 12.w,
                                ).withPadding(
                                    right: 3.w
                                ),
                                BaseText(
                                  text: AppConfig.config.abcLogic.memberInfo.realName.removeFirstChar(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ).withOnTap(onTap: (){
                              Get.to(() => MineInfoPage());
                            }),
                          ],
                        ),

                        BaseText(
                          text: "上次登录  $_deviceModel",
                          fontSize: 12.sp,
                          color: const Color(0xff666666),
                        ),
                        SizedBox(height: 6.w,),
                        BaseText(
                          text: "${getLoginTimeDisplay(AppConfig.config.abcLogic.memberInfo.loginTime)}",
                          fontSize: 12.sp,
                          color: const Color(0xff666666),
                        ),]
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  padding: EdgeInsets.only(top: 15.w),
                  child: Image(
                    image: 'ic_mine_qy'.png3x,
                    // width: 90.w,
                    height: 34.w,
                  ).withOnTap(onTap: (){
                    Get.toNamed(Routes.gradeManagePage);
                  }),
                ),
              ],
            ),
            
            Container(
              margin: EdgeInsets.only(top: 20.w, left: 30.w, bottom: 10.w),
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: "ic_mine_level".png3x, width: 18.w,),
                  SizedBox(width: 10.w,),
                  Text("一星客户", style: TextStyle(
                    fontSize: 14.w,
                    color: Colors.black,
                    height: 1.0
                  ),),
                  Container(
                      margin: EdgeInsets.only(bottom: 1.w),
                      child: Image(image: 'right_arrow_yellow'.png3x, width: 15.w, color: Colors.grey,))
                ],
              ),
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.changeNavi, arguments: {
                'title': '星级专区',
                'navColor': Colors.white,
                'defTitleColor': Colors.white,
                'changeTitleColor': Colors.white,
                'backColor': Colors.white,
                
                'rightWidget': Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: 'share'.png,
                      width: 20.w,
                      height: 20.w,
                      color: Colors.white,
                    ).withPadding(right: 12.w).withOnTap(onTap: () {
                      // TODO: 分享逻辑
                    }),
                  ],
                ),
                'bodyWidget': _StarLevelPageViewContent(),
              });
            }),
            Container(
              alignment: Alignment.center,
              height: 84.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: 'bg_mine_tongji'.png3x,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: VerticalGridView(
                padding: EdgeInsets.only(left: 21.w, right: 21.w),
                widgetBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: value(titleName[index]),
                        fontSize: 18.sp,
                        color: Color(0xffE3D39D),
                      ),
                      SizedBox(height: 5.w,),
                      BaseText(
                        text: titleName[index],
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ],
                  ).withOnTap(onTap: () => jumpPage(titleName[index]));
                },
                itemCount: titleName.length,
              ),
            ),
          ],
        ).withContainer(
          padding: EdgeInsets.only(top: navHeight + 10.w),
        );
      },
      id: 'updateBalance',
    );
  }
}

/// 星级专区 PageView 内容，展示 level_1 到 level_9 图片，可左右切换
/// 使用 NotificationListener 吸收横向滑动产生的 ScrollNotification，避免触发顶部导航栏变色
class _StarLevelPageViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) => true, // 吸收滚动通知，防止 PageView 横向滑动触发导航栏变色
      child: SizedBox(
        height: screenWidth,
        child: PageView(
          children: List.generate(9, (index) {
            return Image(
              image: 'level_${index + 1}'.png3x,
              fit: BoxFit.contain,
              width: screenWidth,
            );
          }),
        ),
      ),
    );
  }
}
