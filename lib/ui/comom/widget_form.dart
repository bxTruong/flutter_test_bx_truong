// import 'package:flutter/material.dart';
// import 'package:flutter_test_bx_truong/src/image.dart';
// import 'package:flutter_test_bx_truong/src/string.dart';
// import 'package:flutter_test_bx_truong/ui/comom/validate_form.dart';
// import 'package:flutter_test_bx_truong/ui/login/login_controller.dart';
// import 'package:flutter_test_bx_truong/ui/register/register_controller.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../main.dart';
//
// class WidgetForm {
//   static Widget logoApp() {
//     return imageAssetCustom(
//         resourceImage: ImageResource.Logo, width: 20.0.h, height: 20.0.h);
//   }
//
//   static Widget paddingCustom({
//     @required bool isSymmetric,
//     double vertical = 0,
//     double horizontal = 0,
//     double top = 0,
//     double right = 0,
//     double bottom = 0,
//     double left = 0,
//   }) {
//     return isSymmetric
//         ? Padding(
//             padding: EdgeInsets.symmetric(
//                 vertical: vertical, horizontal: horizontal))
//         : Padding(
//             padding: EdgeInsets.only(
//                 left: left, top: top, right: right, bottom: bottom));
//   }
//
//   static Widget textFormFieldCustom({
//     @required bool isLogin,
//     @required String hint,
//     @required String imageAsset,
//     @required BuildContext context,
//     LoginController loginController,
//     @required TextEditingController textEditingController,
//     bool obscureText = false,
//     RegisterController registerController,
//     String password
//   }) {
//     var node = FocusScope.of(context);
//     Logger().e('$password');
//     return TextFormField(
//       controller: textEditingController,
//       obscureText: obscureText,
//       style: TextStyle(fontSize: 14.sp, color: Color.fromRGBO(9, 180, 77, 1)),
//       decoration: InputDecoration(
//         hintText: hint,
//         suffixIcon: hint != StringResource.User_Name
//             ? IconButton(
//                 icon: Icon(
//                   obscureText ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   hint == StringResource.Password
//                       ? loginController.hiddenPassword()
//                       : registerController.hiddenConfirmPassword();
//                 },
//               )
//             : null,
//         prefixIcon: IntrinsicHeight(
//           child: Container(
//             width: 14.w,
//             child: Row(
//               children: [
//                 paddingCustom(isSymmetric: true, horizontal: 1.w),
//                 imageAssetCustom(
//                   resourceImage: imageAsset,
//                   width: 4.h,
//                   height: 4.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 1.5.h),
//                   child: VerticalDivider(
//                     color: Color.fromRGBO(9, 180, 77, 1),
//                     thickness: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(2.5.w),
//           borderSide:
//               BorderSide(color: Color.fromRGBO(9, 180, 77, 1), width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(2.5.w),
//           borderSide:
//               BorderSide(color: Color.fromRGBO(9, 180, 77, 1), width: 2),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       keyboardType: TextInputType.text,
//       validator: (value) => ValidateForm.validate(
//         value: value,
//         hint: hint,
//         password: password
//       ),
//       maxLines: 1,
//       textInputAction: isLogin
//           ? hint == StringResource.Password
//               ? TextInputAction.go
//               : TextInputAction.next
//           : hint == StringResource.Confirm_Password
//               ? TextInputAction.go
//               : TextInputAction.next,
//       onEditingComplete: () => isLogin
//           ? hint == StringResource.User_Name
//               ? node.nextFocus()
//               : null
//           : hint == StringResource.Password
//               ? node.nextFocus()
//               : node.nextFocus(),
//       onFieldSubmitted: (_) => isLogin
//           ? hint == StringResource.Password
//               ? node.unfocus()
//               : null
//           : hint == StringResource.Confirm_Password
//               ? node.unfocus()
//               : null,
//       onChanged: (value) {
//         if(hint==StringResource.Password&&registerController!=null){
//           value=registerController.password;
//         }
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
//
//   static Widget forgotPassword() {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Text(
//         StringResource.Forgot_Password,
//         style: TextStyle(
//           fontSize: 12.sp,
//           decoration: TextDecoration.underline,
//           color: Color.fromRGBO(114, 119, 116, 1),
//         ),
//         textAlign: TextAlign.end,
//       ),
//     );
//   }
//
//   static Widget btnLoginAndRegister() {
//     return Row(
//       children: [
//         buttonCustom(
//             titleButton: StringResource.Login,
//             color: Color.fromRGBO(7, 128, 254, 1),
//             method: ''),
//         paddingCustom(isSymmetric: true, horizontal: 2.0.w),
//         buttonCustom(
//             titleButton: StringResource.Register,
//             color: Color.fromRGBO(9, 180, 77, 1),
//             method: 'openRegisterPage')
//       ],
//     );
//   }
//
//   static Widget btnRegisterAndBack() {
//     return Row(
//       children: [
//         buttonCustom(
//             titleButton: StringResource.Register,
//             color: Color.fromRGBO(7, 128, 254, 1),
//             method: ''),
//         paddingCustom(isSymmetric: true, horizontal: 2.0.w),
//         buttonCustom(
//             titleButton: StringResource.Back,
//             color: Color.fromRGBO(114, 119, 116, 1),
//             method: 'popupLoginPage')
//       ],
//     );
//   }
//
//   static Widget buttonCustom(
//       {@required String titleButton, Color color, @required String method}) {
//     return Expanded(
//       child: ElevatedButton(
//         style: styleButton(color: color),
//         onPressed: () {
//           if (method == 'openRegisterPage') {
//             Get.toNamed(Routes.registerPage);
//           } else if (method == 'popupLoginPage') {
//             Get.back();
//           } else {
//             print('logina');
//           }
//         },
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.0.w),
//           child: Text(
//             titleButton,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 14.sp,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Widget orLogin() {
//     return Text(
//       StringResource.OrLogin,
//       style: TextStyle(color: Color.fromRGBO(7, 128, 254, 1), fontSize: 13.sp),
//     );
//   }
//
//   static Widget otherLogin() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//       child: Row(
//         children: [
//           otherLoginItem(imageAsset: ImageResource.Logo),
//           paddingCustom(isSymmetric: true, horizontal: 2.0.w),
//           otherLoginItem(imageAsset: ImageResource.Ic_Google, padding: 1.5.h),
//           paddingCustom(isSymmetric: true, horizontal: 2.0.w),
//           otherLoginItem(imageAsset: ImageResource.Ic_Facebook, padding: 1.5.h),
//         ],
//       ),
//     );
//   }
//
//   static Widget otherLoginItem({@required imageAsset, double padding = 0}) {
//     return Expanded(
//       child: InkWell(
//         onTap: () {
//           print('tap');
//         },
//         child: ClipOval(
//           child: Container(
//             padding: EdgeInsets.all(padding),
//             width: 10.0.h,
//             height: 10.0.h,
//             color: Colors.white,
//             child: imageAssetCustom(resourceImage: imageAsset),
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Widget imageAssetCustom(
//       {@required resourceImage, double width = 0, double height = 0}) {
//     return Image.asset(
//       resourceImage,
//       width: width,
//       height: height,
//       fit: BoxFit.contain,
//     );
//   }
//
//   static ButtonStyle styleButton({Color color}) {
//     return ButtonStyle(
//       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18.0.w),
//       )),
//       elevation: MaterialStateProperty.all(2),
//       backgroundColor: MaterialStateProperty.all(color),
//       overlayColor: MaterialStateProperty.resolveWith<Color>(
//         (Set<MaterialState> states) {
//           if (states.contains(MaterialState.focused) ||
//               states.contains(MaterialState.pressed)) return Colors.orange;
//           return null; // Defer to the widget's default.
//         },
//       ),
//     );
//   }
// }
