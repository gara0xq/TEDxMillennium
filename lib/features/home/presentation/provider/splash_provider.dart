import 'package:get/get.dart';

import '../screens/home_screen.dart';

class SplashProvider extends GetxController {
  DateTime expirationTime = DateTime(2025, 6, 28, 14);
  DateTime currentTime = DateTime.now();
  RxString timer = "".obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () => chechTime());
    super.onInit();
  }

  void chechTime() {
    currentTime = DateTime.now();
    final deff = expirationTime.difference(currentTime);
    if (deff < const Duration(seconds: 1)) {
      Get.offAll(() => HomeScreen());
      return;
    }
    timer.value =
        "${deff.inHours}:${deff.inMinutes % 60}:${(deff.inSeconds % 60) % 60}";
    Future.delayed(const Duration(seconds: 1), () => chechTime());
  }
}
