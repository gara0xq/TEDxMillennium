import 'package:cloud_firestore/cloud_firestore.dart';

class FetchEvent {
  final FirebaseFirestore _firestore;

  FetchEvent(this._firestore);

  Future<Map<String, dynamic>> fetchEvents() async {
    try {
      final response =
          await _firestore.collection('statics').doc("event-section").get();
      return response.data() ?? {};
    } catch (e) {
      throw Exception("Error fetching events: $e");
    }
  }
}
