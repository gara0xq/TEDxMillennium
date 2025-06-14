import 'package:cloud_firestore/cloud_firestore.dart';

class RemoveBlog {
  final FirebaseFirestore _firestore;

  RemoveBlog(this._firestore);

  Future<void> removeBlog(Map<String, dynamic> blog) async {
    try {
      final docs = await _firestore.collection('blogs');
      final querySnapshot =
          await docs.where('name', isEqualTo: blog["name"]).get();
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }
}
