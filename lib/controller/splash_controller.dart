import 'package:color_demo/config/routes.dart';
import 'package:get/get.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    callToNavigate();
    print("dsofgiodj");
  }
  callToNavigate() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(AppRoutes.dashboard);
    });
  }
}