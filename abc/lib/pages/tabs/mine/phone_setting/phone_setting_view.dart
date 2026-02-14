import 'package:abc/config/app_config.dart';
import 'package:abc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'phone_setting_logic.dart';
import 'phone_setting_state.dart';

class Phone_settingPage extends BaseStateless {
  Phone_settingPage({Key? key}) : super(key: key,title: '手机号管理');

  final Phone_settingLogic logic = Get.put(Phone_settingLogic());
  final Phone_settingState state = Get.find<Phone_settingLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10), // 页面内边距
      children: [
        _buildReservedPhoneModule(), // 银行预留手机号模块
        SizedBox(height: 12), // 模块间距
        _buildLoginPhoneModule(), // 掌银登录手机号模块
      ],
    );
  }
  /// 构建“银行预留手机号”模块（白色背景）
  Widget _buildReservedPhoneModule() {
    return Container(
      padding: EdgeInsets.all(16), // 模块内边距
      decoration: BoxDecoration(
        color: Colors.white, // 白色背景（核心要求）
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            blurRadius: 3,
            offset: Offset(0, 1), // 轻微阴影（区分模块与背景）
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
        children: [

          // 标题
          Text(
            '银行预留手机号',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6.w), // 标题与说明间距
          // 说明文字（灰色小字）
          Text(
            '您在开户时填写的手机号，用于获取短信验证码核实身份，请谨慎变更',
            style: TextStyle(
              fontSize: 12.w,
              color: Colors.grey[600],
              height: 1.4, // 行高（提升可读性）
            ),
          ),
          SizedBox(height: 12.w), // 说明与手机号间距
          // 手机号+状态标签（行布局）
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 两端对齐
            children: [
              // 手机号（隐藏中间四位）
              Text(
                AppConfig.config.abcLogic.memberInfo.phone.desensitize(prefixLen: 3, suffixLen: 3),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 24.w), // 手机号与标签间距
              // “已验证”标签（橙色背景）
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), // 保持原内边距
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 1), // 橙色边框（关键修改）
                    borderRadius: BorderRadius.circular(4), // 保持原圆角
                    // 去掉填充色（背景透明）
                  ),
                  child: Text(
                    '已验证',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange, // 文字改为橙色（与边框一致）
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建“掌银登录手机号”模块（白色背景）
  Widget _buildLoginPhoneModule() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // 白色背景（核心要求）
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Text(
            '掌银登录手机号',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6.w),
          // 说明文字
          Text(
            '最多可设置3个掌银登录手机号',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 12.w),
          // 当前登录手机号+状态标签
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConfig.config.abcLogic.memberInfo.phone.desensitize(prefixLen: 3, suffixLen: 3),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 24.w),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), // 保持原内边距
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 1), // 橙色边框（关键修改）
                    borderRadius: BorderRadius.circular(4), // 保持原圆角
                    // 去掉填充色（背景透明）
                  ),
                  child: Text(
                    '当前登录',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange, // 文字改为橙色（与边框一致）
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),
          // 添加新手机号按钮（可点击）
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.fixedNavPage, arguments: {
                'title': '登录手机号',
                'image': 'dlsjh',
              });
            },
            child: Row(
              children: [
                // 加号图标（橙色）
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.orange,
                  size: 20,
                ),
                SizedBox(width: 8), // 图标与文字间距
                // 按钮文字（橙色）
                Text(
                  '添加新手机号',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
