import 'package:cloud_firestore/cloud_firestore.dart';

class FetchMembers {
  final FirebaseFirestore _firestore;

  FetchMembers(this._firestore);

  Future<List<Map<String, dynamic>>> fetchMembers(String committeeName) async {
    try {
      List<Map<String, dynamic>> members = [];
      final allMembers =
          await _firestore
              .collection('members')
              .where("committee", isEqualTo: committeeName)
              .get();

      for (var member in allMembers.docs) {
        members.add(member.data());
      }

      return members;
    } catch (e) {
      throw Exception("Error fetching  members: $e");
    }
  }
}
