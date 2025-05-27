import '../entity/blog_entity.dart';
import '../repo/home_repo.dart';

class FetchBlogsUsecase {
  final HomeRepo _homeRepo;

  FetchBlogsUsecase(this._homeRepo);

  Future<List<BlogEntity>> call() {
    return _homeRepo.fetchBlogs();
  }
}
