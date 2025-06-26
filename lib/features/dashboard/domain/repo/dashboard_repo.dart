import 'package:tedx/features/dashboard/domain/entity/event_entity.dart';

import '../../data/model/member_model.dart';
import '../entity/blog_entity.dart';
import '../entity/member_entity.dart';
import '../entity/team_member_entity.dart';

abstract class DashboardRepo {
  Future<List<BlogEntity>> fetchBlogs();
  Future<void> addBlog(BlogEntity blog);
  Future<void> removeBlog(BlogEntity blog);
  Future<String> uploadImage();
  Future<List<TeamMemberEntity>> fetchTeamMembers();
  Future<void> addTeamMember(TeamMemberEntity teamMember);
  Future<void> updateStatics(Map<String, dynamic> statics);
  Future<EventEntity> fetchEvents();
  Future<List<MemberModel>> fetchMembers(String committeeName);
  Future<void> addMember(MemberEntity member, String committeeName);
}
