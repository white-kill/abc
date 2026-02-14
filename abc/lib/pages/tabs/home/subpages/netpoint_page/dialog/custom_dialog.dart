import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  /// 显示自定义弹窗（iOS风格）
  ///
  /// 参数说明：
  /// [context] - 上下文
  /// [title] - 弹窗标题（必需）
  /// [content] - 弹窗内容（必需）
  /// [cancelText] - 取消按钮文本（默认"取消"）
  /// [confirmText] - 确认按钮文本（默认"确认"）
  /// [icon] - 图标（可选）
  /// [iconColor] - 图标颜色（可选）
  /// [confirmButtonColor] - 确认按钮颜色（可选）
  /// [titleStyle] - 标题文本样式（可选）
  /// [contentStyle] - 内容文本样式（可选）
  /// [onCancel] - 取消按钮回调（可选）
  /// [onConfirm] - 确认按钮回调（可选）
  /// [barrierDismissible] - 点击外部是否关闭（默认true）
  /// [width] - 弹窗宽度（可选，默认300）
  /// [height] - 弹窗高度（可选，默认自适应）
  /// [maxWidth] - 弹窗最大宽度（默认屏幕宽度的80%）
  /// [maxHeight] - 弹窗最大高度（默认屏幕高度的70%）
  static void show({
    required BuildContext context,
    required String title,
    required String content,
    String cancelText = '取消',
    String confirmText = '确认',
    IconData? icon,
    Color? iconColor,
    Color? confirmButtonColor,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
    double? width,
    double? height,
    double? maxWidth,
    double? maxHeight,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: width ?? 330.w,
              maxHeight: height ?? 170.w,
            ),
            width: width ?? 330.w, // 默认宽度330
            height: height, // 高度可选
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 内容区域
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 图标
                          if (icon != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Icon(
                                icon,
                                color: iconColor ?? Theme.of(context).primaryColor,
                                size: 36,
                              ),
                            ),

                          // 标题（居中）
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: titleStyle ?? TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),

                           SizedBox(height: 12),
                          // 内容（居中）
                          Text(
                            content,
                            textAlign: TextAlign.center,
                            style: contentStyle ?? TextStyle(
                              fontSize: 16.sp,
                              //height: 1.4,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 按钮区域（带分割线）
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 水平分割线
                    Container(
                      height: 0.5,
                      color: Theme.of(context).dividerColor,
                    ),

                    // 按钮行
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          // 取消按钮（左侧）
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                onCancel?.call();
                              },
                              style: TextButton.styleFrom(
                                padding:  EdgeInsets.symmetric(vertical: 16.w),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                              child: Text(
                                cancelText,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),

                          // 垂直分割线
                          Container(
                            width: 0.5,
                            color: Theme.of(context).dividerColor,
                          ),
                          // 确认按钮（右侧）
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                onConfirm?.call();
                              },
                              style: TextButton.styleFrom(
                                padding:  EdgeInsets.symmetric(vertical: 16.w),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                foregroundColor: confirmButtonColor ?? Colors.orange,
                              ),
                              child: Text(
                                confirmText,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: confirmButtonColor ?? Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}