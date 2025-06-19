import 'package:cloud_firestore/cloud_firestore.dart';

class AddTeamMember {
  final FirebaseFirestore _firestore;

  AddTeamMember(this._firestore);

  Future<void> addTeamMember(Map<String, dynamic> teamMember) async {
    try {
      await _firestore.collection('team').add(teamMember);
    } catch (e) {
      throw Exception("Error adding team member: $e");
    }
  }
}
