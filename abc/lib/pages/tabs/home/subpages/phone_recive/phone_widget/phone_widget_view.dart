import 'package:abc/config/abc_config/abc_logic.dart';
import 'package:abc/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'phone_widget_logic.dart';
import 'phone_widget_state.dart';

class Phone_widgetPage extends BaseStateless {
  Phone_widgetPage({Key? key}) : super(key: key);
  final Phone_widgetLogic logic = Get.put(Phone_widgetLogic());
  final Phone_widgetState state = Get.find<Phone_widgetLogic>().state;
  // 状态变量：控制开关和复选框的选中状态
  bool _isDefaultAccount = true; // 默认账户开关（开启）
  bool _agreedProtocol = false; // 已阅读协议（未选中）
  bool _agreedAuthorization = true; // 同意授权（已选中）
  @override
  Widget? get titleWidget => Text('手机号收款设置',style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),);
  @override
  Widget initBody(BuildContext context) {
    return ListView(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 16.w,),
                const Text('选择收款账户', style: TextStyle(fontSize: 16)),
                Spacer(),
                DropdownButton<String>(
                  value: '6228****5235', // 当前选中值
                  items:  [
                    DropdownMenuItem<String>(
                      value: '6228****5235',
                      child: Text(AppConfig.config.abcLogic.card(), style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                  onChanged: (String? newValue) {}, // 选项变化回调（可扩展）
                  underline: Container(), // 去掉默认下划线
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.grey), // 下拉箭头
                ),
                SizedBox(width: 16.w,),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 48.w,
            width: ScreenUtil().screenWidth,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 16.w,),
                 Text('收款手机号码', style: TextStyle(fontSize: 16)),
                 Spacer(),
                 Text(AppConfig.config.abcLogic.memberInfo.phone.desensitize(), style: TextStyle(color: Colors.grey, fontSize: 16)),
                SizedBox(width: 16.w,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.w),
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 16.w,),
                const Text('设置为默认账户', style: TextStyle(fontSize: 16)),
               Spacer(),
                CupertinoSwitch(
                  value: _isDefaultAccount,
                  onChanged: (bool value) {
                    // setState(() {
                    //   _isDefaultAccount = value; // 更新状态
                    // });
                  },
                  activeColor: Color(0xff51B297), //
                ),
                SizedBox(width: 16.w,),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: Text(
              '开通手机号收款设置后，他人向您转账时，输入您的手机号，款项即可转入对应账户中。',
              style: TextStyle(
                color: Colors.grey, // 灰色（比默认更深）
                fontSize: 14,
              ),
            ),),
          const SizedBox(height: 24.0),
          // 5. 已阅读协议复选框（未选中）
          // CheckboxListTile(
          //   title: const Text(
          //     '我已阅读并同意《中国农业银行股份有限公司手机号码支付业务服务协议》',
          //     style: TextStyle(fontSize: 14),
          //   ),
          //   value: _agreedProtocol,
          //   onChanged: (bool? value) {
          //     // setState(() {
          //     //   _agreedProtocol = value ?? false; // 更新状态（防止null）
          //     // });
          //   },
          //   activeColor: Colors.green, // 选中时的颜色
          //   controlAffinity: ListTileControlAffinity.leading, // 复选框在文字左侧
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image(
              image:
              _agreedProtocol ? 'ic_f_se'.png3x : 'ic_f_un'.png3x,
              width: 17.w,
              height: 17.w,
            ).withPadding(
              top: 5.w,
            ),
            SizedBox(width: 10.w,),
            BaseText(text:    '我已阅读并同意《中国农业银行股份有限公司手机号码支付业务服务协议》',
              style: TextStyle(fontSize: 14),maxLines: 20,).withSizedBox(
                width: 1.sw - 60.w
            )
          ],),
          const SizedBox(height: 16.0),

          // 6. 同意授权复选框（已选中）


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image:
                _agreedAuthorization ? 'ic_f_se'.png3x : 'ic_f_un'.png3x,
                width: 17.w,
                height: 17.w,
              ).withPadding(
                top: 5.w,
              ),
              SizedBox(width: 10.w,),
              BaseText(text:'我同意授权中国农业银行将我的信息(包括姓名、身份证件类型、身份证件号码、银行账户、手机号)传输给中国人民银行',
                style: TextStyle(fontSize: 14),maxLines: 20,).withSizedBox(
                  width: 1.sw - 60.w
              )
            ],),

          // CheckboxListTile(
          //   title: const Text(
          //     '我同意授权中国农业银行将我的信息(包括姓名、身份证件类型、身份证件号码、银行账户、手机号)传输给中国人民银行',
          //     style: TextStyle(fontSize: 14),
          //   ),
          //   value: _agreedAuthorization,
          //   onChanged: (bool? value) {
          //     // setState(() {
          //     //   _agreedAuthorization = value ?? false;
          //     // });
          //   },
          //   activeColor: Colors.green,
          //   controlAffinity: ListTileControlAffinity.leading,
          // ),
          const SizedBox(height: 32.0),

          // 7. 浅黄色签约按钮（次要操作）

          Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: ElevatedButton(
              onPressed: () {
                // 按钮点击逻辑（示例：检查复选框状态）
                if (_agreedProtocol && _agreedAuthorization) {
                  // 执行签约操作（如调用接口）
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('签约成功！')),
                  );
                } else {
                  // 提示用户需同意协议和授权
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请先同意协议和授权')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF3D9), // 浅黄色（#FFF3D9）
                foregroundColor: const Color(0xFFFF9F00), // 橙色文字（#FF9F00）
                minimumSize: const Size(double.infinity, 48.0), // 占满宽度，高度48px
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // 圆角8px
                ),
              ),
              child: const Text('签约', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 16.0),
    Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
    child: ElevatedButton(
      onPressed: () {
        // 主要操作逻辑（如确认签约）
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF9F00), // 橙色（#FF9F00）
        foregroundColor: Colors.white, // 白色文字
        minimumSize: const Size(double.infinity, 48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text('签约', style: TextStyle(fontSize: 16)),
    ),
    ),

        ],
      );
  }
}
