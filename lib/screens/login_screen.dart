import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/login_controller.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 27, right: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getText(
                    title: 'Log in/ ',
                    size: 18,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w700),
                getText(
                    title: 'Sign up',
                    size: 18,
                    fontFamily: LatoRegular,
                    color: ColorConstant.lightBlueColor,
                    fontWeight: FontWeight.w700),
              ],
            ),
            ScreenSize.height(21),
            CustomTextfield(
                hintText: 'Mobile number',
                controller: controller.numberController),
            ScreenSize.height(60),
            CustomBtn(
                title: 'Continue',
                height: 40,
                width: double.infinity,
                onTap: () {
                  Get.toNamed(AppRoutes.otp);
                })
          ],
        ),
      ),
    );
  }
}
