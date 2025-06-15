import 'dart:developer';

import 'package:flutter/material.dart';
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

  final authorController = TextEditingController();
  final sloganController = TextEditingController();
  final contentController = TextEditingController();
  int tapIndex = 0;
  bool loading = true;
  List<BlogEntity> blogs = [];
  String imageUrl = '';
  bool loadingImage = false;

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

  Future<void> addBlog() async {
    try {
      if (imageUrl.isNotEmpty) {
        await _addBlogUsecase.call(
          BlogEntity(
            author: authorController.text,
            slogan: sloganController.text,
            content: contentController.text,
            imageUrl: imageUrl,
          ),
        );
      }
      await fetchBlogs();
      update();
    } catch (e) {
      print("Error adding blog: $e");
    }
  }

  Future<void> removeBlog(BlogEntity blog) async {
    try {
      await _removeBlogUsecase.call(blog);
      await fetchBlogs();
      update();
    } catch (e) {
      print("Error removing blog: $e");
    }
  }

  Future<void> uploadImage() async {
    loadingImage = true;
    update();
    log("loading");
    imageUrl = await _uploadImageUsecase.call().then((e) {
      loadingImage = false;
      log("uploaded : $e");
      return e;
    });
    update();
  }
}
