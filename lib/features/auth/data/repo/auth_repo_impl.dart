import 'package:firebase_auth/firebase_auth.dart';

import '../../data/source/login.dart';

import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  Login _login;

  AuthRepoImpl() : _login = Login(FirebaseAuth.instance);

  @override
  Future<String> login(String email, String password) async {
    try {
      return await _login.login(email, password);
    } catch (e) {
      return "";
    }
  }
}
