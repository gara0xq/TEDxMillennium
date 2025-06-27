import 'package:tedx/features/dashboard/data/model/member_model.dart';
import '../repo/dashboard_repo.dart';

class FetchMemberUseCase {
  final DashboardRepo _dashboardRepo;

  FetchMemberUseCase(this._dashboardRepo);

  Future<List<MemberModel>> call(String committeeName) {
    return _dashboardRepo.fetchMembers(committeeName);
  }
}
