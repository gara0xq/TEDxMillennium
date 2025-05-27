import '../entity/blog_entity.dart';
import '../entity/statics_entity.dart';

abstract class HomeRepo {
  Future<StaticsEntity> fetchStatics();
  Future<List<BlogEntity>> fetchBlogs();
}
