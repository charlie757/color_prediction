import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
}
