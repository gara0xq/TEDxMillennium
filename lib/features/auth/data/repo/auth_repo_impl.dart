import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/source/login.dart';

import '../../domain/repo/auth_repo.dart';
import '../source/fetch_role.dart';

class AuthRepoImpl implements AuthRepo {
  Login _login;
  FetchRole _fetchRole;

  AuthRepoImpl()
    : _login = Login(FirebaseAuth.instance),
      _fetchRole = FetchRole(FirebaseFirestore.instance);

  @override
  Future<String> login(String email, String password) async {
    try {
      final userId = await _login.login(email, password);
      return _fetchRole.fetchRole(userId);
    } catch (e) {
      return "";
    }
  }
}
