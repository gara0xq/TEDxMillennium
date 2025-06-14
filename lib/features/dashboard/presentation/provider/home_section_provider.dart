import 'dart:developer';
import 'package:get/get.dart';

import '../../data/repo/dashboard_repo_impl.dart';
import '../../domain/entity/blog_entity.dart';
import '../../domain/usecase/upload_image_usecase.dart';
import '../../domain/usecase/add_blog_usecase.dart';
import '../../domain/usecase/fetch_blogs_usecase.dart';
import '../../domain/usecase/remove_blog_usecase.dart';

class HomeSectionProvider extends GetxController {
  final FetchBlogsUsecase _fetchBlogsUsecase;
  final AddBlogUsecase _addBlogUsecase;
  final RemoveBlogUsecase _removeBlogUsecase;
  final UploadImageUsecase _uploadImageUsecase;

  HomeSectionProvider()
    : _fetchBlogsUsecase = FetchBlogsUsecase(DashboardRepoImpl()),
      _addBlogUsecase = AddBlogUsecase(DashboardRepoImpl()),
      _removeBlogUsecase = RemoveBlogUsecase(DashboardRepoImpl()),
      _uploadImageUsecase = UploadImageUsecase(DashboardRepoImpl());

  int tapIndex = 0;
  bool loading = true;
  List<BlogEntity> blogs = [];
  String imageUrl = '';
  @override
  void onInit() {
    Future.wait([fetchBlogs()]).then((_) {
      loading = false;
      update();
    });
    super.onInit();
  }

  void changeTapIndex(int index) {
    tapIndex = index;
    update();
  }

  Future<void> fetchBlogs() async {
    try {
      blogs = await _fetchBlogsUsecase.call();
    } catch (e) {
      print("Error fetching blogs: $e");
    }
  }

  Future<void> addBlog(String auther, String slogan, String content) async {
    try {
      if (imageUrl.isNotEmpty) {
        await _addBlogUsecase.call(
          BlogEntity(
            author: auther,
            slogan: slogan,
            content: content,
            imageUrl: imageUrl,
          ),
        );
        log("Blog added successfully");
      }
      log("No Image Uploaded");
      await fetchBlogs();
      update();
    } catch (e) {
      print("Error adding blog: $e");
    }
  }

  Future<void> removeBlog(BlogEntity blog) async {
    try {
      await _removeBlogUsecase.call(blog);
      log("Blog removed successfully");
      await fetchBlogs();
      update();
    } catch (e) {
      print("Error removing blog: $e");
    }
  }

  Future<void> uploadImage() async {
    imageUrl = await _uploadImageUsecase.call();
    log(imageUrl);
  }
}
