import 'package:color_demo/controller/otp_controller.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getText(
                title: 'OTP verification',
                size: 22,
                fontFamily: LatoRegular,
                color: ColorConstant.blackColor,
                fontWeight: FontWeight.w700)
          ],
        ),
      ),
    );
  }
}
