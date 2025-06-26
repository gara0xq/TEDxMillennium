import '../entity/event_entity.dart';
import '../repo/dashboard_repo.dart';

class FetchEventUsecase {
  final DashboardRepo _dashboardRepo;

  FetchEventUsecase(this._dashboardRepo);

  Future<EventEntity> call() {
    return _dashboardRepo.fetchEvents();
  }
}
