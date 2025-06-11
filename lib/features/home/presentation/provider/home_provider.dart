import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/repo/home_repo_impl.dart';
import '../../domain/entity/blog_entity.dart';
import '../../domain/entity/statics_entity.dart';
import '../../domain/entity/team_member_entity.dart';
import '../../domain/usecase/fetch_blogs_usecase.dart';
import '../../domain/usecase/fetch_statics_usecase.dart';
import '../../domain/usecase/fetch_team_usecase.dart';

class HomeProvider extends GetxController {
  StaticsEntity statics = const StaticsEntity();
  List<BlogEntity> blogs = [];
  List<TeamMemberEntity> team = [];
  final eventKey = GlobalKey();

  bool loading = false;

  final FetchStaticsUsecase _fetchStaticsUsecase;
  final FetchBlogsUsecase _fetchBlogsUsecase;
  final FetchTeamUsecase _fetchTeamUsecase;

  HomeProvider()
    : _fetchStaticsUsecase = FetchStaticsUsecase(HomeRepoImpl()),
      _fetchBlogsUsecase = FetchBlogsUsecase(HomeRepoImpl()),
      _fetchTeamUsecase = FetchTeamUsecase(HomeRepoImpl());

  @override
  void onInit() {
    super.onInit();
    loading = true;
    Future.wait([fetchStatistics(), fetchBlogs(), fetchTeam()]).then((_) {
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

  Future<void> fetchTeam() async {
    team = await _fetchTeamUsecase.call();
  }
}
