import '../../domain/entity/ticket_entity.dart';

class TicketModel extends TicketEntity {
  TicketModel({
    required String name,
    required String email,
    required String phone,
    required String study,
    required String whyAttend,
  }) : super(
         name: name,
         email: email,
         phone: phone,
         study: study,
         whyAttend: whyAttend,
       );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'study': study,
      'whyAttend': whyAttend,
    };
  }
}
