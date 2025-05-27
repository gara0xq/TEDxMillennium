import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FetchStatics {
  final FirebaseFirestore _firestore;
  FetchStatics(this._firestore);
  Future<List<Map<String, dynamic>>> fetchStatistics() async {
    try {
      List<Map<String, dynamic>> statisticsList = [];
      final snapshot = await _firestore.collection('statics').get();
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) {
          // log('${doc.id} : ${doc.data()}');
          statisticsList.add(doc.data());
        });
        return statisticsList;
      } else {
        return [];
      }
    } catch (e) {
      log('Error fetching statistics: $e');
      return [];
    }
  }
}
