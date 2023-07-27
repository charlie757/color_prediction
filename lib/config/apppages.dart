import 'package:color_demo/binding/login_binding.dart';
import 'package:color_demo/binding/otp_binding.dart';
import 'package:color_demo/binding/splash_binding.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/screens/login_screen.dart';
import 'package:color_demo/screens/otp_screen.dart';
import 'package:color_demo/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static var initialRoute = AppRoutes.splash;

  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
        binding: LoginBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.otp,
        page: () => OtpScreen(),
        binding: OtpBinding(),
        curve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 50),
        transition: Transition.fade),
  ];
}
