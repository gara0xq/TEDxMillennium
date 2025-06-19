import '../entity/team_member_entity.dart';
import '../repo/dashboard_repo.dart';

class FetchTeamMembersUsecase {
  final DashboardRepo _dashboardRepo;

  FetchTeamMembersUsecase(this._dashboardRepo);

  Future<List<TeamMemberEntity>> call() {
    return _dashboardRepo.fetchTeamMembers();
  }
}
