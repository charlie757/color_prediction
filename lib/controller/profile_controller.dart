import 'dart:convert';
import 'package:color_demo/api/apiconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;


  @override
  void onInit() {
  //  gameApiFunction();
    userDetailApiFunction();
    super.onInit();
  }
  validation() {
    if (!formKey.currentState!.validate()) {
      updateUserProfileApiFunction();
    }
  }

  userDetailApiFunction() async {
    final response =
    await ApiConfig.get(url: ApiConfig.userDetailsUrl, useAuthToken: true);
    if (response != null && response['success'] == true) {
      print(response['user']);
      nameController.text=response['user']['name'] ?? "";
      emailController.text=response['user']['email'] ?? "";
      numberController.text=response['user']['mobile'] ?? "";
    }
  }



  void updateUserProfileApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "mobile":nameController.text.toString(),
      "email": emailController.text.toString(),
      "name":numberController.text.toString(),
    });
    final response = await ApiConfig.post(body: body, url: ApiConfig.updateUserDetailsUrl, useAuthToken: true);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['message'].toString());
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }


}
