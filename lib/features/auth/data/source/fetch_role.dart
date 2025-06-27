import 'package:cloud_firestore/cloud_firestore.dart';

class FetchRole {
  final FirebaseFirestore _firestore;
  FetchRole(this._firestore);

  Future<String> fetchRole(String userId) async {
    final response = await _firestore.collection("user").doc(userId).get();
    return response.data()!["role"];
  }
}
