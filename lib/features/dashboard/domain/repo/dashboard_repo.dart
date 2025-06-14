import '../entity/blog_entity.dart';

abstract class DashboardRepo {
  Future<List<BlogEntity>> fetchBlogs();
  Future<void> addBlog(BlogEntity blog);
  Future<void> removeBlog(BlogEntity blog);
  Future<String> uploadImage();
}
