import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tedx/features/home/domain/entity/blog_entity.dart';

import '../model/blog_model.dart';
import '../model/statics_model.dart';
import '../source/fetch_blogs.dart';
import '../source/fetch_statics.dart';
import '../../domain/entity/statics_entity.dart';
import '../../domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final FetchStatics _fetchStatics;
  final FetchBlogs _fetchBlogs;

  HomeRepoImpl()
    : _fetchStatics = FetchStatics(FirebaseFirestore.instance),
      _fetchBlogs = FetchBlogs(FirebaseFirestore.instance);

  @override
  Future<StaticsEntity> fetchStatics() async {
    try {
      StaticsEntity statics;
      final data = await _fetchStatics.fetchStatistics();
      if (data.isNotEmpty) {
        statics = StaticsModel.fromJson(data);
        return statics;
      } else {
        throw Exception("No statistics data found");
      }
    } on FirebaseException catch (e) {
      throw Exception("Error fetching statistics: $e");
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
}
