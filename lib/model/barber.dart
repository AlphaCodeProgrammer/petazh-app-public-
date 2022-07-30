
class Barber {
  final String id;
  final String barberName;
  final double rating;
  final String barberPhoto;
  final bool forMen;
  final String barberCity;
  final String barberArea;

  const Barber({
    required this.id,
    required this.barberName,
    required this.rating,
    required this.barberPhoto,
    required this.forMen,
    required this.barberCity,
    required this.barberArea,
  });
}

class BarberDetails {
  final String id;
  final String barberName;
  final double rating;
  final String licenseNumber;
  final bool Men;
  final String barberCity;
  final String barberArea;
  final String barberAddress;
  final String barberPhoto;
  final String show;
  final String ban;
  final List<dynamic> stylists;

  const BarberDetails({
    required this.id,
    required this.barberName,
    required this.rating,
    required this.licenseNumber,
    required this.Men,
    required this.barberCity,
    required this.barberArea,
    required this.barberAddress,
    required this.barberPhoto,
    required this.show,
    required this.ban,
    required this.stylists,
  });
}
