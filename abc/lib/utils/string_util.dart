abstract class StringUtil {

  /// 手机号中间显示星号
  /// [phone] 手机号字符串
  /// [start] 开始隐藏的位置（从0开始计数）
  /// [length] 隐藏的位数
  /// 返回格式化后的手机号，例如：138****8888
  static String maskPhoneNumber(String phone, {int start = 3, int length = 4}) {
    if (phone.isEmpty || phone.length < start + length) {
      return phone;
    }
    
    String prefix = phone.substring(0, start);
    String suffix = phone.substring(start + length);
    String stars = '*' * length;
    
    return '$prefix$stars$suffix';
  }

  /// 手机号中间4位显示星号（默认方法）
  /// [phone] 手机号字符串
  /// 返回格式化后的手机号，例如：138****8888
  static String maskPhone(String phone) {
    return maskPhoneNumber(phone, start: 3, length: 4);
  }

}