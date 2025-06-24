import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateStatics {
  final FirebaseFirestore _firestore;

  UpdateStatics(this._firestore);

  Future<void> updateStatics(Map<String, dynamic> statics) async {
    try {
      final docRef = _firestore.collection('statics').doc('event-section');
      await docRef.update(statics);
    } catch (e) {
      throw Exception("Error updating statics: $e");
    }
  }
}
