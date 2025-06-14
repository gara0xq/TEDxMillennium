import '../entity/blog_entity.dart';
import '../repo/dashboard_repo.dart';

class FetchBlogsUsecase {
  final DashboardRepo _dashboardRepo;

  FetchBlogsUsecase(this._dashboardRepo);

  Future<List<BlogEntity>> call() {
    return _dashboardRepo.fetchBlogs();
  }
}
