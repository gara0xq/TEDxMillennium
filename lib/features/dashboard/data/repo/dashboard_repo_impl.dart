import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

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

  DashboardRepoImpl()
    : _fetchBlogs = FetchBlogs(FirebaseFirestore.instance),
      _addBlog = AddBlog(FirebaseFirestore.instance),
      _removeBlog = RemoveBlog(FirebaseFirestore.instance),
      _uploadImage = UploadImage();

  @override
  Future<void> addBlog(BlogEntity blog) async {
    try {
      blog = blog as BlogModel;
      _addBlog.addBlog(blog.toJson());
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
      // final ImagePicker picker = ImagePicker();
      // final imageFile = await picker.pickImage(source: ImageSource.gallery);
      // final imageBytes = await imageFile!.readAsBytes().then((e) => e.toList());
      // final imageFilePath = imageFile.path;

      final imageWithBytesPicker = await ImagePickerWeb.getImageAsFile();
      final imageFile = imageWithBytesPicker as File;
      final imageBytes = await imageFile.readAsBytes().then((e) => e.toList());

      final imageFilePath = await imageFile.path;

      return await _uploadImage.uploadImage(imageFilePath, imageBytes);
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }
}
