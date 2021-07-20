import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_bx_truong/ui/login/login_page.dart';
import 'package:flutter_test_bx_truong/ui/register/register_page.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return GetMaterialApp(
          initialRoute: Routes.loginPage,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          getPages: [
            GetPage(
              name: Routes.loginPage,
              page: () => LoginPage(),
            ),
            GetPage(
              name: Routes.registerPage,
              page: () => RegisterPage(),
            ),
          ],
        );
      },
    );
  }
}

class Routes {
  static const String loginPage = '/login';
  static const String registerPage = '/register';
}
