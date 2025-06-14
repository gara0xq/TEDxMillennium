import 'package:cloud_firestore/cloud_firestore.dart';

class AddBlog {
  final FirebaseFirestore _firestore;

  AddBlog(this._firestore);

  Future<void> addBlog(Map<String, dynamic> blog) async {
    try {
      await _firestore.collection('blogs').add(blog);
    } catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }
}
