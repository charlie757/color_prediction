import 'dart:convert';

import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterController extends GetxController {
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final checkBoxValue = false.obs;
  final passwordVisible = true.obs;
  final isLoading = false.obs;
  final checkBoxValidation = false.obs;


  /*validation() {
    if (formKey.currentState!.validate()) {

    }
    else if (checkBoxValue.value == false) {
      checkBoxValidation.value = true;
    }
    else {
      checkBoxValidation.value = false;
      createAccountApiFunction();
    }
  }*/
  validation() async {
    if(formKey1.currentState!.validate()){
      createAccountApiFunction();
    }
  }


  createAccountApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "email": emailController.text.toString(),
      "mobile": numberController.text.toString(),
      "password": passwordController.text.toString(),
      "device_token": "test123123"
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.signUpUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      sendOtpApiFunction();
    }
    else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
      // errorSnackBar('Error', response['message']);
    }
  }

  void sendOtpApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "mobile": numberController.text.toString(),
      "type": "register",
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.otpUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['otpCode'].toString());
    }
    else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }
}
