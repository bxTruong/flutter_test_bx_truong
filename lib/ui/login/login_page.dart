import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_bx_truong/src/image.dart';
import 'package:flutter_test_bx_truong/src/my_colors.dart';
import 'package:flutter_test_bx_truong/src/string.dart';
import 'package:flutter_test_bx_truong/ui/comom/validate_form.dart';
import 'package:flutter_test_bx_truong/ui/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImageResource.Background),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.w,
                  ),
                  child: Column(
                    children: [
                      logoApp(),
                      paddingCustom(isSymmetric: true, vertical: 1.5.h),
                      textFormFieldCustom(
                        hint: StringResource.User_Name,
                        imageAsset: ImageResource.Ic_User,
                        context: context,
                        textEditingController: usernameController,
                      ),
                      paddingCustom(isSymmetric: true, vertical: 1.5.h),
                      GetBuilder(
                        init: LoginController(),
                        builder: (controller) {
                          return textFormFieldCustom(
                            hint: StringResource.Password,
                            imageAsset: ImageResource.Ic_Password,
                            context: context,
                            textEditingController: passwordController,
                          );
                        },
                      ),
                      paddingCustom(isSymmetric: true, vertical: 1.h),
                      forgotPassword(),
                      paddingCustom(isSymmetric: true, vertical: 1.h),
                      btnLoginAndRegister(context),
                      paddingCustom(isSymmetric: true, vertical: 1.h),
                      orLogin(),
                      paddingCustom(isSymmetric: true, vertical: 1.h),
                      otherLogin()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logoApp() {
    return imageAssetCustom(
        resourceImage: ImageResource.Logo, width: 20.0.h, height: 20.0.h);
  }

  Widget paddingCustom({
    @required bool isSymmetric,
    double vertical = 0,
    double horizontal = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return isSymmetric
        ? Padding(
            padding: EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal))
        : Padding(
            padding: EdgeInsets.only(
                left: left, top: top, right: right, bottom: bottom));
  }

  Widget textFormFieldCustom(
      {@required String hint,
      @required String imageAsset,
      @required BuildContext context,
      TextEditingController textEditingController}) {
    final node = FocusScope.of(context);
    return TextFormField(
      controller: textEditingController,
      obscureText:
          hint == StringResource.Password ? loginController.isHiddenPS : false,
      style: TextStyle(fontSize: 14.sp, color: MyColors.GreenCustom),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: hint == StringResource.Password
            ? IconButton(
                icon: Icon(
                  loginController.isHiddenPS
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  loginController.hiddenPassword();
                },
              )
            : null,
        prefixIcon: IntrinsicHeight(
          child: Container(
            width: 14.w,
            child: Row(
              children: [
                paddingCustom(isSymmetric: true, horizontal: 1.w),
                imageAssetCustom(
                  resourceImage: imageAsset,
                  width: 4.h,
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  child: VerticalDivider(
                    color: MyColors.GreenCustom,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.w),
          borderSide:
              BorderSide(color: MyColors.GreenCustom, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.5.w),
          borderSide:
              BorderSide(color: MyColors.GreenCustom, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) => ValidateForm.validate(value: value, hint: hint),
      maxLines: 1,
      textInputAction: hint == StringResource.User_Name
          ? TextInputAction.next
          : TextInputAction.go,
      onEditingComplete: () =>
          hint == StringResource.User_Name ? node.nextFocus() : null,
      onFieldSubmitted: (_) =>
          hint == StringResource.Password ? clickRegister(node) : null,
    );
  }

  Widget forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        StringResource.Forgot_Password,
        style: TextStyle(
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
          color: Color.fromRGBO(114, 119, 116, 1),
        ),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget btnLoginAndRegister(BuildContext context) {
    return Row(
      children: [
        buttonCustom(titleButton: StringResource.Login, context: context),
        paddingCustom(isSymmetric: true, horizontal: 2.0.w),
        buttonCustom(titleButton: StringResource.Register)
      ],
    );
  }

  Widget buttonCustom({@required String titleButton, BuildContext context}) {
    return Expanded(
      child: ElevatedButton(
        style: titleButton == StringResource.Register
            ? styleButton(isBlue: false)
            : styleButton(isBlue: true),
        onPressed: () {
          if (titleButton == StringResource.Register) {
            Get.toNamed(Routes.registerPage);
          } else {
            clickRegister(FocusScope.of(context));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
          child: Text(
            titleButton,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget orLogin() {
    return Text(
      StringResource.OrLogin,
      style: TextStyle(color:MyColors.BLueCustom, fontSize: 13.sp),
    );
  }

  Widget otherLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Row(
        children: [
          otherLoginItem(imageAsset: ImageResource.Logo),
          paddingCustom(isSymmetric: true, horizontal: 2.0.w),
          otherLoginItem(imageAsset: ImageResource.Ic_Google, padding: 1.5.h),
          paddingCustom(isSymmetric: true, horizontal: 2.0.w),
          otherLoginItem(imageAsset: ImageResource.Ic_Facebook, padding: 1.5.h),
        ],
      ),
    );
  }

  Widget otherLoginItem({@required imageAsset, double padding = 0}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          loginController.loginGuest();
        },
        child: ClipOval(
          child: Container(
            padding: EdgeInsets.all(padding),
            width: 10.0.h,
            height: 10.0.h,
            color: Colors.white,
            child: imageAssetCustom(resourceImage: imageAsset),
          ),
        ),
      ),
    );
  }

  Widget imageAssetCustom(
      {@required resourceImage, double width = 0, double height = 0}) {
    return Image.asset(
      resourceImage,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  ButtonStyle styleButton({bool isBlue}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0.w),
      )),
      elevation: MaterialStateProperty.all(2),
      backgroundColor: isBlue
          ? MaterialStateProperty.all(MyColors.BLueCustom)
          : MaterialStateProperty.all(MyColors.GreenCustom),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) return Colors.orange;
          return null; // Defer to the widget's default.
        },
      ),
    );
  }

  clickRegister(FocusScopeNode node) {
    if (_formKey.currentState.validate()) {
      loginController.loginSKW(
          usernameController: usernameController,
          passwordController: passwordController,
          node: node);
    }
  }
}
