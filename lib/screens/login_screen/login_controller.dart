import 'dart:convert';

import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';

class LoginController extends GetxController {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final checkBoxValue = false.obs;
  final passwordVisible = true.obs;
  final isLoading = false.obs;


  @override
  void onInit() {
    SizeConfig().init();
    super.onInit();
  }

  validation() async {
    if(formKey.currentState!.validate()){
      sendOtpApiFunction();
    }
  }

  void sendOtpApiFunction()async{
    isLoading.value=true;
    var body = json.encode({
      "mobile": numberController.text.toString(),
      "password": passwordController.text.toString(),
    });
    final response = await ApiConfig.post(body: body, url: ApiConfig.loginUrl, useAuthToken: false);
    isLoading.value=false;
    if(response!=null&&response['success']==true){
      EasyLoading.showToast(response['message'].toString(),toastPosition: EasyLoadingToastPosition.bottom);
     /* print(response['data']['_id']);
      Get.offAllNamed(AppRoutes.otp, parameters: {
        'number': numberController.text,
        'routes': 'login',
        'id':response['data']['_id']
      });*/
    }
    else{
      EasyLoading.showToast(response['message'].toString(),toastPosition: EasyLoadingToastPosition.bottom);
    }
  }

}
