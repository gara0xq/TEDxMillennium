import '../repo/dashboard_repo.dart';

class UpdateStaticsUsecase {
  final DashboardRepo _repository;

  UpdateStaticsUsecase(this._repository);

  Future<void> call(Map<String, dynamic> statics) async {
    await _repository.updateStatics(statics);
  }
}
