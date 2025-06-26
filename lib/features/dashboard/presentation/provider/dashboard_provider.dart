import 'package:get/get.dart';

class DashboardProvider extends GetxController {
  RxString currentScreen = 'gd'.obs;

  void changeScreen(String screen) {
    currentScreen.value = screen;
  }
}
