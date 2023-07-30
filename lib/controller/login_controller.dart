import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final checkBoxValue = false.obs;
  final passwordVisible = true.obs;

  @override
  void onInit() {
    SizeConfig().init();
    super.onInit();
  }

  void resetValues() {
    numberController.clear();
    passwordController.clear();
  }
}
