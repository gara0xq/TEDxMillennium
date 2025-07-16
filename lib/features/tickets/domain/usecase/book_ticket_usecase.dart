import '../../data/model/ticket_model.dart';
import '../repo/ticket_repo.dart';

class BookTicketUsecase {
  final TicketRepo ticketRepo;

  BookTicketUsecase(this.ticketRepo);

  Future<void> call(TicketModel ticket) {
    return ticketRepo.bookTicket(ticket);
  }
}
