import 'package:flutter_test_bx_truong/src/string.dart';
import 'package:logger/logger.dart';

class ValidateForm {
  static String validate({String value, String hint, String password}) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (value.isEmpty) {
      return 'Không được để trống $hint';
    } else if (value.length < 6) {
      return '$hint không được ngắn hơn 6 ký tự';
    } else if (!validCharacters.hasMatch(value)) {
      return '$hint không được chứa ký tự đặc biệt';
    } else if (hint == StringResource.Confirm_Password && password != value) {
      return 'Mật khẩu không trùng khớp';
    } else {
      return null;
    }
  }
}
