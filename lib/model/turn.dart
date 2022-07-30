class Turn {
  final String id;
  final String barberName;
  final String requestDate;
  final bool Accepted;
  final bool finished;
  final bool onlinePaid;
  final String barberPhoto;
  final double totalServicesPrice;

  const Turn({
    required this.id,
    required this.barberName,
    required this.requestDate,
    required this.Accepted,
    required this.finished,
    required this.onlinePaid,
    required this.barberPhoto,
    required this.totalServicesPrice,
  });
}

class TurnDetails {
  final String id;
  final dynamic turnDate;
  final String stylistName;
  final dynamic userChanged;
  final dynamic stylistChanged;
  final String requestDate;
  final bool absentUser;
  final List<dynamic> services;
  final bool Accepted;
  final bool show;
  final List<dynamic> modelImages;
  final bool rated;
  final bool finished;
  final String endTime;
  final bool onlinePaid;
  final bool checkedOut;
  final bool offReferral;
  final String offMoocutCode;
  final String barberId;
  final String userId;
  final String barberName;
  final String stylistId;
  final String textToStylist;
  final double totalServicesPrice;
  final bool selfAdded;
  final String username;
  final String stylistPhoto;

  const TurnDetails(
      {required this.id,
      required this.turnDate,
      required this.stylistName,
      required this.userChanged,
      required this.stylistChanged,
      required this.requestDate,
      required this.absentUser,
      required this.services,
      required this.Accepted,
      required this.show,
      required this.modelImages,
      required this.rated,
      required this.finished,
      required this.endTime,
      required this.onlinePaid,
      required this.checkedOut,
      required this.offReferral,
      required this.offMoocutCode,
      required this.barberId,
      required this.userId,
      required this.barberName,
      required this.stylistId,
      required this.textToStylist,
      required this.totalServicesPrice,
      required this.selfAdded,
      required this.username,
      required this.stylistPhoto});
}
