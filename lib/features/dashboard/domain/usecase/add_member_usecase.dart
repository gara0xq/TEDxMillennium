import '../entity/member_entity.dart';

import '../repo/dashboard_repo.dart';

class AddMemberUsecase {
  final DashboardRepo _dashboardRepo;

  AddMemberUsecase(this._dashboardRepo);

  Future<void> call(MemberEntity member, String committeeName) {
    return _dashboardRepo.addMember(member, committeeName);
  }
}
