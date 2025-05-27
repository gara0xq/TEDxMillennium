import 'package:get/get.dart';

import '../../data/repo/home_repo_impl.dart';
import '../../domain/entity/blog_entity.dart';
import '../../domain/entity/statics_entity.dart';
import '../../domain/usecase/fetch_blogs_usecase.dart';
import '../../domain/usecase/fetch_statics_usecase.dart';

class HomeProvider extends GetxController {
  StaticsEntity statics = const StaticsEntity();
  List<BlogEntity> blogs = [];

  bool loading = false;

  final FetchStaticsUsecase _fetchStaticsUsecase;
  final FetchBlogsUsecase _fetchBlogsUsecase;

  HomeProvider()
    : _fetchStaticsUsecase = FetchStaticsUsecase(HomeRepoImpl()),
      _fetchBlogsUsecase = FetchBlogsUsecase(HomeRepoImpl());

  @override
  void onInit() {
    super.onInit();
    loading = true;
    Future.wait([fetchStatistics(), fetchBlogs()]).then((_) {
      loading = false;
      update();
    });
  }

  Future<void> fetchStatistics() async {
    statics = await _fetchStaticsUsecase.call();
  }

  Future<void> fetchBlogs() async {
    blogs = await _fetchBlogsUsecase.call();
  }
}
