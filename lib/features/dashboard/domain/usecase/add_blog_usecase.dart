import '../entity/blog_entity.dart';
import '../repo/dashboard_repo.dart';

class AddBlogUsecase {
  final DashboardRepo _dashboardRepo;

  AddBlogUsecase(this._dashboardRepo);

  Future<void> call(BlogEntity blog) {
    return _dashboardRepo.addBlog(blog);
  }
}
