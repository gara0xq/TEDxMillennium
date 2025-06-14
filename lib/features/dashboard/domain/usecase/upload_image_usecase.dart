import '../repo/dashboard_repo.dart';

class UploadImageUsecase {
  final DashboardRepo _dashboardRepo;

  UploadImageUsecase(this._dashboardRepo);

  Future<String> call() async {
    return await _dashboardRepo.uploadImage();
  }
}
