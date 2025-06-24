import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedx/features/dashboard/domain/entity/team_member_entity.dart';

import '../model/team_member_model.dart';
import '../source/add_team_member.dart';
import '../source/fetch_team.dart';
import '../source/update_statics.dart';
import '../source/upload_image.dart';
import '../../domain/entity/blog_entity.dart';
import '../../domain/repo/dashboard_repo.dart';
import '../model/blog_model.dart';
import '../source/add_blog.dart';
import '../source/fetch_blogs.dart';
import '../source/remove_blog.dart';

class DashboardRepoImpl extends DashboardRepo {
  final FetchBlogs _fetchBlogs;
  final AddBlog _addBlog;
  final RemoveBlog _removeBlog;
  final UploadImage _uploadImage;
  final AddTeamMember _addTeamMember;
  final FetchTeam _fetchTeam;
  final UpdateStatics _updateStatics;

  DashboardRepoImpl()
    : _fetchBlogs = FetchBlogs(FirebaseFirestore.instance),
      _addBlog = AddBlog(FirebaseFirestore.instance),
      _removeBlog = RemoveBlog(FirebaseFirestore.instance),
      _addTeamMember = AddTeamMember(FirebaseFirestore.instance),
      _fetchTeam = FetchTeam(FirebaseFirestore.instance),
      _uploadImage = UploadImage(),
      _updateStatics = UpdateStatics(FirebaseFirestore.instance);

  @override
  Future<void> addBlog(BlogEntity blog) async {
    try {
      final blogModel = BlogModel(
        content: blog.content,
        author: blog.author,
        imageUrl: blog.imageUrl,
        slogan: blog.slogan,
      );
      _addBlog.addBlog(blogModel.toJson());
    } on FirebaseException catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }

  @override
  Future<List<BlogEntity>> fetchBlogs() async {
    try {
      List<BlogEntity> blogs = [];
      final data = await _fetchBlogs.fetchBlogs();

      if (data.isNotEmpty) {
        blogs = data.map((item) => BlogModel.fromJson(item)).toList();
        return blogs;
      } else {
        throw Exception("No blog data found");
      }
    } on FirebaseException catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }

  @override
  Future<void> removeBlog(BlogEntity blog) async {
    try {
      blog = blog as BlogModel;
      await _removeBlog.removeBlog(blog.toJson());
    } on FirebaseException catch (e) {
      throw Exception("Error removing blog: $e");
    }
  }

  @override
  Future<String> uploadImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final imageFile = await picker.pickImage(source: ImageSource.gallery);

      return await _uploadImage.uploadImage(File(imageFile!.path));
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }

  @override
  Future<void> addTeamMember(TeamMemberEntity teamMember) async {
    try {
      final member = TeamMemberModel(
        name: teamMember.name,
        role: teamMember.role,
        imageUrl: teamMember.imageUrl,
      );
      await _addTeamMember.addTeamMember(member.toJson());
    } on Exception catch (e) {
      throw Exception("Error adding team member: $e");
    }
  }

  @override
  Future<List<TeamMemberEntity>> fetchTeamMembers() async {
    try {
      return await _fetchTeam.fetchTeam().then(
        (data) => data.map((e) => TeamMemberModel.fromJson(e)).toList(),
      );
    } on Exception catch (e) {
      throw Exception("Error fetching team members: $e");
    }
  }

  @override
  Future<void> updateStatics(Map<String, dynamic> statics) async {
    try {
      await _updateStatics.updateStatics(statics);
    } on Exception catch (e) {
      throw Exception("Error updating statics: $e");
    }
  }
}
