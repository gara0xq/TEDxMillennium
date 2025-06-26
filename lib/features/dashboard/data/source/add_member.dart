import 'package:cloud_firestore/cloud_firestore.dart';

class AddMember {
  final FirebaseFirestore _firestore;

  AddMember(this._firestore);

  Future<void> addMember(Map<String, dynamic> member) async {
    try {
      _firestore.collection("members").add(member);
    } catch (e) {
      throw Exception("Error adding member: $e");
    }
  }
}
