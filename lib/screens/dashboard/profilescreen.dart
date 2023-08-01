import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/profile_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorConstant.hintColor),
                    child: Image.asset(
                      AppImages.userIcon,
                      color: Colors.indigoAccent,
                      height: 35,
                      width: 28,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 26,
                      width: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ColorConstant.white),
                      child: Image.asset(
                        AppImages.cameraIcon,
                        height: 10,
                        width: 12,
                      ),
                    ),
                  )
                ],
              ),
              ScreenSize.height(10),
              getText(
                  title: 'John Doe',
                  size: AppFontSize.s20,
                  fontFamily: LatoRegular,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w500),
              ScreenSize.height(25),
              CustomTextfield(
                  hintText: etName,
                  controller: controller.numberController),
              ScreenSize.height(31),
              CustomTextfield(
                  hintText: etMobile,
                  controller: controller.numberController),
              ScreenSize.height(31),
              CustomTextfield(
                  hintText: etEmail,
                  controller: controller.numberController),
              ScreenSize.height(31),
              CustomBtn(
                  title: save,
                  height: 45,
                  width: double.infinity,
                  color: ColorConstant.blackColor,
                  onTap: () {
                    //Get.toNamed(AppRoutes.otp);
                  }),
              ScreenSize.height(21),
              GestureDetector(
                onTap: ()
                {

                },
                child: CustomBtn(
                    title: "Add Bank Details",
                    height: 45,
                    width: double.infinity,
                    color: ColorConstant.blackColor,
                    onTap: () {
                      Get.toNamed(AppRoutes.bankDetails);
                    }),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
