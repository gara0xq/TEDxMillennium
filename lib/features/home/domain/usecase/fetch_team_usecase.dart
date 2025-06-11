import '../entity/team_member_entity.dart';
import '../repo/home_repo.dart';

class FetchTeamUsecase {
  final HomeRepo _homeRepo;

  FetchTeamUsecase(this._homeRepo);

  Future<List<TeamMemberEntity>> call() async {
    return await _homeRepo.fetchTeam();
  }
}
