import '../entity/statics_entity.dart';
import '../repo/home_repo.dart';

class FetchStaticsUsecase {
  final HomeRepo _homeRepo;

  FetchStaticsUsecase(this._homeRepo);

  Future<StaticsEntity> call() {
    return _homeRepo.fetchStatics();
  }
}
