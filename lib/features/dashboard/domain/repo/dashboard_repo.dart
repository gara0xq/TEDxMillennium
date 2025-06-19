import '../entity/blog_entity.dart';
import '../entity/team_member_entity.dart';

abstract class DashboardRepo {
  Future<List<BlogEntity>> fetchBlogs();
  Future<void> addBlog(BlogEntity blog);
  Future<void> removeBlog(BlogEntity blog);
  Future<String> uploadImage();
  Future<List<TeamMemberEntity>> fetchTeamMembers();
  Future<void> addTeamMember(TeamMemberEntity teamMember);
}
