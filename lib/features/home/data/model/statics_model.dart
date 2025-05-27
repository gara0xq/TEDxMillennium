import '../../domain/entity/statics_entity.dart';

class StaticsModel extends StaticsEntity {
  const StaticsModel({
    required String headerTitle,
    required String headerDescription,
    required bool hasSignup,
    required bool hasLogin,
    required String date,
    required String eventDescription,
    required int ticketPrice,
    required String location,
    required bool hasEvent,
    required String eventTitle,
    required String aboutUs,
  }) : super(
         headerTitle: headerTitle,
         headerDescription: headerDescription,
         hasSignup: hasSignup,
         hasLogin: hasLogin,
         date: date,
         eventDescription: eventDescription,
         ticketPrice: ticketPrice,
         location: location,
         hasEvent: hasEvent,
         eventTitle: eventTitle,
         aboutUs: aboutUs,
       );

  factory StaticsModel.fromJson(List<Map<String, dynamic>> json) {
    return StaticsModel(
      headerTitle: json[3]['title'] ?? '',
      headerDescription: json[3]['description '] ?? '',
      hasSignup: json[1]['has-signup'] ?? false,
      hasLogin: json[1]['has-login'] ?? false,
      date: json[2]['date'],
      eventDescription: json[2]['desription'] ?? '',
      ticketPrice: json[2]['ticket_price'] ?? 0.0,
      location: json[2]['location'] ?? '',
      hasEvent: json[2]['has-event'] ?? false,
      eventTitle: json[2]['title'] ?? '',
      aboutUs: json[0]['description'] ?? '',
    );
  }
}
