import 'package:get/get.dart';

import 'features/dashboard/presentation/provider/committee_section_provider.dart';
import 'features/home/presentation/provider/home_provider.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<CommitteeSectionProvider>(
      () => CommitteeSectionProvider(),
      fenix: true,
    );
  }
}
