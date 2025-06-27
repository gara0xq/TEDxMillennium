import 'package:cloud_firestore/cloud_firestore.dart';

class FetchTeam {
  final FirebaseFirestore _firestore;

  FetchTeam(this._firestore);

  Future<List<Map<String, dynamic>>> fetchTeam() async {
    try {
      final snapshot = await _firestore.collection('team').orderBy("k").get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }
}
