import '../../domain/entity/event_entity.dart';

class EventModel extends EventEntity {
  EventModel({
    required String title,
    required String description,
    required String date,
    required String location,
    required bool hasEvent,
  }) : super(
         title: title,
         description: description,
         date: date,
         location: location,
         hasEvent: hasEvent,
       );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      location: json['location'] as String,
      hasEvent: json['has-event'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'location': location,
      'has-event': hasEvent,
    };
  }
}
