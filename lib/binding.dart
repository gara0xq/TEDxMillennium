import 'package:get/get.dart';

import 'features/home/presentation/provider/home_provider.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
  }
}
