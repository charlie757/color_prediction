import 'package:color_demo/screens/dashboard/betscreen.dart';
import 'package:color_demo/screens/dashboard/homescreen.dart';
import 'package:color_demo/screens/dashboard/profilescreen.dart';
import 'package:color_demo/screens/dashboard/walletscreen.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final screensList =
      [HomeScreen(), BetScreen(), WalletScreen(), ProfileScreen()].obs;

  final selectedIndex = 0.obs;
}
