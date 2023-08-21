import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final gameId = ''.obs;
  final gameTimer = ''.obs;
  final apiColorList = [].obs;
  final apiNumberList = [].obs;
  final userName = "".obs;
  final mobile = "".obs;
  final isViewResult = false.obs;
  final tabBarIndex = 0.obs;
  final amountController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final colorList = [
    const Color(0xff008000),
    const Color(0xff6868AC),
    const Color(0xffB3906C),
    const Color(0xffD65079),
    const Color(0xffE187B8),
    const Color(0xffE9435E),
    const Color(0xffECC371),
    const Color(0xff85A1AC),
    const Color(0xff85AC89),
  ].obs;
  final numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9].obs;

  @override
  void onInit() {
    gameApiFunction();
    userDetailApiFunction();
    super.onInit();
  }

  gameApiFunction() async {
    final response =
        await ApiConfig.get(url: ApiConfig.gameUrl, useAuthToken: true);
    if (response != null && response['success'] == true) {
      apiColorList.value = response['game']['options']['colors'];
      apiNumberList.value = response['game']['options']['numbers'];
    }
  }
  userDetailApiFunction() async {
    final response =
    await ApiConfig.get(url: ApiConfig.userDetailsUrl, useAuthToken: true);
    if (response != null && response['success'] == true) {
      userName.value = response['user']['name'];
      mobile.value = response['user']['mobile'];
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
