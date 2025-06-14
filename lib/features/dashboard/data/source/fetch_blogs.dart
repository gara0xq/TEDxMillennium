import 'package:cloud_firestore/cloud_firestore.dart';

class FetchBlogs {
  final FirebaseFirestore _firestore;

  FetchBlogs(this._firestore);

  Future<List<Map<String, dynamic>>> fetchBlogs() async {
    try {
      final snapshot = await _firestore.collection('blogs').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }
}
