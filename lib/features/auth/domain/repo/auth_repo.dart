abstract class AuthRepo {
  Future<String> login(String email, String password);
}
