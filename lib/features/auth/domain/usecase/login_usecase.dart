import '../repo/auth_repo.dart';

class LoginUsecase {
  final AuthRepo _authRepo;

  LoginUsecase(this._authRepo);

  Future<String> call(String email, String password) async {
    return await _authRepo.login(email, password);
  }
}
