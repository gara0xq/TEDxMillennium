import 'package:firebase_auth/firebase_auth.dart';

class Login {
  FirebaseAuth _auth;
  Login(this._auth);

  Future<String> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid ?? '';
    } on FirebaseAuthException catch (e) {
      throw Exception("Login failed: ${e.message}");
    }
  }
}
