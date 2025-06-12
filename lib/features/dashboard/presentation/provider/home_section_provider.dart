import 'package:get/get.dart';

class HomeSectionProvider extends GetxController {
  int tapIndex = 0;

  void changeTapIndex(int index) {
    tapIndex = index;
    update();
  }
}
