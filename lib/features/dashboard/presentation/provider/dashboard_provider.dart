import 'dart:developer';

import 'package:get/get.dart';

class DashboardProvider extends GetxController {
  RxString currentScreen = 'home'.obs;

  void changeScreen(String screen) {
    log(currentScreen.value);
    currentScreen.value = screen;
  }
}
