import 'package:cloud_firestore/cloud_firestore.dart';

class AddTicket {
  final FirebaseFirestore _firestore;

  AddTicket(this._firestore);

  Future<void> addTicket(Map<String, dynamic> ticket) async {
    try {
      await _firestore.collection('tickets').add(ticket);
    } catch (e) {
      throw Exception("Error adding tickets: $e");
    }
  }
}
