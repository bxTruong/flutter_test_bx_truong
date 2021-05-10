import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_bx_truong/api/service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  String password;
  String confirmPassword;
  var isHiddenCFPS = true;
  String message;
  String message2;

  hiddenConfirmPassword() {
    isHiddenCFPS = !isHiddenCFPS;
    update();
  }

  Future<void> registerUser({
    TextEditingController usernameController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    FocusScopeNode node,
  }) async {
    message = await Service.userRegister(
        userName: usernameController.text.trim(),
        password: passwordController.text.trim());
    if (message != null) {
      ScaffoldMessenger.of(Get.context)
          .showSnackBar(SnackBar(content: Text(message)));
      update();
      node.unfocus();
      usernameController.text = '';
      passwordController.text = '';
      confirmPasswordController.text = '';
    }
  }

  Future<void> loginGuest() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    message2 = await Service.loginGuest(deviceInfo: androidInfo.androidId);
    if (message2 != null) {
      ScaffoldMessenger.of(Get.context)
          .showSnackBar(SnackBar(content: Text(message2)));
      update();
    }
  }
}
