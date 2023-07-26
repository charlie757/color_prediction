import 'package:color_demo/controller/splash_controller.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init();
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(splashTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorConstant.white,
                fontSize: 60,
                fontWeight: FontWeight.w400,
                fontFamily: GochiHandRegular,
              )),
        ));
  }
}
