import '../entity/team_member_entity.dart';
import '../repo/dashboard_repo.dart';

class AddTeamMemberUsecase {
  final DashboardRepo _dashboardRepo;

  AddTeamMemberUsecase(this._dashboardRepo);

  Future<void> call(TeamMemberEntity teamMember) {
    return _dashboardRepo.addTeamMember(teamMember);
  }
}
