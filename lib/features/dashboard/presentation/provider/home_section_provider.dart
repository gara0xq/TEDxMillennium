import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repo/dashboard_repo_impl.dart';
import '../../domain/entity/blog_entity.dart';
import '../../domain/entity/team_member_entity.dart';
import '../../domain/usecase/add_team_member_usecase.dart';
import '../../domain/usecase/fetch_team_members_usecase.dart';
import '../../domain/usecase/upload_image_usecase.dart';
import '../../domain/usecase/add_blog_usecase.dart';
import '../../domain/usecase/fetch_blogs_usecase.dart';
import '../../domain/usecase/remove_blog_usecase.dart';

class HomeSectionProvider extends GetxController {
  final FetchBlogsUsecase _fetchBlogsUsecase;
  final AddBlogUsecase _addBlogUsecase;
  final RemoveBlogUsecase _removeBlogUsecase;
  final UploadImageUsecase _uploadImageUsecase;
  final FetchTeamMembersUsecase _fetchTeamMembersUsecase;
  final AddTeamMemberUsecase _addTeamMemberUsecase;

  HomeSectionProvider()
    : _fetchBlogsUsecase = FetchBlogsUsecase(DashboardRepoImpl()),
      _addBlogUsecase = AddBlogUsecase(DashboardRepoImpl()),
      _removeBlogUsecase = RemoveBlogUsecase(DashboardRepoImpl()),
      _uploadImageUsecase = UploadImageUsecase(DashboardRepoImpl()),
      _fetchTeamMembersUsecase = FetchTeamMembersUsecase(DashboardRepoImpl()),
      _addTeamMemberUsecase = AddTeamMemberUsecase(DashboardRepoImpl());

  final authorController = TextEditingController();
  final sloganController = TextEditingController();
  final contentController = TextEditingController();

  final memberNameController = TextEditingController();
  final roleController = TextEditingController();

  int tapIndex = 0;
  bool loading = true;
  List<BlogEntity> blogs = [];
  List<TeamMemberEntity> teamMembers = [];
  String blogImageUrl = '';
  String memberImageUrl = '';
  bool loadingImage = false;

  @override
  void onInit() {
    Future.wait([fetchBlogs(), fetchTeamMembers()]).then((_) {
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
      if (blogImageUrl.isNotEmpty) {
        await _addBlogUsecase.call(
          BlogEntity(
            author: authorController.text,
            slogan: sloganController.text,
            content: contentController.text,
            imageUrl: blogImageUrl,
          ),
        );
      }
      await fetchBlogs();
      blogImageUrl = '';
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

  Future<void> uploadImage(bool isBlog) async {
    loadingImage = true;
    update();
    log("loading");
    final response = await _uploadImageUsecase.call().then((e) {
      loadingImage = false;
      log("uploaded : $e");
      return e;
    });
    isBlog ? blogImageUrl = response : memberImageUrl = response;

    update();
  }

  Future<void> addTeamMember() async {
    try {
      if (memberImageUrl.isNotEmpty) {
        await _addTeamMemberUsecase.call(
          TeamMemberEntity(
            name: memberNameController.text,
            role: roleController.text,
            imageUrl: memberImageUrl,
          ),
        );
      }
      await fetchTeamMembers();
      memberImageUrl = '';
      update();
    } on Exception catch (e) {
      throw Exception("Error adding team member: $e");
    }
  }

  Future<void> fetchTeamMembers() async {
    try {
      teamMembers = await _fetchTeamMembersUsecase.call();
    } on Exception catch (e) {
      throw Exception("Error fetching team members: $e");
    }
  }
}
