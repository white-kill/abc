import 'package:abc/pages/tabs/mine/login_setting/child/mima/view.dart';
import 'package:abc/pages/tabs/mine/pay_setting/children/xegl/view.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../card_manage/children/yhkgl_detail/children/szmrzh/view.dart';
import 'zz_setting_logic.dart';
import 'zz_setting_state.dart';

class Zz_settingPage extends BaseStateless {
  Zz_settingPage({Key? key}) : super(key: key,title: '转账设置');

  final Zz_settingLogic logic = Get.put(Zz_settingLogic());
  final Zz_settingState state = Get.find<Zz_settingLogic>().state;

  @override
  Widget initBody(BuildContext context) {
return ListView(
  padding: EdgeInsets.zero, // 取消ListView默认内边距
  children: [
    // 1. 面容ID支付/转账模块
    _buildFaceIDSection(),
    _buildDetail(),
    // 3. 默认付款账户
    _buildSettingTile('默认付款账户').withOnTap(onTap: () {
      Get.to(SzmrzhPage());
    }),
    _buildDivider(),
    // 4. 手机号收款设置
    _buildSettingTile('手机号收款设置').withOnTap(onTap: () {
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '错误提示',
        'image': 'cwts',
      });
    }),
    Container(
      height: 10.w,
      color: Colors.grey[50],
    ),
    // 5. 密码支付
    _buildSettingTile('密码支付').withOnTap(onTap: () {
      Get.to(MmzfPage());
    }),
    _buildDivider(),
    // 6. 限额管理
    _buildSettingTile('限额管理').withOnTap(onTap: () {
      Get.to(XeglPage());
    }),
  ],
);
  }

  Widget _buildDetail(){
    return Container(
      //间距
      padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 7.w,bottom: 9.w),
    color: Colors.grey[50], // 背景色（浅灰色，符合iOS）,
    height: 40.w,
    child: Text(
    '开通后，支付或转账时可验证人脸快速完成交易',
    style: TextStyle(
    fontSize: 12,
    color: Colors.grey[500], // 说明文字颜色（比原代码更浅，符合iOS）
    ),
    ),
    );
  }
  /// 构建面容ID支付模块（背景白色）
  Widget _buildFaceIDSection() {
    return Container(
      color: Colors.white, // 容器背景白色（确保与ListTile一致）
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题+iOS开关
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '面容ID支付/转账',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // 标题颜色（黑色，符合iOS）
                ),
              ),
              // iOS风格开关（关键修改）
              CupertinoSwitch(
                value: true,
                onChanged: (value) {
                },
                focusColor: Colors.green, // 激活时的thumb颜色（iOS绿色）
                trackColor: Colors.grey[300], // 未激活时的轨道颜色（浅灰色）
              ),
            ],
          ),
        ],
      ),
    );
  }
  /// 构建分割线（浅灰色，左右边距16，符合iOS）
  Widget _buildDivider() {
    return Container(
      // 使用 Container 包裹 Divider 确保布局正确
      color: Colors.white, // 背景色和列表项一致
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey[100], // 分割线颜色（更浅，符合iOS）
        indent: 16.w, // 使用 16.w 保证和其他布局单位一致
        endIndent: 16.w,
      ),
    );
  }

  /// 构建设置列表项（背景白色，iOS风格）
  Widget _buildSettingTile(String title) {
    return Container(
      height: 50.0.w, // 固定高度（iOS设置项标准高度）
      color: Colors.white, // 强制背景白色（覆盖所有区域）
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        contentPadding: EdgeInsets.symmetric(horizontal: 16), // 左右内边距（iOS标准）
        minVerticalPadding: 0, // 取消默认垂直Padding，让内容居中
        tileColor: Colors.transparent, // 让ListTile背景透明，使用Container的颜色
      ),
    );
  }
}
