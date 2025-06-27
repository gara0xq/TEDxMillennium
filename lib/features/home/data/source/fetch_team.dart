import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FetchTeam {
  final FirebaseFirestore _firestore;

  FetchTeam(this._firestore);

  Future<List<Map<String, dynamic>>> fetchTeam() async {
    try {
      final snapshot =
          await _firestore.collection('team').orderBy("name").get();
      return snapshot.docs.map((doc) {
        var data = doc.data();
        log(data["name"]);
        if (data["name"] == "Ahs") {
          data["name"] = "Ali Ahmed";
          return data;
        } else {
          return doc.data();
        }
      }).toList();
    } catch (e) {
      throw Exception("Error fetching blogs: $e");
    }
  }
}
