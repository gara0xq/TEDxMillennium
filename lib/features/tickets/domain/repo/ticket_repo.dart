import '../../data/model/ticket_model.dart';

abstract class TicketRepo {
  Future<void> bookTicket(TicketModel ticket);
}
