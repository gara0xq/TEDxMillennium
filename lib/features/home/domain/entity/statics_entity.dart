class StaticsEntity {
  final String headerTitle;
  final String headerDescription;
  final bool hasSignup;
  final bool hasLogin;
  final String? date;
  final String eventDescription;
  final int ticketPrice;
  final String location;
  final bool hasEvent;
  final String eventTitle;
  final String aboutUs;

  const StaticsEntity({
    this.headerTitle = '',
    this.headerDescription = '',
    this.hasSignup = true,
    this.hasLogin = true,
    this.date = '',
    this.eventDescription = '',
    this.ticketPrice = 0,
    this.location = '',
    this.hasEvent = true,
    this.eventTitle = '',
    this.aboutUs = '',
  });
}
