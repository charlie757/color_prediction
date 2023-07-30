import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/login_controller.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(
                  title: 'Proceed with your',
                  size: AppFontSize.s20,
                  fontFamily: GochiHandRegular,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w800),
              ScreenSize.height(4),
              getText(
                  title: 'Login',
                  textAlign: TextAlign.start,
                  size: AppFontSize.s20,
                  fontFamily: LatoBlack,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w800),
              ScreenSize.height(21),
              CustomTextfield(
                  hintText: 'Mobile number',
                  controller: controller.numberController),
              ScreenSize.height(31),
              CustomTextfield(
                  hintText: 'Password',
                  isObscureText: controller.passwordVisible.value,
                  controller: controller.passwordController),
              ScreenSize.height(10),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPassword);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    getText(
                        textAlign: TextAlign.end,
                        title: 'Forget Password?',
                        size: AppFontSize.s14,
                        fontFamily: LatoRegular,
                        color: ColorConstant.lightBlueColor,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),
              ScreenSize.height(31),
              CustomBtn(
                  title: 'Continue',
                  height: 45,
                  width: double.infinity,
                  color: ColorConstant.blackColor,
                  onTap: () {
                    Get.toNamed(AppRoutes.otp);
                  }),
              ScreenSize.height(21),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.createAccount);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getText(
                        textAlign: TextAlign.end,
                        title: 'New User ?',
                        size: AppFontSize.s14,
                        fontFamily: LatoRegular,
                        color: ColorConstant.newUser,
                        fontWeight: FontWeight.w700),
                    ScreenSize.width(5),
                    getText(
                        textAlign: TextAlign.end,
                        title: 'Create Account',
                        size: AppFontSize.s14,
                        fontFamily: LatoRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
