import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repo/ticket_repo.dart';
import '../model/ticket_model.dart';
import '../source/add_ticket.dart';

class TicketRepoImpl extends TicketRepo {
  final AddTicket _addTicket;

  TicketRepoImpl() : _addTicket = AddTicket(FirebaseFirestore.instance);

  @override
  Future<void> bookTicket(TicketModel ticket) async {
    try {
      await _addTicket.addTicket(ticket.toMap());
    } catch (e) {
      throw Exception("Failed to book ticket: $e");
    }
  }
}
