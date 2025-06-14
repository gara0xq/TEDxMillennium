import '../entity/blog_entity.dart';
import '../repo/dashboard_repo.dart';

class RemoveBlogUsecase {
  final DashboardRepo _dashboardRepo;

  RemoveBlogUsecase(this._dashboardRepo);

  Future<void> call(BlogEntity blog) {
    return _dashboardRepo.removeBlog(blog);
  }
}
