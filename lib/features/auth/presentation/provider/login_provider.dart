import 'package:get/get.dart';

import '../../data/repo/auth_repo_impl.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends GetxController {
  LoginUsecase _loginUseCase;

  LoginProvider() : _loginUseCase = LoginUsecase(AuthRepoImpl());
  RxString loginState = "ss".obs;

  Future<void> login(String email, String password) async {
    final userId = await _loginUseCase.call(email, password);
    loginState.value = userId;
    if (userId.isNotEmpty) {
      Get.offAllNamed("/dashboard");
    }
    update();
  }
}
