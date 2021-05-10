import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test_bx_truong/api/service.dart';

class LoginController extends GetxController {
  var isHiddenPS = true;
  String message;
  String message2;

  hiddenPassword() {
    isHiddenPS = !isHiddenPS;
    update();
  }

  Future<void> loginSKW({
    TextEditingController usernameController,
    TextEditingController passwordController,
    FocusScopeNode node,
  }) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    message = await Service.loginSKW(
        userName: usernameController.text.trim(),
        password: passwordController.text.trim(),
        deviceInfo: androidInfo.androidId);
    if (message != null) {
      ScaffoldMessenger.of(Get.context)
          .showSnackBar(SnackBar(content: Text(message)));
      if (message == 'SUCCESS') {
        node.unfocus();
        usernameController.text = '';
        passwordController.text = '';
        update();
      }
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
