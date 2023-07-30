import 'package:color_demo/controller/otp_controller.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getText(
                    title: otpTitle,
                    size: 22,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w700),
                ScreenSize.height(18),
                getText(
                    title: otpSubTitle,
                    size: 15,
                    fontFamily: LatoRegular,
                    color: ColorConstant.hintColor,
                    fontWeight: FontWeight.w400),
                ScreenSize.height(14),
                getText(
                    title: '+919999999999',
                    size: 20,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blueColor,
                    fontWeight: FontWeight.w400),
                ScreenSize.height(24),
                Pinput(
                  // validator: (s) {
                  //   return s == '2222' ? null : 'Pin is incorrect';
                  // },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                ScreenSize.height(14),
                Obx(
                  () => controller.counter.value != 0
                      ? RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: otpResend,
                                style: TextStyle(
                                  color: ColorConstant.hintColor,
                                  fontSize: AppFontSize.s15,
                                  fontFamily: LatoRegular,
                                ),
                              ),
                              TextSpan(
                                text: ' ${controller.counter.value}',
                                style: TextStyle(
                                  color: ColorConstant.blueColor,
                                  fontSize: AppFontSize.s16,
                                  fontFamily: LatoRegular,
                                ),
                              ),
                              TextSpan(
                                text: ' sec',
                                style: TextStyle(
                                  color: ColorConstant.blueColor,
                                  fontSize: AppFontSize.s16,
                                  fontFamily: LatoRegular,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Obx(() => InkWell(
                          onTap: () {
                            controller.startTimer();
                            // controller.resendOtpApiFunction(context);
                          },
                          child: Visibility(
                              visible: true,
                              child: controller.counter.value != 0
                                  ? Text(
                                      otpNotReceive,
                                      style: TextStyle(
                                        color: ColorConstant.hintColor,
                                        fontSize: AppFontSize.s14,
                                        fontFamily: LatoRegular,
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: otpNotReceive,
                                            style: TextStyle(
                                              color: ColorConstant.hintColor,
                                              fontSize: AppFontSize.s14,
                                              fontFamily: LatoRegular,
                                            ),
                                          ),
                                          TextSpan(
                                            text: otpResend2,
                                            style: TextStyle(
                                              color: ColorConstant.blueColor,
                                              fontSize: AppFontSize.s14,
                                              fontFamily: LatoRegular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: CustomBtn(
                      title: verification,
                      height: 45,
                      width: double.infinity,
                      onTap: () {
                        // Get.toNamed(AppRoutes.changePassword);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
